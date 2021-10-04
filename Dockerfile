FROM node:14

# Install local cert
RUN apt-get update -qq && apt-get install -y libnss3-tools
RUN wget https://github.com/FiloSottile/mkcert/releases/download/v1.4.3/mkcert-v1.4.3-linux-arm64
RUN mv mkcert-v1.4.3-linux-arm64 /usr/bin/mkcert
RUN chmod +x /usr/bin/mkcert
RUN mkcert --version
RUN mkcert -install

# Create app directory
WORKDIR /usr/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./
COPY yarn*.lock ./

RUN yarn install

# Bundle app source
COPY . .

RUN mkcert localhost 127.0.0.1 ::1

EXPOSE 8080
