# Stage 1: Build
FROM node:18-alpine AS builder

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN if [ -f package-lock.json ]; then \
        npm ci --legacy-peer-deps; \
    else \
        npm install --legacy-peer-deps; \
    fi

# Copy app source code
COPY . .

# Build the app (ignore errors if build script not defined)
RUN npm run build 2>/dev/null || true

# Stage 2: Production image
FROM node:18-alpine

WORKDIR /app

# Copy build artifacts from builder
COPY --from=builder /app /app

# Set environment
ENV NODE_ENV=production

# Expose port
EXPOSE 3000

# Start server
CMD ["node", "server.js"]
