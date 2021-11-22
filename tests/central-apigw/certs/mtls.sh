#!/bin/bash

API_DNS="xops-api.infra.dev.ohpen.tech"
CA_NAME="xops-ca"
SERVER_NAME="apigw"
CLIENT_NAME="ohp-demo"

openssl genrsa -out RootCA.key 4096
openssl req -new -x509 -days 365 -key RootCA.key -subj "/CN=$CA_NAME" -out RootCA.pem 

openssl genrsa -out client.key 2048
openssl req -new -key client.key -subj "/CN=$CLIENT_NAME" -out client.csr

openssl x509 -req -in client.csr -CA RootCA.pem -CAkey RootCA.key -set_serial 01 -out client.pem -out client.crt -days 365 -sha256

cp RootCA.pem "xops-api.pem"

exit
