FROM libyal/libcdatetime as libcdatetime
FROM libyal/libcerror as libcerror
FROM libyal/libclocale as libclocale
FROM libyal/libcnotify as libcnotify
FROM libyal/builder:builder-debian-sid-1.2.0
ENV LIB_VER latest

RUN git clone https://github.com/libyal/libuna.git
RUN git clone https://github.com/libyal/libcfile.git
WORKDIR /usr/local/src/libuna
RUN /usr/local/src/checkout.sh ${LIB_VER}
COPY --from=libcdatetime /usr/local/src/libcdatetime/libcdatetime/ /usr/local/src/libuna/libcdatetime/
COPY --from=libcerror /usr/local/src/libcerror/libcerror/ /usr/local/src/libuna/libcerror/
COPY --from=libclocale /usr/local/src/libclocale/libclocale/ /usr/local/src/libuna/libclocale/
COPY --from=libcnotify /usr/local/src/libcnotify/libcnotify/ /usr/local/src/libuna/libcnotify/
RUN ln -s ../libcfile/libcfile/
ENV CONFIGURE_OPTIONS --prefix=/usr
RUN ./autogen.sh
RUN ./configure ${CONFIGURE_OPTIONS}
RUN make install
RUN ldconfig
RUN make dist-gzip
RUN cp -rf dpkg debian
RUN dpkg-buildpackage -b -us -uc -rfakeroot
