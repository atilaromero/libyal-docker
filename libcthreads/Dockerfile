FROM libyal/libcerror:20170824 as libcerror
FROM libyal/builder:builder-debian-sid-1.2.0

WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libcthreads.git
WORKDIR /usr/local/src/libcthreads
RUN git checkout 20170101
COPY --from=libcerror /usr/local/src/libcerror/libcerror/ /usr/local/src/libcthreads/libcerror/
ENV CONFIGURE_OPTIONS --prefix=/usr
RUN ./autogen.sh
RUN ./configure ${CONFIGURE_OPTIONS}
RUN make install
RUN ldconfig
RUN make dist-gzip
RUN cp -rf dpkg debian
RUN dpkg-buildpackage -b -us -uc -rfakeroot
