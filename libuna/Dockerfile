FROM libyal/libcdatetime:2485bb579b  as libcdatetime
FROM libyal/libcerror:20170824 as libcerror
FROM libyal/libclocale:20170105 as libclocale
FROM libyal/libcnotify:20170311 as libcnotify
FROM libyal/builder:builder-debian-sid-1.2.0

WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libcfile.git
WORKDIR /usr/local/src/libcfile
RUN git checkout 20170105
WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libuna.git
WORKDIR /usr/local/src/libuna
RUN git checkout 20170825
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
