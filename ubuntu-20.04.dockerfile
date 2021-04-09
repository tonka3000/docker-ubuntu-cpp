FROM ubuntu:20.04
LABEL tonka3000 <tonka3100@gmail.com>

ENV CONAN_PIP_COMMAND pip3

WORKDIR "/project"

RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install build-essential git-core wget python python3 python3-pip cppcheck libx11-dev vim -y  && \
    apt-get install mesa-common-dev libxt-dev libxmu-dev libxi-dev libgl1-mesa-dev libglu1-mesa-dev -y  && \
    # libs for conan
    apt-get install libssl-dev libffi7 libffi-dev -y && \
    apt-get clean autoclean && \
    apt-get autoremove -y && \
    wget https://cmake.org/files/v3.10/cmake-3.10.2-Linux-x86_64.sh && \
    chmod +x cmake-3.10.2-Linux-x86_64.sh && \
    ./cmake-3.10.2-Linux-x86_64.sh --skip-license --prefix=/usr && \
    rm cmake-3.10.2-Linux-x86_64.sh && \
    pip3 install --no-cache-dir conan==1.32.1 conan_package_tools==0.35.* && \
    conan user

RUN cmake --version && \
    conan --version && \
    g++ --version