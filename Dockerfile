FROM mhart/alpine-node as builder
RUN mkdir -p /usr/local/helloworld/  
COPY helloworld.js package.json /usr/local/helloworld/ 
WORKDIR /usr/local/helloworld/ 
RUN npm install --production


FROM mhart/alpine-node
COPY --from=builder /usr/local/helloworld/ .
EXPOSE 3000
ENTRYPOINT [ "node", "helloworld.js" ]

