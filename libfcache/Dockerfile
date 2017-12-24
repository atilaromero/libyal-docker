FROM atilaromero/libyal:builder-debian-sid-1.3.0

WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libcdata.git
WORKDIR /usr/local/src/libcdata
RUN git checkout 20170102
WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libcerror.git
WORKDIR /usr/local/src/libcerror
RUN git checkout 20170824
WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libcthreads.git
WORKDIR /usr/local/src/libcthreads
RUN git checkout 20170101
WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libfcache.git
WORKDIR /usr/local/src/libfcache
RUN git checkout 20170111
RUN ln -s ../libcdata/libcdata/
RUN ln -s ../libcerror/libcerror/
RUN ln -s ../libcthreads/libcthreads/
ENV CONFIGURE_OPTIONS --prefix=/usr
RUN ./autogen.sh
RUN ./configure ${CONFIGURE_OPTIONS}
RUN make install
RUN ldconfig
RUN make dist-gzip
RUN cp -rf dpkg debian
RUN dpkg-buildpackage -b -us -uc -rfakeroot
