FROM debian:10-slim

LABEL version="1.0.0"
LABEL repository="https://github.com/lukehinds/pr-size-labeler"
LABEL homepage="https://github.com/lukehinds/pr-size-labeler"
LABEL maintainer="Luke Hinds <lukehinds@gmail.com>"

LABEL com.github.actions.name="PR Size Labeler"
LABEL com.github.actions.description="Labels PRs based on their size."
LABEL com.github.actions.icon="tag"
LABEL com.github.actions.color="blue"

# Install git and curl
RUN apt-get update && apt-get install -y git curl && rm -rf /var/lib/apt/lists/*

COPY labeler.sh /labeler.sh
RUN chmod +x /labeler.sh

ENTRYPOINT ["/labeler.sh"]
