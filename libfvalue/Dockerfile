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
RUN git clone https://github.com/libyal/libcnotify.git
WORKDIR /usr/local/src/libcnotify
RUN git checkout 20170311
WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libcthreads.git
WORKDIR /usr/local/src/libcthreads
RUN git checkout 20170101
WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libfdatetime.git
WORKDIR /usr/local/src/libfdatetime
RUN git checkout 
WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libfguid.git
WORKDIR /usr/local/src/libfguid
RUN git checkout 20170112
WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libfwnt.git
WORKDIR /usr/local/src/libfwnt
RUN git checkout 20170115
WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libuna.git
WORKDIR /usr/local/src/libuna
RUN git checkout 20170825
WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libfvalue.git
WORKDIR /usr/local/src/libfvalue
RUN git checkout 20170113
RUN ln -s ../libcdata/libcdata/
RUN ln -s ../libcerror/libcerror/
RUN ln -s ../libcnotify/libcnotify/
RUN ln -s ../libcthreads/libcthreads/
RUN ln -s ../libfdatetime/libfdatetime/
RUN ln -s ../libfguid/libfguid/
RUN ln -s ../libfwnt/libfwnt/
RUN ln -s ../libuna/libuna/
ENV CONFIGURE_OPTIONS --prefix=/usr
RUN ./autogen.sh
RUN ./configure ${CONFIGURE_OPTIONS}
RUN make install
RUN ldconfig
RUN make dist-gzip
RUN cp -rf dpkg debian
RUN dpkg-buildpackage -b -us -uc -rfakeroot
