FROM node:20-bullseye

WORKDIR /app

# Copy package.json into the container
COPY package.json yarn.lock ./

# Install deps
RUN yarn install --frozen-lockfile

# Install PostgreSQL and Redis clients
RUN apt-get update && apt-get install -y postgresql-client redis-tools

COPY . .

CMD ["yarn", "start"]