FROM alpine:latest

LABEL version="1.0.0"
LABEL repository="http://github.com/Xide/github-action-pull-request-size"
LABEL homepage="http://github.com/Xide/github-action-pull-request-size"
LABEL maintainer="Germain GAU <germain.gau@gmail.com>"

LABEL "com.github.actions.name"="GitHub Action for Pull Request Size"
LABEL "com.github.actions.description"="Adds label to pull requests."
LABEL "com.github.actions.icon"="filter"
LABEL "com.github.actions.color"="gray-dark"

RUN apk add --no-cache curl jq

COPY LICENSE README.md /
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
