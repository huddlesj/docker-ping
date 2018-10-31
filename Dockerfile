FROM alpine:3.5

RUN groupadd -g 9000 pinguser && \
    useradd -r -u 9000 -g pinguser pinguser
USER appuser

COPY ping /

HEALTHCHECK --interval=5s --timeout=3s \
    CMD ps aux | grep '[s]h ping' || exit 1
    
CMD ["sh", "ping"]
