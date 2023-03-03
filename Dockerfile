# Dependencies
FROM node:16-alpine3.16 AS deps

COPY package.json yarn.lock* ./
RUN yarn install --frozen-lockfile --prod

ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-static /tini
RUN chmod +x /tini


# Builder
FROM node:16-alpine3.16 AS builder

WORKDIR /app

COPY package.json yarn.lock* ./
RUN yarn install --frozen-lockfile

COPY . .
RUN yarn build


# Runner
FROM gcr.io/distroless/nodejs:16
ENV NODE_ENV production

WORKDIR /app

COPY --from=deps --chown=nonroot:nonroot /tini /tini
COPY --from=deps --chown=nonroot:nonroot /node_modules ./node_modules
COPY --from=builder --chown=nonroot:nonroot /app/dist ./dist
COPY --from=builder --chown=nonroot:nonroot /app/package.json ./package.json

USER nonroot

ENTRYPOINT [ "/tini", "--", "/nodejs/bin/node" ]
CMD ["/app/dist/index.js"]
