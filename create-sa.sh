#!/bin/bash

eksctl create iamserviceaccount \
                --name my-serviceaccount \
                --namespace default \
                --cluster basic3 \
                --attach-policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess \
                --approve