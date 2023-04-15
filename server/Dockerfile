FROM node:12

WORKDIR /app

# yarn already installed
# RUN npm install --global yarn@1.22.4

# Copy package.json into the container
COPY package.json yarn.lock ./

# Install deps
RUN yarn install --frozen-lockfile

# Install PostgreSQL and Redis clients if they weren't installed via deps
RUN apt-get update && apt-get install -y postgresql-client redis-tools

COPY . .

CMD ["yarn", "start"]
