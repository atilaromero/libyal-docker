FROM libyal/libcdata:20170102 as libcdata
FROM libyal/libcerror:20170824 as libcerror
FROM libyal/libcnotify:20170311 as libcnotify
FROM libyal/libcthreads:20170101 as libcthreads
FROM libyal/builder:builder-debian-sid-1.2.0

WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libfwnt.git
WORKDIR /usr/local/src/libfwnt
RUN git checkout 20170115
COPY --from=libcdata /usr/local/src/libcdata/libcdata/ /usr/local/src/libfwnt/libcdata/
COPY --from=libcerror /usr/local/src/libcerror/libcerror/ /usr/local/src/libfwnt/libcerror/
COPY --from=libcnotify /usr/local/src/libcnotify/libcnotify/ /usr/local/src/libfwnt/libcnotify/
COPY --from=libcthreads /usr/local/src/libcthreads/libcthreads/ /usr/local/src/libfwnt/libcthreads/
ENV CONFIGURE_OPTIONS --prefix=/usr
RUN ./autogen.sh
RUN ./configure ${CONFIGURE_OPTIONS}
RUN make install
RUN ldconfig
RUN make dist-gzip
RUN cp -rf dpkg debian
RUN dpkg-buildpackage -b -us -uc -rfakeroot
