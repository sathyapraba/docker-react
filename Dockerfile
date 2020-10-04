FROM node:alpine as builderone

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build


FROM nginx
EXPOSE 80
COPY --from=builderone /app/build /usr/share/nginx/html
