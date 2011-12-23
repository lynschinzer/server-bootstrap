#! /bin/bash

MONGO_HOME=/opt/mongodb/bin
$MONGO_HOME/mongodump --directoryperdb --journal --out $1
