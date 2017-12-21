FROM libyal/libcerror:20170824 as libcerror
FROM libyal/libcthreads:20170101 as libcthreads
FROM libyal/builder:builder-debian-sid-1.2.0

WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libcdata.git
WORKDIR /usr/local/src/libcdata
RUN git checkout 20170102
COPY --from=libcerror /usr/local/src/libcerror/libcerror/ /usr/local/src/libcdata/libcerror/
COPY --from=libcthreads /usr/local/src/libcthreads/libcthreads/ /usr/local/src/libcdata/libcthreads/
ENV CONFIGURE_OPTIONS --prefix=/usr
RUN ./autogen.sh
RUN ./configure ${CONFIGURE_OPTIONS}
RUN make install
RUN ldconfig
RUN make dist-gzip
RUN cp -rf dpkg debian
RUN dpkg-buildpackage -b -us -uc -rfakeroot
