FROM kalininalex/image-transfer-learning
WORKDIR /usr/src/app
RUN rm *.ipynb
RUN rm -rf demo
RUN rm -rf images
RUN pip install --ignore-installed --upgrade https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-1.4.0-cp35-cp35m-linux_x86_64.whl
COPY start-notebook ./
COPY jupyter_with_zoo.sh ./
CMD ["/bin/bash", "-i", "./jupyter-with-zoo.sh"]