FROM nginx:alpine

# /Xetarion will be our volume & building directory
WORKDIR /SummitProduction

# Install hugo & git
RUN apk add --no-cache hugo git

# Download the example site
RUN git clone -b master --depth=1 https://github.com/Xetarion/SummitProduction /Xetarion

# Copy files from this repo into themes/main
RUN mkdir -p /Xetarion/themes/main
COPY . /Xetarion/themes/main

# Copy entrypoint script into the container image, this runs everytime the container cold-starts.
COPY ./docker/entrypoint.sh /docker-entrypoint.d/10-build-hugo.sh
