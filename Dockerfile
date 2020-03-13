FROM ruby:alpine

RUN mkdir /usr/src/app
ADD . /usr/src/app/
WORKDIR /usr/src/app/
RUN apk update && apk upgrade && apk add --no-cache alpine-sdk bash git
RUN gem install bundler
RUN bundle
CMD ["bin/robot_challenge"]


# COPY . /app
# WORKDIR /app
# RUN apk add --no-cache bash
# RUN /bin/sh
# RUN apk update && apk add --virtual build-dependencies build-base
# RUN gem install bundler
# RUN bundle install
# ENTRYPOINT ["./entrypoint.sh"]
# CMD ["robot"]
