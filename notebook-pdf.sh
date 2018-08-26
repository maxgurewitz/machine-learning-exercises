# e.g. sh notebook-pdf.sh sutton-barto-reinforcement-ch-2
jupyter nbconvert --to pdf --template jupyter-template.tpl notebooks/$1.ipynb
