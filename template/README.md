### Create setup code
```bash
python create_code.py -g <github URL>
```

### Get package list
```bash
pip list --format=freeze > requirements_all.txt
```

### Get and apply diff file
```bash
# get diff
git diff -- $FILE_PATH
# apply diff
git apply code.diff
```
