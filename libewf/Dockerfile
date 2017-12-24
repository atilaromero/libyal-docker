FROM atilaromero/libyal:builder-debian-sid-1.3.0

WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libbfio.git
WORKDIR /usr/local/src/libbfio
RUN git checkout 20170123
WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libcaes.git
WORKDIR /usr/local/src/libcaes
RUN git checkout 20170110
WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libcdata.git
WORKDIR /usr/local/src/libcdata
RUN git checkout 20170102
WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libcdatetime.git
WORKDIR /usr/local/src/libcdatetime
RUN git checkout 2485bb579b 
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
RUN git clone https://github.com/libyal/libfcache.git
WORKDIR /usr/local/src/libfcache
RUN git checkout 20170111
WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libfdata.git
WORKDIR /usr/local/src/libfdata
RUN git checkout 20170112
WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libfguid.git
WORKDIR /usr/local/src/libfguid
RUN git checkout 20170112
WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libfvalue.git
WORKDIR /usr/local/src/libfvalue
RUN git checkout 20170113
WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libhmac.git
WORKDIR /usr/local/src/libhmac
RUN git checkout 20170117
WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libodraw.git
WORKDIR /usr/local/src/libodraw
RUN git checkout 20171105
WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libsmdev.git
WORKDIR /usr/local/src/libsmdev
RUN git checkout 20171112
WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libsmraw.git
WORKDIR /usr/local/src/libsmraw
RUN git checkout 20171105
WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libuna.git
WORKDIR /usr/local/src/libuna
RUN git checkout 20170825
WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libewf.git
WORKDIR /usr/local/src/libewf
RUN git checkout 20171104
RUN ln -s ../libbfio/libbfio/
RUN ln -s ../libcaes/libcaes/
RUN ln -s ../libcdata/libcdata/
RUN ln -s ../libcdatetime/libcdatetime/
RUN ln -s ../libcerror/libcerror/
RUN ln -s ../libcfile/libcfile/
RUN ln -s ../libclocale/libclocale/
RUN ln -s ../libcnotify/libcnotify/
RUN ln -s ../libcpath/libcpath/
RUN ln -s ../libcsplit/libcsplit/
RUN ln -s ../libcthreads/libcthreads/
RUN ln -s ../libfcache/libfcache/
RUN ln -s ../libfdata/libfdata/
RUN ln -s ../libfguid/libfguid/
RUN ln -s ../libfvalue/libfvalue/
RUN ln -s ../libhmac/libhmac/
RUN ln -s ../libodraw/libodraw/
RUN ln -s ../libsmdev/libsmdev/
RUN ln -s ../libsmraw/libsmraw/
RUN ln -s ../libuna/libuna/
ENV CONFIGURE_OPTIONS --prefix=/usr
RUN ./autogen.sh
RUN ./configure ${CONFIGURE_OPTIONS}
RUN make install
RUN ldconfig
RUN make dist-gzip
RUN cp -rf dpkg debian
RUN dpkg-buildpackage -b -us -uc -rfakeroot
