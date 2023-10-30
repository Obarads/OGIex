import glob
import os
import re
from typing import List
import config

INFO_SECTION = r"\n## ℹ️ Info"
SETUP_SECTION = r"\n## 🖥️ Setup commands to run the implementation"
SETUP_WIP_SECTION = r"\n## 🖥️ \(WIP\) Setup commands to run the implementation"
CLIP_SECTION = r"\n## 📝 Clipping and note"
REFERENCE_SECTION = r"\n## 📚 References"
DOCS_PATH = os.path.abspath(os.path.join(os.path.dirname(__file__), "../../docs"))


def list_to_markdown_table(list_data, header_list):
    markdown_table = "| " + " | ".join(header_list) + " |\n"
    markdown_table += "| " + " | ".join(["---"] * len(header_list)) + " |\n"

    for data in list_data:
        markdown_table += "| " + " | ".join(data) + " |\n"

    return markdown_table


class Structuring:
    def __init__(self, file_path: str):
        self.file_path = file_path
        with open(file_path, "r") as f:
            raw_text = f.read()

        self.title = raw_text.split("\n")[0].replace("# ", "").replace("'", "\\'")

        info_section_index = self.get_section_index(raw_text, INFO_SECTION)
        setup_section_index = self.get_section_index(raw_text, SETUP_SECTION)
        if setup_section_index is None:
            setup_section_index = self.get_section_index(raw_text, SETUP_WIP_SECTION)
        # clip_section_index = self.get_section_index(raw_text, CLIP_SECTION)
        # reference_section_index = self.get_section_index(raw_text, REFERENCE_SECTION)

        info_section_data = raw_text[info_section_index:setup_section_index]
        # setup_section_data = raw_text[setup_section_index:clip_section_index]
        # clip_section_data = raw_text[clip_section_index:reference_section_index]
        # reference_section_data = raw_text[reference_section_index:]

        self.info = self.convert_notation(self.extract_info(info_section_data))

    @staticmethod
    def get_section_index(text: str, section: str):
        pattern = re.compile(section)
        match = pattern.search(text)
        if match:
            section_index = match.start()
        else:
            section_index = None
        return section_index

    @staticmethod
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

        # format the info
        info_dict = {}
        if "Paper" in parsed_info[0]:
            info_dict["Paper"] = parsed_info[0]
        elif "Document" in parsed_info[0]:
            info_dict["Document"] = parsed_info[0]
        else:
            raise ValueError(f"Invalid info format: {text}")

        info_dict["Implementation"] = parsed_info[1]
        info_dict["Keywords"] = parsed_info[2]

        return info_dict

    @staticmethod
    def convert_notation(info_dict):
        if "Paper" in info_dict:
            # Official or unofficial code
            if info_dict["Implementation"]["Official code"] == "Yes":
                info_dict["Implementation"]["Official code"] = "Official"
            elif info_dict["Implementation"]["Official code"] == "No":
                info_dict["Implementation"]["Official code"] = "Unofficial"
            else:
                raise ValueError(
                    f"Invalid official code format: {info_dict['Implementation']['Official code']}"
                )

            # Paper
            info_dict["Paper"] |= info_dict["Paper"].pop("Paper")
        elif "Document" in info_dict:
            # Document
            info_dict["Document"] |= info_dict["Document"].pop("Document")
            info_dict["Document"]["Official code"] = "Official"
        else:
            raise ValueError(f"Invalid info format: {info_dict}")

        # Implementation
        info_dict["Implementation"] |= info_dict["Implementation"].pop("Implementation")
        info_dict["Implementation"]["Basename"] = os.path.basename(
            info_dict["Implementation"]["URL"]
        )

        return info_dict


def main():
    file_paths = sorted(glob.glob(os.path.join(DOCS_PATH, "*.md")))

    list_data = []

    list_data = []
    for file_path in file_paths:
        s = Structuring(file_path)
        if (
            "Paper" in s.info
            and s.info["Implementation"]["Basename"] in config.available_script_list
        ):
            list_data.append(
                [
                    f"[{s.info['Implementation']['Basename']}](./environments/{s.info['Implementation']['Basename']})",
                    f"[{s.info['Implementation']['Official code']}]({s.info['Implementation']['URL']})",
                    f"[{s.title}]({s.info['Paper']['URL']})",
                ]
            )

    list_data = sorted(list_data, key=lambda x: x[0])
    print(list_to_markdown_table(list_data, ["Dirname", "Code", "Paper"]))


if __name__ == "__main__":
    main()
