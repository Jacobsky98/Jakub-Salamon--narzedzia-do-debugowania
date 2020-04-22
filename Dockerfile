FROM debian


RUN apt-get update -y
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
RUN apt-get install -y heaptrack
RUN apt-get install -y linux-perf linux-base
RUN apt install -y g++
RUN apt install -y cmake
RUN apt install -y gdb
RUN apt install -y dstat

COPY README.md /home/root/
COPY Catch2 /home/root/Catch2
COPY zadania /home/root/zadania
COPY test /home/root/test


WORKDIR /home/root/Catch2
RUN cmake -Bbuild -H. -DBUILD_TESTING=OFF
RUN cmake --build build/ --target install


WORKDIR /home/root
