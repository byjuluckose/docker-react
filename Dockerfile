FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
CMD ["npm", "run", "build"]

FROM nginx
COPY --from=builder /app/builder /usr/share/nginx/html