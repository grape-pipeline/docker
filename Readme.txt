# build using jinja2 templates
python -c 'import jinja2; print jinja2.Template(open("./Dockerfile").read()).render(version="2.19.1")' | docker build -t grape/bedtools:2.19.1 -
