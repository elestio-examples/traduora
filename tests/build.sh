sed -i "s~COPY --from=builder /wait /docker-entrypoint.sh /docker-entrypoint.compose.sh ./~COPY --from=builder /wait /docker-entrypoint.sh /docker-entrypoint.compose.sh /README.md ./~g" ./Dockerfile

docker build . --tag elestio4test/traduora:latest