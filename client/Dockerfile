FROM node:12

WORKDIR /app

COPY package.json yarn.lock ./
COPY . ./

RUN yarn
RUN yarn install

CMD ["yarn", "start"]
