ARG ATLANTIS_VERSION="v0.34.0"
ARG SENTRY_CLI_VERSION="2.43.0"

FROM ghcr.io/runatlantis/atlantis:${ATLANTIS_VERSION}

USER root

# Sentry CLI
SHELL ["/bin/ash", "-eo", "pipefail", "-c"]
RUN curl -sL https://sentry.io/get-cli/ | SENTRY_CLI_VERSION="${SENTRY_CLI_VERSION}" sh

# Don't want atlantis running as root
USER atlantis
