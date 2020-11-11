#!/bin/bash

which gq >/dev/null
if [ $? -ne 0 ]; then
    echo "must have graphqurl installed to run this command. try yarn global add graphqurl"
    exit 1
fi

gq http://localhost:8080/v1/graphql \
    -H "X-Hasura-Admin-Secret: admin" \
    --introspect
