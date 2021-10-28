# Build silex-front
FROM node:16.10 as silex-front

# Skip husky hooks install
ENV HUSKY_SKIP_INSTALL=1

WORKDIR /usr/src/app
COPY ./silex-front/package.json ./silex-front/yarn.lock ./
RUN yarn install --frozen-lockfile
COPY ./silex-front ./
RUN yarn build

# -----------------------------------------

FROM nginx:alpine

USER root

WORKDIR /opt

RUN apk add --no-cache --virtual .build-deps git

# Get Kitsu
ARG KITSU_VERSION
RUN git clone -b "${KITSU_VERSION}-build" --single-branch --depth 1 https://github.com/cgwire/kitsu\
    && apk --purge del .build-deps

# Copy the built React app from silex-front
COPY --from=silex-front /usr/src/app/build /opt/silex/silex-front

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./includes/ /etc/nginx/includes

# SSL
COPY ./nginx-selfsigned.crt /etc/ssl/certs/
COPY ./nginx-selfsigned.key /etc/ssl/private/
