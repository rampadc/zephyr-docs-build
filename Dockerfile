FROM ubuntu:22.04

# Zephyr's dependencies
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get install -y --no-install-recommends git cmake ninja-build \
  python3 python3-pip
# Zephyr doc's dependencies
RUN apt-get install -y --no-install-recommends doxygen graphviz librsvg2-bin \
  texlive-latex-base texlive-latex-extra latexmk texlive-fonts-recommended
RUN git clone https://github.com/zephyrproject-rtos/zephyr.git
RUN pip install -r ./zephyr/doc/requirements.txt
RUN rm -rf zephyr