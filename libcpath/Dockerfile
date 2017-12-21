FROM libyal/libcerror:20170824 as libcerror
FROM libyal/libclocale:20170105 as libclocale
FROM libyal/libcsplit:20170311 as libcsplit
FROM libyal/libuna:20170825 as libuna
FROM libyal/builder:builder-debian-sid-1.2.0

WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libcpath.git
WORKDIR /usr/local/src/libcpath
RUN git checkout 20171210
COPY --from=libcerror /usr/local/src/libcerror/libcerror/ /usr/local/src/libcpath/libcerror/
COPY --from=libclocale /usr/local/src/libclocale/libclocale/ /usr/local/src/libcpath/libclocale/
COPY --from=libcsplit /usr/local/src/libcsplit/libcsplit/ /usr/local/src/libcpath/libcsplit/
COPY --from=libuna /usr/local/src/libuna/libuna/ /usr/local/src/libcpath/libuna/
ENV CONFIGURE_OPTIONS --prefix=/usr
RUN ./autogen.sh
RUN ./configure ${CONFIGURE_OPTIONS}
RUN make install
RUN ldconfig
RUN make dist-gzip
RUN cp -rf dpkg debian
RUN dpkg-buildpackage -b -us -uc -rfakeroot
