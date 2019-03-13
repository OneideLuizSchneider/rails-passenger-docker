FROM phusion/passenger-ruby24:1.0.0
MAINTAINER Oneide L S <oneidels@gmail.com>

RUN apt-get update && apt-get install -qq -y libpq-dev --fix-missing --no-install-recommends

# install tzdata single
RUN apt-get update && apt-get install -y tzdata
RUN apt-get update && apt-get install -y nodejs

ARG LOCAL_USER_ID
RUN usermod -u ${LOCAL_USER_ID} app

ENV APP_NAME rails_app_name

# Enable Nginx and add config 
RUN rm -f /etc/service/nginx/down
RUN rm /etc/nginx/sites-enabled/default
COPY $APP_NAME.conf /etc/nginx/sites-enabled/$APP_NAME.conf

# create project root change owner
ENV APP_PATH /home/app/$APP_NAME
RUN mkdir -p $APP_PATH 
RUN chown -R app:app $APP_PATH

WORKDIR $APP_PATH

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/sbin/my_init"]
