gcloud compute snapshots create instance-20250220-233039-boot-snapshot-ivan-workbecnh \
    --source-disk=instance-20250220-233039-boot \
    --source-disk-zone=us-central1-a \
    --storage-location=us  # Adjust the storage location if needed


gcloud compute snapshots create instance-20250220-233039-data-snapshot-ivan-workbecnh \
    --source-disk=instance-20250220-233039-data-workspace \
    --source-disk-zone=us-central1-a \
    --storage-location=us
