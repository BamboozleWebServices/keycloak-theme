FROM node:18 AS builder
WORKDIR /builder
COPY . .
RUN npm install -g pnpm && pnpm install --no-frozen-lockfile && pnpm build

FROM alpine:latest
COPY --from=builder /builder/theme/bamboozle /theme
