gcloud composer environments create wm-ai-platform-cloud-composer \
  --location us-central1 \
  --image-version composer-3-airflow-2.7.3 \
  --env-variables COMPOSER_ENV=true


gcloud composer environments describe wm-ai-platform-cloud-composer --location us-central1



gcloud composer environments snapshots load \
  wm-ai-platform-cloud-composer \
  --location us-central1 \
  --snapshot-path "gs://us-central1-ai-platform-com-b3a237a1-bucket/snapshots/wm-ai-platform_us-central1_ai-platform-composer_2025-02-19T03-01-40"


gcloud composer environments delete wm-data-platform-composer-3 --location us-central1 --quiet
