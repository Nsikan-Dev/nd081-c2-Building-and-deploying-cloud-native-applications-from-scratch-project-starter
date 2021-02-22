import azure.functions as func
import pymongo
import json
from bson.json_util import dumps

def main(req: func.HttpRequest) -> func.HttpResponse:

    try:
        url = "mongodb://az-dev-nu-course2-dba:S8NVggv37Ymwmq8gFafqdMEfmoB2HPwr84iCuTWbpCF6DrtlJ3lJCuQirSsN8bFbPLLv06SaLj8nXweAIXcTbg==@az-dev-nu-course2-dba.mongo.cosmos.azure.com:10255/?ssl=true&replicaSet=globaldb&retrywrites=false&maxIdleTimeMS=120000&appName=@az-dev-nu-course2-dba@"  # TODO: Update with appropriate MongoDB connection information
        client = pymongo.MongoClient(url)
        database = client['az-dev-nu-course2-db']
        collection = database['advertisements']


        result = collection.find({})
        result = dumps(result)

        return func.HttpResponse(result, mimetype="application/json", charset='utf-8')
    except:
        print("could not connect to mongodb")
        return func.HttpResponse("could not connect to mongodb",
                                 status_code=400)

