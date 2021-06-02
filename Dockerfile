#build phase
FROM node:alpine

WORKDIR /app

COPY ./package*.json ./
RUN npm install
COPY --chown=node:node ./ ./

CMD ["npm", "run", "build"]

#run phase
FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html
