sed -i "s~COPY --from=builder /wait /docker-entrypoint.sh /docker-entrypoint.compose.sh ./~COPY --from=builder /wait /docker-entrypoint.sh /docker-entrypoint.compose.sh ./\n\nCOPY README.md ./~g" ./Dockerfile

docker build . --tag elestio4test/traduora:latest