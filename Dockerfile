FROM ruby:2.7

ENV APP_HOME=/app
ENV BUNDLE_PATH=/box

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /$APP_HOME
COPY Gemfile /$APP_HOME/Gemfile
COPY Gemfile.lock /$APP_HOME/Gemfile.lock
COPY . /$APP_HOME

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
