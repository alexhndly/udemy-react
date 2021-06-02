#build phase
FROM node:alpine

USER node

RUN mkdir /home/node/app
WORKDIR /home/node/app

COPY --chown=node:node ./package.json .
RUN npm install
COPY --chown=node:node ./ ./

CMD ["npm", "run", "build"]

#run phase
FROM nginx
EXPOSE 80
COPY --from=0 /home/node/app/build /usr/share/nginx/html
