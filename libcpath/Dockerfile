FROM libyal/libcerror as libcerror
FROM libyal/libclocale as libclocale
FROM libyal/libcsplit as libcsplit
FROM libyal/libuna as libuna
FROM libyal/builder:builder-debian-sid-1.2.0
ENV LIB_VER latest

RUN git clone https://github.com/libyal/libcpath.git
WORKDIR /usr/local/src/libcpath
RUN /usr/local/src/checkout.sh ${LIB_VER}
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
