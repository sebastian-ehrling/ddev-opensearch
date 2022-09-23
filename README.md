[![tests](https://github.com/drud/ddev-elasticsearch/actions/workflows/tests.yml/badge.svg)](https://github.com/sebastian-ehrling/ddev-opensearch/blob/main/.github/workflows/tests.yml) ![project is maintained](https://img.shields.io/maintenance/yes/2022.svg)

## Installation

Uses [opensearch official image](https://hub.docker.com/r/opensearchproject/opensearch)

`ddev get sebastian-ehrling/ddev-opensearch`

## Configuration

From within the container, the opensearh container is reached at hostname: "opensearch", port: 9200, so the server URL might be `http://opensearch:9200`. You can also use the "ddev.site" http and https urls to access it: `http://<projectname>.ddev.site:9200`, and `https://<projectname>.ddev.site:9201`

## Connection

You can access the Opensearch server directly from the host for debugging purposes by visiting `http://<projectname>.ddev.site:9200`. Via https you can access Opensearch via `https://<projectname>.ddev.site:9201`

## Memory Limit

This configuration limits memory usage to 512mb. This should be enough for most projects, but if your `opensearch` service stops with no obvious reason, increase your docker max memory and/or the service max memory via the `      - "ES_JAVA_OPTS=-Xms512m -Xmx512m"` environment variable in `docker-compose.opensearch.yaml`.

You can use `ddev logs -s opensearch` to investigate what the elasticsearch daemon has been up to, or if you have a RAM-related crash.

## Additional Resources
**Maintained by [@sebastian-ehrling](https://github.com/sebastian-ehrling)**
