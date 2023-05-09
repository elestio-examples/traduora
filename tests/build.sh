sed -i "s~COPY webapp webapp~COPY webapp webapp\n COPY README.md /app/~g" ./Dockerfile

docker build . --tag elestio4test/traduora:latest