#!/usr/bin/env bash

RESOURCE_GROUP_NAME="az-dev-nu-course2-rg"
STORAGE_ACCOUNT_NAME="azdevnucourse2proj"
FUNCTION_APP_NAME="az-dev-nu-course2-fa"
COSMOSDB_ACCOUNT_NAME="az-dev-nu-course2-dba"
MONGO_DB_NAME="az-dev-nu-course2-db"

# Create resource group
az group create --location centralus --name $RESOURCE_GROUP_NAME
printf "\nStep 1 Complete: Resource group created.\n"

# Create storage account
az storage account create --name $STORAGE_ACCOUNT_NAME --resource-group $RESOURCE_GROUP_NAME
printf "\nStep 2 Complete: Storage container created.\n"

# Create function app
az functionapp create --name $FUNCTION_APP_NAME \
                      --resource-group $RESOURCE_GROUP_NAME \
                      --storage-account $STORAGE_ACCOUNT_NAME \
                      --os-type Linux \
                      --runtime python \
                      --consumption-plan-location centralus \
                      --functions-version 3 
printf "\nStep 3 Complete: Function app created.\n"

# Create Cosmos DB account
az cosmosdb create --name $COSMOSDB_ACCOUNT_NAME \
                   --resource-group $RESOURCE_GROUP_NAME \
                   --kind MongoDB \
                   --server-version 3.6 
printf "\nStep 4 Complete: Cosmos DB Account created.\n"

# Create Mongo DB in Cosmos DB account
az cosmosdb mongodb database create --account-name $COSMOSDB_ACCOUNT_NAME \
                                    --name $MONGO_DB_NAME \
                                    --resource-group $RESOURCE_GROUP_NAME
printf "\nStep 5 Complete: MongoDB database created.\n"

# Create Mongo DB collections
az cosmosdb mongodb collection create --account-name $COSMOSDB_ACCOUNT_NAME \
                                      --database-name $MONGO_DB_NAME \
                                      --name advertisements \
                                      --resource-group $RESOURCE_GROUP_NAME

az cosmosdb mongodb collection create --account-name $COSMOSDB_ACCOUNT_NAME \
                                      --database-name $MONGO_DB_NAME \
                                      --name posts \
                                      --resource-group $RESOURCE_GROUP_NAME
printf "\nStep 6 Complete: MongoDB collections created.\n"

# Retrieve connection strings
az cosmosdb keys list -n $COSMOSDB_ACCOUNT_NAME -g $RESOURCE_GROUP_NAME --type connection-strings

# az cosmosdb keys list -n az-dev-nu-course2-dba -g az-dev-nu-course2-rg --type connection-strings