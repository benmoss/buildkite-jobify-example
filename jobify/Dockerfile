FROM buildkite/agent:3 AS agent

FROM gcr.io/kaniko-project/executor
COPY  --from=agent /usr/local/bin/buildkite-agent /usr/local/bin/buildkite-agent