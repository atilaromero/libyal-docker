FROM libyal/libcerror:20170824 as libcerror
FROM libyal/builder:builder-debian-sid-1.2.0

WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libcnotify.git
WORKDIR /usr/local/src/libcnotify
RUN git checkout 20170311
COPY --from=libcerror /usr/local/src/libcerror/libcerror/ /usr/local/src/libcnotify/libcerror/
ENV CONFIGURE_OPTIONS --prefix=/usr
RUN ./autogen.sh
RUN ./configure ${CONFIGURE_OPTIONS}
RUN make install
RUN ldconfig
RUN make dist-gzip
RUN cp -rf dpkg debian
RUN dpkg-buildpackage -b -us -uc -rfakeroot
