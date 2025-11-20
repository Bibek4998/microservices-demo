# Stage 1: Builder
FROM node:18-alpine AS builder

WORKDIR /app

# Install git and other build dependencies
RUN apk add --no-cache git python3 make g++

# Copy package files first
COPY package*.json ./

# Install dependencies
RUN npm install --legacy-peer-deps

# Copy app source code
COPY . .

# Optional: run build if script exists
RUN if [ -f package.json ] && grep -q "\"build\"" package.json; then \
        npm run build; \
    else \
        echo "No build script defined, skipping"; \
    fi

# Stage 2: Production image
FROM node:18-alpine

WORKDIR /app

# Copy build artifacts and dependencies from builder
COPY --from=builder /app /app

# Set environment
ENV NODE_ENV=production

# Expose default API port
EXPOSE 3000

# Start server
CMD ["node", "server.js"]
