FROM node:19

WORKDIR /app

COPY package.json yarn.lock ./
COPY . ./

RUN yarn
RUN yarn install

CMD ["yarn", "start"]
