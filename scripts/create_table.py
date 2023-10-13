import glob
import os
import re
from typing import List

#### Existing coda : Start ####
def get_num_space_for_indentation(text: str):
    return len(text) - len(text.lstrip())

def exist_list(text):
    if len(text) == 0:
        return False

    num_space = get_num_space_for_indentation(text)
    return text[num_space : num_space + 2] == "- "

def markdow_to_list(raw_list, min_space_indentation):
    res_list = []

    prev_space_indentation = 0
    for raw in raw_list:
        if not exist_list(raw):
            break
        current_space_indentation = get_num_space_for_indentation(raw)
        diff_space_indentation = current_space_indentation - prev_space_indentation
        new_content = raw[current_space_indentation + 2 :]
        if diff_space_indentation == 0 or (
            diff_space_indentation < 0
            and (diff_space_indentation % min_space_indentation) == 0
        ):
            indentation = int(current_space_indentation / min_space_indentation)
            sub_res_list = res_list
            for i in range(indentation):
                sub_res_list = sub_res_list[-1]
            sub_res_list.append(new_content)
        elif diff_space_indentation == min_space_indentation:
            indentation = int(current_space_indentation / min_space_indentation)
            sub_res_list = res_list
            for i in range(indentation - 1):
                sub_res_list = sub_res_list[-1]
            sub_res_list.append([new_content])
        else:
            raise ValueError("Invalid indentation")

        prev_space_indentation = current_space_indentation

    return res_list

ELEMENT_INFO = "ℹ️ Info"

#### Existing coda : End ####

def list_to_markdown_table(list_data, header_list):
    markdown_table = "| " + " | ".join(header_list) + " |\n"
    markdown_table += "| " + " | ".join(["---"] * len(header_list)) + " |\n"

    for data in list_data:
        markdown_table += "| " + " | ".join(data) + " |\n"

    return markdown_table

def extract_parentheses_contents(text):
    pattern = re.compile(r'\((.*?)\)')
    contents = pattern.findall(text)
    return contents

def check_official_code(text):
    if text == "Yes":
        official_or_unofficial_code = "Official"
    elif text == "No":
        official_or_unofficial_code = "Unofficial"
    else:
        raise ValueError(f"Invalid official code format: {text}")
    return official_or_unofficial_code

def main():
    ogi_dir_path = os.environ.get("OGI_DIR_PATH")
    file_paths = sorted(glob.glob(os.path.join(ogi_dir_path, "docs/public/data/*.md")))

    list_data = []

    for file_path in file_paths:
        with open(file_path, "r") as f:
            content = f.read()
            content_by_section = content.split("## ")

        # get title
        title: str = None
        title_row = content.split("\n")[0]
        if "# " in title_row:
            title = title_row.replace("# ", "").replace("'", "\\'")
        else:
            raise ValueError(f"Not found title (#): {file_path}")

        # re-format
        content_dict = {c.split("\n")[0]: c.split("\n")[1:] for c in content_by_section}
        if ELEMENT_INFO in content_dict.keys():
            space_indentation_list = []
            for text in content_dict[ELEMENT_INFO]:
                if get_num_space_for_indentation(text) != 0:
                    space_indentation_list.append(get_num_space_for_indentation(text))

            if len(space_indentation_list) > 0:
                min_space_indentation = min(space_indentation_list)
            else:
                raise ValueError(f"Invalid info format (## ℹ️ Info): {file_path}")

            info_data = markdow_to_list(
                content_dict[ELEMENT_INFO], min_space_indentation
            )
        else:
            raise ValueError(f"Invalid info format (## {ELEMENT_INFO}): {file_path}")

        if "Document" in info_data[0]:
            pass
        else:
            github_url = extract_parentheses_contents(info_data[2])[0]
            github_dir_name = github_url.split("/")[-1]
            official_or_unofficial_code = check_official_code(info_data[3][1].split(": ")[1])

            list_data.append([github_dir_name, f"[{official_or_unofficial_code}]({github_url})", title])

    list_data = sorted(list_data, key=lambda x: x[0])

    header_list = ["Dirname", "Code", "Paper"]
    markdown_table = list_to_markdown_table(list_data, header_list)
    print(markdown_table)



if __name__ == '__main__':
    main()