gcloud compute disks create instance-20250220-233039-boot \
    --source-snapshot=instance-20250220-233039-boot-snapshot-ivan-workbench \
    --zone=us-central1-a


gcloud compute disks create instance-20250220-233039-data-workspace \
    --source-snapshot=instance-20250220-233039-data-snapshot-ivan-workbench \
    --zone=us-central1-a


gcloud workbench instances create instance-20250220-233039 \
    --location=us-central1-a \
    --machine-type=n2-standard-4 \

    
gcloud compute instances detach-disk instance-20250220-233039 \
    --disk=instance-20250220-233039-boot \
    --zone=us-central1-a

gcloud compute instances attach-disk instance-20250220-233039 \
    --disk=instance-20250220-233039-boot \
    --zone=us-central1-a \
    --boot


gcloud workbench instances restore instance-20250220-233039 \
    --location=us-central1-a \
    --snapshot-project=wm-ai-platform \
    --snapshot=instance-20250220-233039-data-snapshot-ivan-workbench
