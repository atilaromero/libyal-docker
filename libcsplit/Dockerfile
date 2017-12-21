FROM libyal/libcerror as libcerror
FROM libyal/builder:builder-debian-sid-1.2.0
ENV LIB_VER latest

RUN git clone https://github.com/libyal/libcsplit.git
WORKDIR /usr/local/src/libcsplit
RUN /usr/local/src/checkout.sh ${LIB_VER}
COPY --from=libcerror /usr/local/src/libcerror/libcerror/ /usr/local/src/libcsplit/libcerror/
ENV CONFIGURE_OPTIONS --prefix=/usr
RUN ./autogen.sh
RUN ./configure ${CONFIGURE_OPTIONS}
RUN make install
RUN ldconfig
RUN make dist-gzip
RUN cp -rf dpkg debian
RUN dpkg-buildpackage -b -us -uc -rfakeroot
