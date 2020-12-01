#!/bin/bash


docker save static:b6caea16 |gzip  > static.tgz      
gunzip -c static.tgz | docker load