#########################################################################
# Install gems and precompile assets
#########################################################################
FROM ruby:3.2.2 AS build
WORKDIR /usr/src/app
LABEL maintainer="norman.snyder@hey.com"
RUN apt-get update -yqq && \
  apt-get install -yqq --no-install-recommends \
  build-essential \
  curl \
  imagemagick \
  libpq-dev \
  libvips \
  nodejs \
  npm \
  postgresql-client \
  postgresql-contrib \
  vim \
  wget

# Install gems into the vendor/bundle directory in the workspace
COPY Gemfile* /usr/src/app/
RUN bundle config set --local path "vendor/bundle" && \
  bundle install --jobs 4 --retry 3

# Set a random secret key base so we can precompile assets.
# ENV SECRET_KEY_BASE airport_gap_secret_key_base

# Set up Node.js and Yarn package repositories.
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
RUN apt-get install -y nodejs

# https://yarnpkg.com/getting-started/install 
RUN corepack enable
RUN yarn init -2
RUN yarn set version stable
COPY yarn.lock package.json ./
RUN yarn install --refresh-lockfile
RUN npm install ckeditor5


COPY . /usr/src/app/
RUN bin/rails assets:precompile

#####################################################################
# Stage 2: Copy gems and assets from build stage and finalize image.
#####################################################################
FROM ruby:3.2.2
WORKDIR /usr/src/app

# Make sure Bundler knows where we're placing our gems coming from
RUN bundle config set --local path "vendor/bundle"

# Copy everything from the build stage, including gems and precompiled assets.
COPY --from=build /usr/src/app /usr/src/app/
RUN apt-get update -yqq && \
  apt-get install -yqq --no-install-recommends \
  imagemagick \
  libpq-dev \
  libvips \
  postgresql-client \
  postgresql-contrib \
  vim

EXPOSE 3000

CMD ["bin/rails", "s", "-b", "0.0.0.0"]
