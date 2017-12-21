FROM libyal/libcerror as libcerror
FROM libyal/libcfile as libcfile
FROM libyal/libclocale as libclocale
FROM libyal/libcnotify as libcnotify
FROM libyal/libcpath as libcpath
FROM libyal/libcsplit as libcsplit
FROM libyal/libuna as libuna
FROM libyal/builder:builder-debian-sid-1.2.0
ENV LIB_VER latest

RUN git clone https://github.com/libyal/libhmac.git
WORKDIR /usr/local/src/libhmac
RUN /usr/local/src/checkout.sh ${LIB_VER}
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
