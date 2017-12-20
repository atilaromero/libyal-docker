FROM quay.io/libyal-docker/builder:debian-sid-1.0.0

ENV SRC_BASE /usr/local/src/
ENV CONFIGURE_OPTIONS --prefix=/usr

ENV LIB_NAME libbfio
RUN ${SRC_BASE}/clone.sh

ENV LIB_NAME libcaes
RUN ${SRC_BASE}/clone.sh

ENV LIB_NAME libcdata
RUN ${SRC_BASE}/clone.sh

ENV LIB_NAME libcdatetime
RUN ${SRC_BASE}/clone.sh

ENV LIB_NAME libcerror
RUN ${SRC_BASE}/clone.sh

ENV LIB_NAME libcfile
RUN ${SRC_BASE}/clone.sh

ENV LIB_NAME libclocale
RUN ${SRC_BASE}/clone.sh

ENV LIB_NAME libcnotify
RUN ${SRC_BASE}/clone.sh

ENV LIB_NAME libcpath
RUN ${SRC_BASE}/clone.sh

ENV LIB_NAME libcsplit
RUN ${SRC_BASE}/clone.sh

ENV LIB_NAME libcthreads
RUN ${SRC_BASE}/clone.sh

ENV LIB_NAME libfcache
RUN ${SRC_BASE}/clone.sh

ENV LIB_NAME libfdata
RUN ${SRC_BASE}/clone.sh

ENV LIB_NAME libfguid
RUN ${SRC_BASE}/clone.sh

ENV LIB_NAME libfvalue
RUN ${SRC_BASE}/clone.sh

ENV LIB_NAME libhmac
RUN ${SRC_BASE}/clone.sh

ENV LIB_NAME libodraw
RUN ${SRC_BASE}/clone.sh

ENV LIB_NAME libsmdev
RUN ${SRC_BASE}/clone.sh

ENV LIB_NAME libsmraw
RUN ${SRC_BASE}/clone.sh

ENV LIB_NAME libuna
RUN ${SRC_BASE}/clone.sh

ENV LIB_NAME libodraw
ENV LIB_VER 20170217
RUN ${SRC_BASE}/clone.sh
RUN ${SRC_BASE}/build.sh

ENV LIB_NAME libewf
ENV LIB_VER 20170703
ENV CONFIGURE_OPTIONS --prefix=/usr --enable-shared=no --enable-static-executables=yes --enable-python
RUN ${SRC_BASE}/clone.sh
RUN ./synclibs.sh
RUN rm -r libodraw
RUN ln -s ../libodraw/libodraw/
RUN ./autogen.sh
RUN ./configure ${CONFIGURE_OPTIONS}
RUN make install
RUN ldconfig
RUN make dist-gzip
RUN cp -rf dpkg debian
RUN dpkg-buildpackage -b -us -uc -rfakeroot
