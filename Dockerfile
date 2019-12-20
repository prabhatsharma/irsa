FROM ubuntu

RUN apt-get update

# install awscli v1
RUN apt-get install unzip awscli curl -y 

# install aws cli v2
RUN curl "https://d1vvhvl2y92vvt.cloudfront.net/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && unzip awscliv2.zip && ./aws/install

RUN aws configure set default.region us-west-2

# install nodejs
RUN curl -sL https://deb.nodesource.com/setup_13.x | bash -
RUN apt-get install -y nodejs

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# USER 1000

# Bundle app source
COPY . .

EXPOSE 3000
CMD [ "node", "app.js" ]