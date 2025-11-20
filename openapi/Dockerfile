FROM node:18-alpine AS builder 
WORKDIR /app 
COPY package*.json ./ RUN if [ -f package-lock.json ] ; then
npm ci --legacy-peer-deps ;
else
npm install --legacy-peer-deps ;
fi COPY . . RUN npm run build 2>/dev/null || true

FROM node:18-alpine
 WORKDIR /app 
COPY --from=builder /app /app ENV NODE_ENV=production EXPOSE 3000
 CMD ["sh", "-c", "node server.js"]
