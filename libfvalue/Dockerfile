FROM libyal/libcdata:20170102 as libcdata
FROM libyal/libcerror:20170824 as libcerror
FROM libyal/libcnotify:20170311 as libcnotify
FROM libyal/libcthreads:20170101 as libcthreads
FROM libyal/libfdatetime: as libfdatetime
FROM libyal/libfguid:20170112 as libfguid
FROM libyal/libfwnt:20170115 as libfwnt
FROM libyal/libuna:20170825 as libuna
FROM libyal/builder:builder-debian-sid-1.2.0

WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libfvalue.git
WORKDIR /usr/local/src/libfvalue
RUN git checkout 20170113
COPY --from=libcdata /usr/local/src/libcdata/libcdata/ /usr/local/src/libfvalue/libcdata/
COPY --from=libcerror /usr/local/src/libcerror/libcerror/ /usr/local/src/libfvalue/libcerror/
COPY --from=libcnotify /usr/local/src/libcnotify/libcnotify/ /usr/local/src/libfvalue/libcnotify/
COPY --from=libcthreads /usr/local/src/libcthreads/libcthreads/ /usr/local/src/libfvalue/libcthreads/
COPY --from=libfdatetime /usr/local/src/libfdatetime/libfdatetime/ /usr/local/src/libfvalue/libfdatetime/
COPY --from=libfguid /usr/local/src/libfguid/libfguid/ /usr/local/src/libfvalue/libfguid/
COPY --from=libfwnt /usr/local/src/libfwnt/libfwnt/ /usr/local/src/libfvalue/libfwnt/
COPY --from=libuna /usr/local/src/libuna/libuna/ /usr/local/src/libfvalue/libuna/
ENV CONFIGURE_OPTIONS --prefix=/usr
RUN ./autogen.sh
RUN ./configure ${CONFIGURE_OPTIONS}
RUN make install
RUN ldconfig
RUN make dist-gzip
RUN cp -rf dpkg debian
RUN dpkg-buildpackage -b -us -uc -rfakeroot
