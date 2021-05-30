FROM python:3.8

WORKDIR /app/

RUN pip install numpy

# TA-Lib
RUN wget http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz && \
  tar -xvzf ta-lib-0.4.0-src.tar.gz && \
  cd ta-lib/ && \
  ./configure --prefix=/usr && \
  make && \
  make install

RUN rm -R ta-lib ta-lib-0.4.0-src.tar.gz

COPY main.py /app
COPY settings.py /app
COPY requirements.txt /app
RUN pip install -r requirements.txt

RUN mkdir -p /root/.jupyter
RUN cd /root/.jupyter && jupyter notebook --generate-config
RUN sed -i "s/# c.NotebookApp.token = '<generated>'/c.NotebookApp.token = \'\'/" /root/.jupyter/jupyter_notebook_config.py
RUN jupyter nbextensions_configurator enable --user
RUN jupyter contrib nbextension install --user
RUN jupyter nbextension enable codefolding/main
RUN jupyter nbextension enable collapsible_headings/main
RUN jupyter nbextension enable --py widgetsnbextension

ADD notebooks /app/notebooks

ENTRYPOINT jupyter notebook --ip=0.0.0.0 --port=7100 --allow-root