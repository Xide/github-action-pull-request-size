FROM alpine:latest

LABEL version="1.0.0"
LABEL repository="http://github.com/innovationnorway/github-action-pull-request-size"
LABEL homepage="http://github.com/innovationnorway/github-action-pull-request-size"
LABEL maintainer="Innovation Norway Support <support+github@innovationnorway.com>"

LABEL "com.github.actions.name"="GitHub Action for Pull Request Size"
LABEL "com.github.actions.description"="Adds label to pull requests."
LABEL "com.github.actions.icon"="filter"
LABEL "com.github.actions.color"="gray-dark"

COPY LICENSE README.md /

RUN apk add --update curl jq

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
