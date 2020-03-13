FROM ruby:alpine

RUN mkdir /usr/src/app
ADD . /usr/src/app/
WORKDIR /usr/src/app/
RUN apk update && apk upgrade && apk add --no-cache alpine-sdk bash git
RUN gem install bundler
RUN bundle
CMD ["bin/robot_challenge"]
