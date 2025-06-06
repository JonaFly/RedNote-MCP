# Generated by https://smithery.ai. See: https://smithery.ai/docs/config#dockerfile
FROM node:lts-alpine

# Create app directory
WORKDIR /app

# Copy package and source
COPY package.json package-lock.json tsconfig.json ./
COPY src ./src
COPY README.md LICENSE ./

# Install dependencies and build
RUN npm install --ignore-scripts && npm run build

# Production environment
ENV NODE_ENV=production

# Default command: start the server in stdio mode
CMD ["node", "dist/cli.js", "--stdio"]
