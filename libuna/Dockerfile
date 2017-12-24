FROM atilaromero/libyal:builder-debian-sid-1.2.0

WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libcdatetime.git
WORKDIR /usr/local/src/libcdatetime
RUN git checkout 2485bb579b 
WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libcerror.git
WORKDIR /usr/local/src/libcerror
RUN git checkout 20170824
WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libclocale.git
WORKDIR /usr/local/src/libclocale
RUN git checkout 20170105
WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libcnotify.git
WORKDIR /usr/local/src/libcnotify
RUN git checkout master
WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libcfile.git
WORKDIR /usr/local/src/libcfile
RUN git checkout 20170105
WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libuna.git
WORKDIR /usr/local/src/libuna
RUN git checkout 20170825
RUN ln -s ../libcdatetime/libcdatetime/
RUN ln -s ../libcerror/libcerror/
RUN ln -s ../libclocale/libclocale/
RUN ln -s ../libcnotify/libcnotify/
RUN ln -s ../libcfile/libcfile/
ENV CONFIGURE_OPTIONS --prefix=/usr
RUN ./autogen.sh
RUN ./configure ${CONFIGURE_OPTIONS}
RUN make install
RUN ldconfig
RUN make dist-gzip
RUN cp -rf dpkg debian
RUN dpkg-buildpackage -b -us -uc -rfakeroot
