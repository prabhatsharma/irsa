'use strict';

const AWS = require('aws-sdk')
const express = require('express')
const app = express()
const port = 3000

AWS.config.update({region: 'us-west-2'});

const s3 = new AWS.S3();
const dynamo = new AWS.DynamoDB();

app.get('/s3', (req, res) => {
    var params = {};
    s3.listBuckets(params, function (err, data) {
        if (err) res.json(err) // an error occurred
        else res.json(data)       // successful response
    });
})

app.get('/dynamo', (req, res) => {
    var params = {};
    var params = {
    };
    dynamo.listTables(params, function(err, data) {
      if (err) res.json(err); // an error occurred
      else     res.json(data)           // successful response
    });
})


app.listen(port, () => console.log(`Example app listening on port ${port}!`))
