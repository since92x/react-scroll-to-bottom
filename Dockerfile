FROM node:alpine

RUN apk update && \
    apk upgrade && \
    apk add --no-cache bash git openssh

ENV PORT=80
EXPOSE 80
RUN npm install serve@11.3.0 -g
WORKDIR /web/
ENTRYPOINT ["npx", "--no-install", "serve", "-c", "serve-test.json", "-p", "80", "/web/"]

ADD serve-test.json /web/
ADD __tests__/ /web/__tests__/
ADD packages/component/dist/react-scroll-to-bottom.development.js /web/packages/component/dist/
ADD packages/testharness/dist/testharness.js /web/packages/testharness/dist/
