FROM node:alpine AS build

WORKDIR /app

COPY ./ /app/
COPY package.json package-lock.json ./

RUN npm ci

RUN npm install -g @angular/cli

RUN npm run build

FROM nginx:alpine

COPY --from=build /app/dist/frontend/browser /usr/share/nginx/html
COPY ./nginx.conf /etc/nginx/nginx.conf

EXPOSE 80 443 6006 4200
CMD ["nginx", "-g", "daemon off;"]