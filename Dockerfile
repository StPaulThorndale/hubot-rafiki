# A runtime container for the hubot at https://github.com/StPaulThorndale/hubot-rafiki.
#
# Example build:
#
#   git clone https://github.com/StPaulThorndale/hubot-rafiki.git
#   cd ./hubot-rafiki
#   docker build --no-cache=true -t colossus9/hubot-rafiki .
#
# Example push to Docker Hub:
#
#   docker tag colossus9/hubot-rafiki
#   docker push colossus9/hubot-rafiki:latest
#
# Example run:
#
#   docker run -d -p 5555:5555 -v /opt/hubot-rafiki/hubot.env:/opt/hubot-rafiki/hubot.env colossus9/hubot-rafiki
#

FROM ubuntu:latest
MAINTAINER James Garcia <colossus9@hpe.com>
LABEL Description="A runtime container for the hubot at https://github.com/StPaulThorndale/hubot-rafiki."

# Set proxy server (if necessary)
# ENV http_proxy http://proxy.company.com:8080
# ENV https_proxy http://proxy.company.com:8080

# Update sources and install curl
RUN apt-get update
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_4.x | bash -

# Install tools, git and node
RUN apt-get install -y build-essential libexpat1-dev libexpat1 libicu-dev git nodejs node-gyp

# Install npm
RUN npm install npm -g

# Get hubot-rafiki
WORKDIR /opt
RUN git clone https://github.com/StPaulThorndale/hubot-rafiki.git
WORKDIR /opt/hubot-rafiki

# Install node modules
RUN npm install

# Fix node modules
RUN /opt/hubot-rafiki/fix-http.sh
RUN /opt/hubot-rafiki/fix-freshdesk.sh

# Start it up
ENTRYPOINT ["/opt/hubot-rafiki/start.sh"]
