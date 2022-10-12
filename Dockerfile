FROM node:alpine as builder
WORKDIR '/app'
COPY package.json . 
RUN npm install
COPY . .
CMD ["npm", "run", "build"]


#/app/build all the stuff
FROM nginx 
COPY --from=builder /app/build /usr/share/nginx/html

