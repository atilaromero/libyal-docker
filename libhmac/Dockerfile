FROM libyal/libcerror:20170824 as libcerror
FROM libyal/libcfile:20170105 as libcfile
FROM libyal/libclocale:20170105 as libclocale
FROM libyal/libcnotify:20170311 as libcnotify
FROM libyal/libcpath:20171210 as libcpath
FROM libyal/libcsplit:20170311 as libcsplit
FROM libyal/libuna:20170825 as libuna
FROM libyal/builder:builder-debian-sid-1.2.0

WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libhmac.git
WORKDIR /usr/local/src/libhmac
RUN git checkout 20170117
COPY --from=libcerror /usr/local/src/libcerror/libcerror/ /usr/local/src/libhmac/libcerror/
COPY --from=libcfile /usr/local/src/libcfile/libcfile/ /usr/local/src/libhmac/libcfile/
COPY --from=libclocale /usr/local/src/libclocale/libclocale/ /usr/local/src/libhmac/libclocale/
COPY --from=libcnotify /usr/local/src/libcnotify/libcnotify/ /usr/local/src/libhmac/libcnotify/
COPY --from=libcpath /usr/local/src/libcpath/libcpath/ /usr/local/src/libhmac/libcpath/
COPY --from=libcsplit /usr/local/src/libcsplit/libcsplit/ /usr/local/src/libhmac/libcsplit/
COPY --from=libuna /usr/local/src/libuna/libuna/ /usr/local/src/libhmac/libuna/
ENV CONFIGURE_OPTIONS --prefix=/usr
RUN ./autogen.sh
RUN ./configure ${CONFIGURE_OPTIONS}
RUN make install
RUN ldconfig
RUN make dist-gzip
RUN cp -rf dpkg debian
RUN dpkg-buildpackage -b -us -uc -rfakeroot
