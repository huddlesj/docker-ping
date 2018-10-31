FROM centos:7

RUN groupadd -g 999 pinguser && \
    useradd -r -u 999 -g pinguser pinguser
    
USER pinguser

COPY ping /

HEALTHCHECK --interval=5s --timeout=3s \
    CMD ps aux | grep '[s]h ping' || exit 1
    
CMD ["sh", "ping"]
