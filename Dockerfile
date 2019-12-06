FROM node:alpine

# Set the working directory
WORKDIR /usr/src/app

# Copy the package.json & package-lock.json and install the dependencies
COPY package.json package-lock.json ./

# Install dependencies
RUN apk update && apk upgrade &&\
    apk add --no-cache git &&\
    rm -rf /var/cache/apk/* &&\
    npm i

# Copy the application and build the webpack bundle
COPY . ./

# Run the application
CMD [ "node", "./src/index.js" ]