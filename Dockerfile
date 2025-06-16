FROM node:20-alpine AS build-stage

WORKDIR /app

COPY . .

RUN npm install
RUN npm run build

FROM node:20-alpine AS production-stage

WORKDIR /app

COPY --from=build-stage /app .

EXPOSE 3000

CMD ["npm", "run", "start"]
