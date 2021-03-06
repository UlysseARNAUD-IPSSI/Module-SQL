FROM python:3.6

USER 1000:1000

RUN mkdir /home/dev/ && mkdir /home/dev/code/

WORKDIR /home/dev/code/

#ENV http_proxy http://147.215.1.189:3128
#ENV https_proxy http://147.215.1.189:3128

COPY . .
RUN  pip install --upgrade pip && \
  pip install pipenv && \
  pip install pandasql && \
  pipenv install --skip-lock

RUN chown -R 100 /data/db

CMD ["pipenv", "run", "jupyter", "notebook", "--ip=0.0.0.0", "--no-browser", "--allow-root", "--NotebookApp.token=''"]
#CMD ["/bin/bash"]
