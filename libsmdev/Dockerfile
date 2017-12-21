FROM libyal/libcdata:20170102 as libcdata
FROM libyal/libcerror:20170824 as libcerror
FROM libyal/libcfile:20170105 as libcfile
FROM libyal/libclocale:20170105 as libclocale
FROM libyal/libcnotify:20170311 as libcnotify
FROM libyal/libcthreads:20170101 as libcthreads
FROM libyal/libuna:20170825 as libuna
FROM libyal/builder:builder-debian-sid-1.2.0

WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libsmdev.git
WORKDIR /usr/local/src/libsmdev
RUN git checkout 20171112
COPY --from=libcdata /usr/local/src/libcdata/libcdata/ /usr/local/src/libsmdev/libcdata/
COPY --from=libcerror /usr/local/src/libcerror/libcerror/ /usr/local/src/libsmdev/libcerror/
COPY --from=libcfile /usr/local/src/libcfile/libcfile/ /usr/local/src/libsmdev/libcfile/
COPY --from=libclocale /usr/local/src/libclocale/libclocale/ /usr/local/src/libsmdev/libclocale/
COPY --from=libcnotify /usr/local/src/libcnotify/libcnotify/ /usr/local/src/libsmdev/libcnotify/
COPY --from=libcthreads /usr/local/src/libcthreads/libcthreads/ /usr/local/src/libsmdev/libcthreads/
COPY --from=libuna /usr/local/src/libuna/libuna/ /usr/local/src/libsmdev/libuna/
ENV CONFIGURE_OPTIONS --prefix=/usr
RUN ./autogen.sh
RUN ./configure ${CONFIGURE_OPTIONS}
RUN make install
RUN ldconfig
RUN make dist-gzip
RUN cp -rf dpkg debian
RUN dpkg-buildpackage -b -us -uc -rfakeroot
