# Setup with templates
## Create setup code
```bash
python create_code.py -g <github URL>
```

## Get package list
```bash
pip list --format=freeze > requirements-all.txt
```

## Get and apply diff file
```bash
# get diff
git diff -- <file path> > code.diff
# apply diff
git apply code.diff
```

