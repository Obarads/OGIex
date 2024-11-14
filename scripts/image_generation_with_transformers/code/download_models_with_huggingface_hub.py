from huggingface_hub import snapshot_download
import argparse
import requests

def download(repo_id):
    try:
        _ = snapshot_download(repo_id=repo_id, force_download=False)
        return True
    except requests.exceptions.ConnectionError:
        return False

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--repo_id", "-r", type=str, required=True)
    args = parser.parse_args()

    repo_id = args.repo_id

    donwload_data = False
    while donwload_data == False:
        donwload_data = download(repo_id)


if __name__ == "__main__":
    main()
