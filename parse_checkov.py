import json
import os

with open('checkov.json') as json_file:
    data = json.load(json_file)
    data = data
    for type in data:
        type = type
        for failed in type['results']['failed_checks']:
            split = failed['repo_file_path'].split('/')
            split[1] = f"{split[1]}_fix"
            file_name = '/'.join(split)
            os.makedirs(os.path.dirname(f".{file_name}"), exist_ok=True)
            if os.path.exists(f".{file_name}"):
                append_write = 'a'  # append if already exists
            else:
                append_write = 'w'  # make a new file if not
            if failed['fixed_definition']:
                split = failed['repo_file_path'].split('/')
                split[1] = f"{split[1]}_fix"
                file1 = open(f".{file_name}", append_write)
                file1.write(f"#{failed['check_name']} \n")
                file1.writelines(failed['fixed_definition'].rstrip("\n"))
                x = "x"
                file1.close()  # to change file access modes
            else:
                x = "x"
                pass

