set env vars
set -o allexport; source .env; set +o allexport;

mkdir -p ./data
chown -R 1000:1000 ./data

echo "Waiting for software to be ready ..."
sleep 10s;