FROM node:alpine as builders
WORKDIR  '/app'
COPY package.json .
RUN npm install
COPY . .
CMD ["npm", "run", "build"]

FROM nginx
copy --from=builders /app/build /usr/share/nginx/html
