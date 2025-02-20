FROM python:3.10-slim-bullseye


# Set environment variables
ENV MLFLOW_FLASK_SERVER_SECRET_KEY="super_secret"
ENV MLFLOW_AUTH_CONFIG_PATH="/app/auth/basic_auth.ini" 


# Set working directory
WORKDIR /app

# Copy dependencies and scripts
COPY requirements.txt .
COPY server.sh .
#COPY basic_auth.ini auth/basic_auth.ini  

# Install dependencies
RUN pip install --upgrade pip && pip install -r requirements.txt

# Expose the MLflow server port
EXPOSE 8080

# Ensure the script is executable
RUN chmod +x server.sh

# Set the entrypoint
ENTRYPOINT ["./server.sh"]
