import argparse
import os
import arxiv
import datetime
from dataclasses import dataclass
from typing import List
from github import Github
import github

DIR_PATH = os.path.abspath(os.path.dirname(__file__))


class ArxivData:
    arxiv_url: str = None
    arxiv_title: str = None
    arxiv_submission_date: str = None
    arxiv_authors: List[str] = None
    ar5iv_url: str = None

    def __init__(self, arxiv_url: str) -> None:
        if arxiv_url is not None:
            arxiv_id = os.path.basename(arxiv_url).removesuffix(".pdf")
            search = arxiv.Search(id_list=[arxiv_id])
            paper = next(search.results())
            self.arxiv_url = arxiv_url
            self.arxiv_title: str = paper.title
            self.arxiv_submission_date: str = paper.published.strftime("%Y/%m/%d")
            self.arxiv_authors: List[str] = ", ".join([f.name for f in paper.authors])
            self.ar5iv_url: str = "https://ar5iv.labs.arxiv.org/html/" + arxiv_id


class GithubData:
    github_url: str = None
    github_dir: str = None
    github_dir_lowercase: str = None
    github_userdir: str = None
    github_commit_hash: str = None
    github_commit_hash_date: str = None
    github_license: str = "Not described"

    def __init__(self, github_url) -> None:
        if github_url is not None:
            github_url = github_url.removesuffix(".git")
            paths = github_url.split("/")
            github_userdir = f"{paths[-2]}/{paths[-1]}"
            g = Github()
            repo = g.get_repo(github_userdir)
            latest_commit = repo.get_commits()[0]

            self.github_url: str = github_url
            self.github_dir: str = repo.name
            self.github_dir_lowercase: str = repo.name.lower()
            self.github_userdir: str = github_userdir
            self.github_commit_hash: str = latest_commit.sha
            self.github_commit_hash_date: str = (
                latest_commit.commit.author.date.strftime("%Y/%m/%d")
            )

            try:
                self.github_license = repo.get_license().license.name
            except github.UnknownObjectException:
                pass


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
    base_nvidia_image: str


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


def main():
    parser = argparse.ArgumentParser()
    # parser.add_argument("--arxiv_url", "-a")
    parser.add_argument("--github_url", "-g")
    parser.add_argument(
        "--base_nvidia_image",
        "-b",
        default="nvidia/cuda:11.8.0-cudnn8-devel-ubuntu22.04",
    )
    args = parser.parse_args()

    # arxiv_url = args.arxiv_url
    # arxiv_url = "https://arxiv.org/abs/1612.00593"
    github_url = args.github_url
    # github_url = "https://github.com/charlesq34/pointnet"
    base_nvidia_image = args.base_nvidia_image
    # base_nvidia_image = "nvidia/cuda:11.8.0-cudnn8-devel-ubuntu22.04"

    # arxiv_data = vars(ArxivData(arxiv_url))
    github_data = vars(GithubData(github_url))
    data_dict = github_data | {
        "update_date": datetime.datetime.now().strftime("%Y/%m/%d"),
        "base_nvidia_image": base_nvidia_image,
    }
    data = Data(**data_dict)

    new_script_dir = os.path.join(DIR_PATH, "..", data.github_dir)
    if os.path.exists(new_script_dir):
        raise ValueError(f"Already exists: {new_script_dir}")

    os.makedirs(os.path.join(new_script_dir, "scripts_in_container"))
    _ = create_doc(
        data,
        os.path.join(DIR_PATH, "template/README.md"),
        os.path.join(new_script_dir, "README.md"),
    )
    _ = create_doc(
        data,
        os.path.join(DIR_PATH, "template/Dockerfile"),
        os.path.join(new_script_dir, "Dockerfile"),
    )
    _ = create_doc(
        data,
        os.path.join(DIR_PATH, "template/docker_buildrun.sh"),
        os.path.join(new_script_dir, "docker_buildrun.sh"),
    )
    _ = create_doc(
        data,
        os.path.join(DIR_PATH, "template/scripts_in_container/demo.sh"),
        os.path.join(new_script_dir, "scripts_in_container/demo.sh"),
    )
    _ = create_doc(
        data,
        os.path.join(DIR_PATH, "template/scripts_in_container/setup_package.sh"),
        os.path.join(new_script_dir, "scripts_in_container/setup_package.sh"),
    )
    _ = create_doc(
        data,
        os.path.join(DIR_PATH, "template/scripts_in_container/requirements.txt"),
        os.path.join(new_script_dir, "scripts_in_container/requirements.txt"),
    )


if __name__ == "__main__":
    main()
