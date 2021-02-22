#!/usr/bin/env bash

MONGOGB_HOST="az-dev-nu-course2-dba.mongo.cosmos.azure.com"
MONGODB_PORT="10255"
USERNAME="az-dev-nu-course2-dba"

# Copy/past the primary password here
PRIMARY_PW="S8NVggv37Ymwmq8gFafqdMEfmoB2HPwr84iCuTWbpCF6DrtlJ3lJCuQirSsN8bFbPLLv06SaLj8nXweAIXcTbg=="


DB_NAME="az-dev-nu-course2-db"
COLLECTION_ADS="advertisements"
COLLECTION_POSTS="posts"

CONNECTION_STRING="mongodb://az-dev-nu-course2-dba:S8NVggv37Ymwmq8gFafqdMEfmoB2HPwr84iCuTWbpCF6DrtlJ3lJCuQirSsN8bFbPLLv06SaLj8nXweAIXcTbg==@az-dev-nu-course2-dba.mongo.cosmos.azure.com:10255/?ssl=true&replicaSet=globaldb&retrywrites=false&maxIdleTimeMS=120000&appName=@az-dev-nu-course2-dba@"
CONNECTION_STRING_DB="mongodb://az-dev-nu-course2-dba:S8NVggv37Ymwmq8gFafqdMEfmoB2HPwr84iCuTWbpCF6DrtlJ3lJCuQirSsN8bFbPLLv06SaLj8nXweAIXcTbg==@az-dev-nu-course2-dba.mongo.cosmos.azure.com:10255/az-dev-nu-course2-db?ssl=true&replicaSet=globaldb&retrywrites=false&maxIdleTimeMS=120000&appName=@az-dev-nu-course2-dba@"

mongoimport --uri $CONNECTION_STRING_DB --collection $COLLECTION_POSTS --jsonArray < "C:/Users/nsika/Documents/Learning/Udacity/samplePosts.json"
mongoimport --uri $CONNECTION_STRING_DB --collection $COLLECTION_ADS --jsonArray < "C:/Users/nsika/Documents/Learning/Udacity/sampleAds.json"
