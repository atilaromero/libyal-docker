FROM atilaromero/libyal:builder-debian-sid-1.3.0

WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libbfio.git
WORKDIR /usr/local/src/libbfio
RUN git checkout 20170123
WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libcdata.git
WORKDIR /usr/local/src/libcdata
RUN git checkout 20170102
WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libcerror.git
WORKDIR /usr/local/src/libcerror
RUN git checkout 20170824
WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libcfile.git
WORKDIR /usr/local/src/libcfile
RUN git checkout 20170105
WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libclocale.git
WORKDIR /usr/local/src/libclocale
RUN git checkout 20170105
WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libcnotify.git
WORKDIR /usr/local/src/libcnotify
RUN git checkout 20170311
WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libcpath.git
WORKDIR /usr/local/src/libcpath
RUN git checkout 20171210
WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libcsplit.git
WORKDIR /usr/local/src/libcsplit
RUN git checkout 20170311
WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libcthreads.git
WORKDIR /usr/local/src/libcthreads
RUN git checkout 20170101
WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libhmac.git
WORKDIR /usr/local/src/libhmac
RUN git checkout 20170117
WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libuna.git
WORKDIR /usr/local/src/libuna
RUN git checkout 20170825
WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libodraw.git
WORKDIR /usr/local/src/libodraw
RUN git checkout 20171105
RUN ln -s ../libbfio/libbfio/
RUN ln -s ../libcdata/libcdata/
RUN ln -s ../libcerror/libcerror/
RUN ln -s ../libcfile/libcfile/
RUN ln -s ../libclocale/libclocale/
RUN ln -s ../libcnotify/libcnotify/
RUN ln -s ../libcpath/libcpath/
RUN ln -s ../libcsplit/libcsplit/
RUN ln -s ../libcthreads/libcthreads/
RUN ln -s ../libhmac/libhmac/
RUN ln -s ../libuna/libuna/
ENV CONFIGURE_OPTIONS --prefix=/usr
RUN ./autogen.sh
RUN ./configure ${CONFIGURE_OPTIONS}
RUN make install
RUN ldconfig
RUN make dist-gzip
RUN cp -rf dpkg debian
RUN dpkg-buildpackage -b -us -uc -rfakeroot
