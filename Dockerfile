FROM mhart/alpine-node
  
COPY . /app

WORKDIR /app

CMD ["node", "./app.js"]

EXPOSE  3000
