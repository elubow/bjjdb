FROM opsline/echo-ruby-node

# change to app user for the rest of the build
USER app
WORKDIR /opt/app
ENV BUNDLE_APP_CONFIG /opt/app/.bundle

# Rails configs
ENV BUNDLE_APP_CONFIG /opt/app/.bundle
ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES 1
ENV RAILS_LOG_TO_STDOUT 1

# Note that 'environment' below maps to the AWS environment the app is running
# in, while the RAILS_ENV above describes *how* rails should behave.
ENV APPLICATION myapp
ENV ENVIRONMENT staging

# install ruby/node deps in a single layer for better caching
COPY --chown=app:app ./Gemfile* ./yarn.lock* ./package.json* /opt/app/
RUN set ex \
    && gem install bundler --conservative --no-document \
    && bundle install --jobs 4 --deployment --without "test" \
# run yarn if needed
    && ((test -f yarn.lock || test -f package.json) && yarn || true)

# Copy app and precompile assets
COPY --chown=app:app . /opt/app
RUN set -ex \
# precompile assets
    && RAILS_ENV= \
    && bundle update \
    && bundle exec rake assets:precompile \
# cleanup
    && bundle config --local without "development test" \
    && bundle clean \
    && rm -rf tmp/* log/* \
    && rm -rf vendor/bundle/ruby/*/cache \
    && rm -rf app/assets/node_modules/ \
# capture version string
    && echo "BUILD_VERSION=$(git describe --tag --always) BUILD_HASH=$(git log --format="%h" -1) BUILD_DATE=$(date -u "+%Y-%m-%dT%H:%M:%S%z")" > .version \
    && rm -rf .git \
    && rm -f config/master.key

USER root
COPY docker/entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD [""]
