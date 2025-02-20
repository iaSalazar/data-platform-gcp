import os

from google.cloud import storage


def upload_folder_to_gcs(bucket_name, folder_path, destination_folder=""):
    """
    Uploads all files and subfolders from a local folder to a Google Cloud Storage bucket.

    :param bucket_name: Name of the GCS bucket.
    :param folder_path: Local folder path containing files to upload.
    :param destination_folder: (Optional) Folder path in the bucket.
    """
    client = storage.Client(project="wm-ai-platform")

    bucket = client.bucket(bucket_name)

    for root, _, files in os.walk(folder_path):
        for file in files:
            local_path = os.path.join(root, file)
            relative_path = os.path.relpath(local_path, folder_path)  # Maintain directory structure

            # Define blob path in GCS
            blob_path = os.path.join(destination_folder, relative_path) if destination_folder else relative_path
            blob = bucket.blob(blob_path.replace("\\", "/"))  # Ensure Unix-style paths in GCS
            
            print(f"Uploading {local_path} to gs://{bucket_name}/{blob_path}...")
            blob.upload_from_filename(local_path)
    
    print("Upload complete!")

# Example usage:
upload_folder_to_gcs(
    "energuate_wm_data",
    "/home/ivs/Downloads/data_lake/SGCPRO",
    "proyecto_grado_uniandes_data/SGCPRO"
)
