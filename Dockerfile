ARG ATLANTIS_VERSION="v0.48.1"
ARG SENTRY_CLI_VERSION="3.8.0"

FROM ghcr.io/runatlantis/atlantis:${ATLANTIS_VERSION}

# hadolint ignore=DL3066
USER root

# Sentry CLI
SHELL ["/bin/ash", "-eo", "pipefail", "-c"]
RUN curl -sL https://sentry.io/get-cli/ | SENTRY_CLI_VERSION="${SENTRY_CLI_VERSION}" sh

# Don't want atlantis running as root
# hadolint ignore=DL3066
USER atlantis
