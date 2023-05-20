FROM secureruby/ruby:3.2.2

RUN yum install -y -q git gcc-c++ make

ARG UID=1000
ENV USER=retentio_plan
ENV GROUP=application
ENV ENVIRONMENT=development

WORKDIR /app

USER root

RUN groupadd -f "${GROUP}" -g 4444 \
  && adduser -l --uid "$UID" "$USER" -G "${GROUP}" \
  && chown "${USER}" /usr/local/bundle/

COPY --chown="${USER}:${GROUP}" Gemfile Gemfile.lock backup_retention_plan.gemspec ./
COPY --chown="${USER}:${GROUP}" lib/version.rb lib/version.rb

USER "${USER}"

RUN bundle install