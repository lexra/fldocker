
FROM flml/flashlight:cuda-latest

WORKDIR /root
COPY requirements.txt .

RUN mkdir -p /docker_mount
RUN rm -rfv /etc/apt/sources.list.d/intel-mkl.list
RUN [ ! -e /etc/apt/sources.list.d/intel-mkl.list ] && apt update
RUN apt install -y vim p7zip-full p7zip-rar iputils-ping net-tools udhcpc cython rar libsqlite3-dev
RUN apt install -y dirmngr --install-recommends
RUN pip3 install gdown

RUN apt install -y python-is-python3 libopencv-dev
RUN pip3 install opencv-python

#RUN /usr/bin/pip3 install tensorboard==2.4.0 tensorflow==2.4.0 grpcio==1.32.0 absl-py==0.10 six==1.15.0 wheel==0.35
#RUN /usr/bin/pip3 install -r requirements.txt

RUN git clone https://github.com/HimaxWiseEyePlus/Yolo-Fastest.git \
	&& cd Yolo-Fastest && make -j8 
RUN cd Yolo-Fastest && git clone https://github.com/lexra/wheelchair.git






