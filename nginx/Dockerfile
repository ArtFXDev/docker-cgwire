# -----------------------------------------
# SILEX-FRONT

FROM node:16.10 as silex-front

# Skip husky hooks install
ENV HUSKY_SKIP_INSTALL=1

WORKDIR /usr/src/app

# First copy the lock file so the step is cached if dependencies didn't change
COPY ./silex-front/package.json ./silex-front/yarn.lock ./

# Install dependencies
RUN yarn install --frozen-lockfile

# Copy the rest of the repository
COPY ./silex-front ./

# Build the React application
RUN yarn build
# -----------------------------------------

# -----------------------------------------
# NGINX

FROM nginx:alpine

WORKDIR /opt

# Install package dependencies (git)
RUN apk --update add --no-cache --virtual .build-deps git

# Disable git warning on detached head
RUN git config --global advice.detachedHead false

# Get Kitsu
ARG KITSU_VERSION
RUN git clone -b "${KITSU_VERSION}-build" --single-branch --depth 1 https://github.com/cgwire/kitsu\
    && apk --purge del .build-deps

# Copy the built React app from silex-front
COPY --from=silex-front /usr/src/app/build /opt/silex/silex-front

COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./nginx/includes/ /etc/nginx/includes
# -----------------------------------------
