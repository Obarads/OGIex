import argparse
import subprocess
import os
import shutil
# import git

def download(git_url: str, package_name: str):
    splited_url = git_url.split("/")
    print(splited_url)
    output_model_dir_name = f"models--{splited_url[-2]}--{splited_url[-1]}"
    output_snapshot_dir_path = (
        f"/workspace/huggingface_cache/hub/{output_model_dir_name}/snapshots/"
    )
    output_tmp_dir_path = os.path.join(
        output_snapshot_dir_path, "download_models_with_lfs"
    )
    os.makedirs(os.path.dirname(output_tmp_dir_path), exist_ok=True)

    if "sp" == package_name:
        _ = subprocess.run(f"git clone {git_url} {output_tmp_dir_path}".split(" "))
    elif "git" == package_name:
        raise NotImplementedError()
        # _ = git.Repo.clone_from(git_url, output_tmp_dir_path)
    else:
        raise NotImplementedError()

    cmd = f"git -C {output_tmp_dir_path} rev-parse HEAD"
    git_hash = subprocess.check_output(cmd.split(" ")).strip().decode("utf-8")

    output_dir_path = os.path.join(output_snapshot_dir_path, git_hash)
    shutil.move(output_tmp_dir_path, output_dir_path)

    return output_dir_path


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--package", "-p", type=str, choices=["sp", "git"], default="sp"
    )
    parser.add_argument("--git_url", "-g", type=str, required=True)
    args = parser.parse_args()

    package = args.package
    git_url = args.git_url

    _, output_dir_path = download(git_url, package)

    print(f"Finish: {output_dir_path}")


if __name__ == "__main__":
    main()
