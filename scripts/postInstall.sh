#set env vars
set -o allexport; source .env; set +o allexport;

#wait until the server is ready
echo "Waiting for software to be ready ..."
sleep 40s;

#register the local server in the web ui
target=$(docker-compose port traduora 8080)


curl http://$target/api/v1/auth/signup \
  -H authority: $target \
  -H 'accept: application/json, text/plain, */*' \
  -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7,he;q=0.6' \
  -H 'content-type: application/json' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36' \
  --data-raw '{"name":"root","email":"'"${ADMIN_EMAIL}"'","password":"'"${ADMIN_PASSWORD}"'"}' \
  --compressed

  echo "Install finished"