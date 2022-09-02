FROM akorn/luarocks:lua5.1-alpine as BUILDER

RUN echo "install lua libraries"
RUN apk --no-cache add git curl
      
RUN luarocks install inifile 
RUN luarocks install lunajson
RUN luarocks install luastatic
WORKDIR /app
ENV PWD=/app
COPY src .
CMD ["lua", "main.lua"]

FROM alpine:latest
RUN apk add --no-cache curl
RUN luastatic main.lua
