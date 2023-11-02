import re
from typing import List
import os
import arxiv
import github

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
            g = github.Github()
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




def get_section_index(text: str, section: str):
    pattern = re.compile(section)
    match = pattern.search(text)
    if match:
        section_index = match.start()
    else:
        section_index = None
    return section_index

def extract_info(text):
    lines = text.split("\n")
    parsed_info = []
    current_dict = {}

    for line in lines:
        if line.startswith(
            "- "
        ):  # Major category (e.g., Paper, Implementation, Keywords)
            if (
                current_dict
            ):  # If not the first entry, append the previous dict to the list
                parsed_info.append(current_dict)
            current_dict = {}
            # Extracting major category and its content using regular expression
            m = re.match(r"- (.+): \[(.+)\]\((.+)\)", line)
            if m:  # Match found, i.e., line has link
                key, name, url = m.groups()
                current_dict[key] = {"Name": name, "URL": url}
            else:  # Match not found, i.e., line doesn't have link
                key, content = line[2:].split(": ")
                current_dict[key] = content.split(", ")
        elif line.startswith(
            "  - "
        ):  # Sub-category (e.g., Authors, Conf., framework)
            key, content = line[4:].split(": ")
            # Store the sub-category content into the current dict
            current_dict[key] = content.split(", ") if "," in content else content

    # Append the last dict
    if current_dict:
        parsed_info.append(current_dict)

    return parsed_info
