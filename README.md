## Installation

Uses [opensearch official image](https://hub.docker.com/r/opensearchproject/opensearch)

`ddev get sebastian-ehrling/ddev-opensearch`

## What is OpenSearch?
OpenSearch is a fork of the Elasticsearch search engine and the associated Kibana analytics platform. 
As of version 7.11, Elasticsearch is no longer available under the free Apache license. This means that no further free use is possible for cloud providers.

## Configuration

From within the container, the opensearch container is reached at hostname: "opensearch", port: 9200, so the server URL might be `http://opensearch:9200`. You can also use the "ddev.site" http and https urls to access it: `http://<projectname>.ddev.site:9200`, and `https://<projectname>.ddev.site:9201`

## Installation

`ddev get sebastian-ehrling/opensearch && ddev restart`

## Connection

You can access the Opensearch server directly from the host for debugging purposes by visiting `http://<projectname>.ddev.site:9200`. Via https you can access Opensearch via `https://<projectname>.ddev.site:9201`

## Memory Limit

This configuration limits memory usage to 512mb. This should be enough for most projects, but if your `opensearch` service stops with no obvious reason, increase your docker max memory and/or the service max memory via the `      - "ES_JAVA_OPTS=-Xms512m -Xmx512m"` environment variable in `docker-compose.opensearch.yaml`.

You can use `ddev logs -s opensearch` to investigate what the opensearch daemon has been up to, or if you have a RAM-related crash.

## Additional Resources


**Maintained by [@sebastian-ehrling](https://github.com/sebastian-ehrling)**
