FROM node:20-alpine

WORKDIR /app

RUN apk add --no-cache libc6-compat

# Copy dependency manifests
COPY package.json package-lock.json* ./

# Install node dependencies
RUN npm install

# Copy application source
COPY . .

ENV PORT=3000
ENV HOSTNAME="0.0.0.0"

EXPOSE 3000

CMD ["npm", "run", "dev"]
