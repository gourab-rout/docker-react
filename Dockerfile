FROM node:alpine as builder
WORKDIR  '/app'
COPY package.json .
RUN npm install
COPY . .
CMD ["npm", "run", "build"]

FROM nginx
copy --from=builder /app/build /usr/share/nginx/html
