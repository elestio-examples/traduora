sed -i "s~COPY --from=builder /opt/traduora/dist/ /opt/traduora/~COPY --from=builder /wait /docker-entrypoint.sh /docker-entrypoint.compose.sh ./README.md ./\n\nCOPY --from=builder /opt/traduora/dist/ /opt/traduora/~g" ./Dockerfile

docker build . --tag elestio4test/traduora:latest