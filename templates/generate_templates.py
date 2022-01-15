#!/usr/bin/env python

from jinja2 import Environment, FileSystemLoader
from pathlib import Path

root = Path(__file__).parent.parent

file_loader = FileSystemLoader(list(root.iterdir()))
env = Environment(loader=file_loader)

init_template = root.rglob('init.*_template.lua')

for file in init_template:
    template = env.get_template(file.name)
    output = template.render()
    with open (file.parent.joinpath('init.lua'), 'w') as f:
        f.write(output)
