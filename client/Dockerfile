FROM node:20-bullseye

WORKDIR /app

# Copy package files first for better caching
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install --frozen-lockfile

# Then copy the rest of the application
COPY . .

CMD ["yarn", "start"]