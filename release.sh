#!/bin/bash

docker build . -t dp81s --no-cache
docker tag dp81s spiksius/dp81s:$@
docker tag spiksius/dp81s:$@ spiksius/dp81s:latest
docker push spiksius/dp81s:$@
docker push spiksius/dp81s:latest
