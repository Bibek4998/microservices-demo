ENV NODE_ENV=development \
    NODE_PATH=/usr/src/app/node_modules \
    npm_config_unsafe_perm=true
WORKDIR /usr/src/app
RUN apk update
&& apk add --no-cache git python3 make g++
&& rm -rf /var/cache/apk/*

COPY package.json package-lock.json* ./

RUN rm -rf node_modules /usr/src/app/node_modules/.staging /root/.npm || true
&& npm cache clean --force
&& npm ci --prefer-offline --no-audit --progress=false

COPY . .

VOLUME /tmp/specs

ENTRYPOINT ["/usr/src/app/node_modules/dredd/bin/dredd"]
