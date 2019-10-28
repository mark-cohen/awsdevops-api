FROM node:10.16.3-alpine

# needs access to aws cli to retrieve encrypted db creds:
ENV AWS_CLI_VERSION 1.16.260

RUN apk --no-cache update && \
    apk --no-cache add python py-pip py-setuptools ca-certificates groff less && \
    pip --no-cache-dir install awscli==${AWS_CLI_VERSION} && \
    rm -rf /var/cache/apk/*

RUN mkdir -p /usr/src/api
WORKDIR /usr/src/api
COPY . .

RUN chmod +x ./entrypoint.sh

# run script once container is created:
ENTRYPOINT ["./entrypoint.sh"]
CMD ["node", "."]