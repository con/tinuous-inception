FROM alpine:latest

# Create a timestamp file to make each build unique
RUN echo "Built at: $(date -u '+%Y-%m-%d %H:%M:%S UTC')" > /timestamp.txt && \
    cat /timestamp.txt

# Add a simple healthcheck script
RUN echo '#!/bin/sh' > /healthcheck.sh && \
    echo 'cat /timestamp.txt' >> /healthcheck.sh && \
    chmod +x /healthcheck.sh

CMD ["/healthcheck.sh"]
