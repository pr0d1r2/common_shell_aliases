function https_serve() {
  local https_serve_DIR
  local https_serve_ADDRESS
  case $PORT in
    [1-9][0-9][0-9][0-9] | [1-9][0-9][0-9][0-9][0-9] )
      local https_serve_PORT=$PORT
      ;;
    *)
      local https_serve_PORT=8472
      ;;
  esac
  for https_serve_DIR in $@
  do
    if [ -d $https_serve_DIR ]; then
      https_serve_DIR=`pwd -P`
      if [ ! -f $https_serve_DIR.crt ]; then
        openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout $https_serve_DIR.key -out $https_serve_DIR.crt
      fi
      if [ -f $https_serve_DIR.nginx.pid ]; then
        kill `cat $https_serve_DIR.nginx.pid`
        rm -f $https_serve_DIR.nginx.pid
        sleep 2
      fi
      case `uname` in
        Darwin)
          local https_serve_MIME="/usr/local/etc/nginx/mime.types"
          local https_serve_EVENT="kqueue"
          local https_serve_USER_DIRECTIVE=""
          ;;
        *)
          local https_serve_MIME="/etc/nginx/mime.types"
          local https_serve_EVENT="epoll"
          local https_serve_USER_DIRECTIVE="user nobody nobody; "
          ;;
      esac

      echo "
${https_serve_USER_DIRECTIVE}
pid $https_serve_DIR.nginx.pid;
worker_processes 2;

events {
  worker_connections 1024;
  use $https_serve_EVENT;
}

http {
  include $https_serve_MIME;

  server {
    listen $https_serve_PORT default_server;
    ssl on;
    ssl_ciphers 'EECDH+AESGCM:EDH+AESGCM:ECDHE-RSA-AES128-GCM-SHA256:AES256+EECDH:DHE-RSA-AES128-GCM-SHA256:AES256+EDH:ECDHE-RSA-AES256-GCM-SHA384:DHE-RSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-SHA384:ECDHE-RSA-AES128-SHA256:ECDHE-RSA-AES256-SHA:ECDHE-RSA-AES128-SHA:DHE-RSA-AES256-SHA256:DHE-RSA-AES128-SHA256:DHE-RSA-AES256-SHA:DHE-RSA-AES128-SHA:ECDHE-RSA-DES-CBC3-SHA:EDH-RSA-DES-CBC3-SHA:AES256-GCM-SHA384:AES128-GCM-SHA256:AES256-SHA256:AES128-SHA256:AES256-SHA:AES128-SHA:DES-CBC3-SHA:HIGH:!aNULL:!eNULL:!EXPORT:!DES:!MD5:!PSK:!RC4';
    ssl_protocols TLSv1 TLSv1.1 TLSv1.2;

    root $https_serve_DIR;
    index index.html index.htm;

    server_name  _;

    ssl_certificate $https_serve_DIR.crt;
    ssl_certificate_key $https_serve_DIR.key;

    proxy_read_timeout 86400;

    location / {
      try_files \$uri \$uri/ =404;
      autoindex on;
      proxy_set_header  Host \$host;
      auth_basic           'closed site';
      auth_basic_user_file $https_serve_DIR.htpasswd;
    }
  }
}
" > $https_serve_DIR.nginx.conf
      nginx -t -c $https_serve_DIR.nginx.conf || return $?

      local https_serve_USERNAME=`pwgen 64 1`
      local https_serve_PASSWORD=`pwgen 64 1`

      echo $https_serve_PASSWORD | htpasswd -i -c $https_serve_DIR.htpasswd $https_serve_USERNAME

      nginx -c $https_serve_DIR.nginx.conf || return $?

      for https_serve_ADDRESS in `ifconfig | grep 'inet ' | sed -e "s/inet /|/" -e "s/ netmask/|/" | cut -f 2 -d '|'`
      do
        echo "https://$https_serve_USERNAME:$https_serve_PASSWORD@$https_serve_ADDRESS:$https_serve_PORT/"
      done
    fi
  done
}

