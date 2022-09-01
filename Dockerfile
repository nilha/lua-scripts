FROM akorn/luarocks:lua5.1-alpine

RUN echo "install lua libraries"
RUN apk --no-cache add git curl
      
RUN luarocks install inifile 
RUN luarocks install lunajson
WORKDIR /app
ENV PWD=/app
COPY src .
CMD ["lua", "main.lua"]
