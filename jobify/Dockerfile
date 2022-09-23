FROM gcr.io/kaniko-project/executor:v1.8.1 AS kaniko

FROM alpine AS alpine

COPY --from=docker.io/buildkite/agent:3.39.0 /usr/local/bin/ /usr/local/bin/
COPY --from=docker.io/buildkite/agent:3.39.0 /buildkite/ /buildkite/

# Download our minimum dependencies
RUN apk add -U \
    bash \
    git \
    openssh \
    binutils \ 
    make

# Get the kaniko binaries from the previous build stage
COPY --from=kaniko /kaniko /kaniko
# Ensure kaniko binaries are in our PATH
ENV PATH=/usr/local/bin:/kaniko:/bin:/sbin:/usr/bin:/usr/sbin

ENV SSL_CERT_DIR=/kaniko/ssl/certs
ENV DOCKER_CONFIG /kaniko/.docker/
# ENV DOCKER_CREDENTIAL_GCR_CONFIG /kaniko/.config/gcloud/docker_credential_gcr_config.json

# Load docker credentials so that we can push to GCR
# RUN ["docker-credential-gcr", "config", "--token-source=env"]

ENTRYPOINT ["/usr/local/bin/buildkite-agent"]
