FROM node:alpine as builderone

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build


FROM nginx
COPY --from=builderone /app/build /usr/share/nginx/html
