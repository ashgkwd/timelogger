FROM ruby:2.6
RUN apt-get update -qq && apt-get install -y postgresql-client
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | sh
RUN chmod +x ~/.nvm/nvm.sh
RUN ~/.nvm/nvm.sh install --lts
RUN apt-get install -y npm
RUN ~/.nvm/nvm.sh use && npm install -g yarn
WORKDIR /mainapp
COPY Gemfile /mainapp/Gemfile
COPY Gemfile.lock /mainapp/Gemfile.lock
RUN bundle install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]