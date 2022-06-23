FROM alpine:3.7

RUN apk --no-cache add curl tzdata
ENV TZ=Asia/Kuala_Lumpur

ADD *.sh /
RUN chmod +x /*.sh

ENTRYPOINT ["/start.sh"]
CMD [""]
