FROM libyal/libcdata as libcdata
FROM libyal/libcerror as libcerror
FROM libyal/libcthreads as libcthreads
FROM libyal/builder:builder-debian-sid-1.2.0
ENV LIB_VER latest

RUN git clone https://github.com/libyal/libfcache.git
WORKDIR /usr/local/src/libfcache
RUN /usr/local/src/checkout.sh ${LIB_VER}
COPY --from=libcdata /usr/local/src/libcdata/libcdata/ /usr/local/src/libfcache/libcdata/
COPY --from=libcerror /usr/local/src/libcerror/libcerror/ /usr/local/src/libfcache/libcerror/
COPY --from=libcthreads /usr/local/src/libcthreads/libcthreads/ /usr/local/src/libfcache/libcthreads/
ENV CONFIGURE_OPTIONS --prefix=/usr
RUN ./autogen.sh
RUN ./configure ${CONFIGURE_OPTIONS}
RUN make install
RUN ldconfig
RUN make dist-gzip
RUN cp -rf dpkg debian
RUN dpkg-buildpackage -b -us -uc -rfakeroot
