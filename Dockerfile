# 第一阶段
FROM node:18.16.0-alpine AS build
WORKDIR /app
COPY package*.json pnpm-lock.yaml ./
RUN npm install -g pnpm && pnpm install --production
COPY . .
RUN npm run build

# 第二阶段
FROM node:18.16.0-alpine
WORKDIR /app
COPY --from=build /app .
RUN npm install pm2 -g --no-optional
CMD ["pm2-runtime", "dist/index.js"]
