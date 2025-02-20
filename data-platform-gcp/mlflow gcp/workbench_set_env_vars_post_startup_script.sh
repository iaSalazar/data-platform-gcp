#!/bin/bash

# Fetch secrets from Secret Manager and export them as environment variables
echo "Fetching secrets from Secret Manager..."

export MLFLOW_DEFAULT_ADMIN_USER=$(gcloud secrets versions access latest --secret="MLFLOW_DEFAULT_ADMIN_USER")
export MLFLOW_DEFAULT_ADMIN_PASSWORD=$(gcloud secrets versions access latest --secret="MLFLOW_DEFAULT_ADMIN_PASSWORD")
export MLFLOW_TRACKING_URI=$(gcloud secrets versions access latest --secret="MLFLOW_CLOUD_RUN_URL")

# Persist the environment variables in .bashrc for future sessions
echo 'export MLFLOW_TRACKING_USERNAME=$(gcloud secrets versions access latest --secret="MLFLOW_DEFAULT_ADMIN_USER")' >> ~/.bashrc
echo 'export MLFLOW_TRACKING_PASSWORD=$(gcloud secrets versions access latest --secret="MLFLOW_DEFAULT_ADMIN_PASSWORD")' >> ~/.bashrc
echo 'export MLFLOW_TRACKING_URI=$(gcloud secrets versions access latest --secret="MLFLOW_CLOUD_RUN_URL")' >> ~/.bashrc

# Source the .bashrc file to make changes take effect immediately
source ~/.bashrc

echo "Secrets loaded and persisted successfully!"
