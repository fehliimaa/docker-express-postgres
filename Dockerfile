# Etapa 1: Build
# Image base
FROM node:18-alpine as builder

# Working directory inside the container
WORKDIR /app

# Copy application files
COPY app/package*.json ./
RUN npm install --only=production
COPY app .

# Etapa 2: Runtime with minimalist image
FROM node:18-alpine

ENV NODE_ENV=production
WORKDIR /app

COPY --from=builder /app /app

# Expose the application port
EXPOSE 3000

# Command to start the application
CMD ["node", "index.js"]