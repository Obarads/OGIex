import argparse
import os
import datetime
import shutil
from dataclasses import dataclass
from lib.structure import GithubData
import yaml

DIR_PATH = os.path.abspath(os.path.dirname(__file__))

@dataclass
class Data:
    # arxiv_title: str
    # arxiv_url: str
    # arxiv_submission_date: str
    # arxiv_authors: List[str]
    # ar5iv_url: str
    github_url: str
    github_dir: str
    github_dir_lowercase: str
    github_userdir: str
    github_commit_hash: str
    github_commit_hash_date: str
    github_license: str
    update_date: str
    base_image: str
    image_name: str
    dockerfile_path_in_model_dir: str


def create_doc(data: Data, temp_article_path: str, save_path: str = None):
    with open(temp_article_path, encoding="utf-8") as f:
        temp_article = f.read()

    start_word = "@{"
    end_word = "@}"

    splited_temp_articles = temp_article.split(start_word)
    splited_articles = [splited_temp_articles[0]]
    for splited_temp_article in splited_temp_articles[1:]:
        end_word_index = splited_temp_article.find(end_word)
        value_name = splited_temp_article[:end_word_index]
        # print(value_name)
        value = getattr(data, value_name)
        splited_article = value + splited_temp_article[end_word_index + len(end_word) :]
        splited_articles.append(splited_article)

    article = "".join(splited_articles)

    if save_path is not None:
        with open(save_path, "w", encoding="utf-8") as f:
            f.write(article)

    return article

def create_dockerfile_docs(base_image, path, save_dir_path):
    env_path = os.path.join(path, base_image)
    shutil.copytree(env_path, save_dir_path)
    with open(os.path.join(env_path, "setting.yaml"), "r") as f:
        setting = yaml.safe_load(f)
    return setting["name"], "Dockerfile"

def main():
    parser = argparse.ArgumentParser()
    # parser.add_argument("--arxiv_url", "-a")
    parser.add_argument("--github_url", "-g", type=str, required=True)
    parser.add_argument(
        "--base_image",
        "-b",
        default="env/Dockerfile.cuda118.torch201",
        # default=None,
    )
    args = parser.parse_args()

    # arxiv_url = args.arxiv_url
    # arxiv_url = "https://arxiv.org/abs/1612.00593"
    github_url = args.github_url
    # github_url = "https://github.com/charlesq34/pointnet"
    base_image = args.base_image

    # arxiv_data = vars(ArxivData(arxiv_url))
    github_data = GithubData(github_url)

    new_script_dir = os.path.join(DIR_PATH, "../scripts/", github_data.github_dir)
    if os.path.exists(new_script_dir):
            raise ValueError(f"Already exists: {new_script_dir}")

    image_name, dockerfile_path_in_model_dir = create_dockerfile_docs(
        base_image,
        os.path.join(DIR_PATH, "other_template"),
        os.path.join(new_script_dir, "env"),
    )

    data_dict = vars(github_data) | {
        "update_date": datetime.datetime.now().strftime("%Y/%m/%d"),
        "base_image": base_image,
        "image_name": image_name,
        "dockerfile_path_in_model_dir": dockerfile_path_in_model_dir,
    }
    data = Data(**data_dict)


    ogiex_folder = os.path.join(new_script_dir, "scripts_in_container")
    os.makedirs(ogiex_folder)
    _ = create_doc(
        data,
        os.path.join(DIR_PATH, "template/README.md"),
        os.path.join(new_script_dir, "README.md"),
    )
    _ = create_doc(
        data,
        os.path.join(DIR_PATH, "template/docker_buildrun.sh"),
        os.path.join(new_script_dir, "docker_buildrun.sh"),
    )
    _ = create_doc(
        data,
        os.path.join(DIR_PATH, "template/scripts_in_container/demo.sh"),
        os.path.join(ogiex_folder, "demo.sh"),
    )
    _ = create_doc(
        data,
        os.path.join(DIR_PATH, "template/scripts_in_container/setup_package.sh"),
        os.path.join(ogiex_folder, "setup_package.sh"),
    )
    _ = create_doc(
        data,
        os.path.join(DIR_PATH, "template/scripts_in_container/requirements.txt"),
        os.path.join(ogiex_folder, "requirements.txt"),
    )

    # Git clone
    os.system(f"git clone {data.github_url} {new_script_dir}/impl")


if __name__ == "__main__":
    main()
