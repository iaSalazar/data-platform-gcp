#!/bin/bash

# Define the auth config directory and file
AUTH_DIR="/app/auth"
AUTH_FILE="$AUTH_DIR/basic_auth.ini"

# Ensure the directory exists
mkdir -p "$AUTH_DIR"

# Create the basic_auth.ini file dynamically
cat <<EOL > "$AUTH_FILE"
[mlflow]
default_permission = READ
database_uri = $POSTGRESQL_MLFLOW_AUTH_URL
admin_username = $MLFLOW_DEFAULT_ADMIN_USER
admin_password = $MLFLOW_DEFAULT_ADMIN_PASSWORD
EOL


echo "Auth config created at $AUTH_FILE"


# mlflow db upgrade 
mlflow server \
  --host 0.0.0.0 \
  --port 8080 \
  --backend-store-uri $POSTGRESQL_URL \
  --artifacts-destination $MLFLOW_GCS_URL \
  --app-name basic-auth