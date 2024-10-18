FROM alpine:latest

RUN apk update && apk upgrade && \
    apk add --no-cache xfce4 neofetch xfce4-terminal x11vnc xvfb supervisor sudo git && \
    addgroup -S alpine && adduser -S alpine -G alpine && \
    echo "alpine:alpine" | chpasswd && \
    echo "alpine ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

COPY supervisord.conf /etc/supervisord.conf

USER alpine
ENV USER=alpine DISPLAY=:1 LANG=en_US.UTF-8

EXPOSE 5900 6080

CMD ["supervisord", "-c", "/etc/supervisord.conf"]
