FROM libyal/libcdata:20170102 as libcdata
FROM libyal/libcerror:20170824 as libcerror
FROM libyal/libcnotify:20170311 as libcnotify
FROM libyal/libcthreads:20170101 as libcthreads
FROM libyal/libfcache:20170111 as libfcache
FROM libyal/builder:builder-debian-sid-1.2.0

WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libfdata.git
WORKDIR /usr/local/src/libfdata
RUN git checkout 20170112
COPY --from=libcdata /usr/local/src/libcdata/libcdata/ /usr/local/src/libfdata/libcdata/
COPY --from=libcerror /usr/local/src/libcerror/libcerror/ /usr/local/src/libfdata/libcerror/
COPY --from=libcnotify /usr/local/src/libcnotify/libcnotify/ /usr/local/src/libfdata/libcnotify/
COPY --from=libcthreads /usr/local/src/libcthreads/libcthreads/ /usr/local/src/libfdata/libcthreads/
COPY --from=libfcache /usr/local/src/libfcache/libfcache/ /usr/local/src/libfdata/libfcache/
ENV CONFIGURE_OPTIONS --prefix=/usr
RUN ./autogen.sh
RUN ./configure ${CONFIGURE_OPTIONS}
RUN make install
RUN ldconfig
RUN make dist-gzip
RUN cp -rf dpkg debian
RUN dpkg-buildpackage -b -us -uc -rfakeroot
