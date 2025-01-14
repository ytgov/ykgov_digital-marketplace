FROM docker.io/node:10-jessie
COPY . /usr/app
WORKDIR /usr/app
RUN npm install
ARG PATH_PREFIX
ARG NODE_ENV
ARG SHOW_TEST_INDICATOR
RUN npm run front-end:build
RUN npm run back-end:build
RUN chmod -R 775 /usr/app
RUN chown -R node:root /usr/app
EXPOSE 3000
CMD npm start
