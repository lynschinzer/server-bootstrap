#! /bin/bash

MONGO_HOME=/opt/mongodb/bin
$MONGO_HOME/mongorestore --directoryperdb $1 --journal --objcheck
