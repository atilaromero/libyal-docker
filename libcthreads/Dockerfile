FROM libyal/libcerror as libcerror
FROM libyal/builder:debian-sid-1.1.0
ENV LIB_VER latest

RUN git clone https://github.com/libyal/libcthreads.git
WORKDIR /usr/local/src/libcthreads
RUN /usr/local/src/checkout.sh latest
COPY --from=libcerror /usr/local/src/libcerror/libcerror/ /usr/local/src/libcthreads/libcerror/
ENV CONFIGURE_OPTIONS --prefix=/usr
RUN /usr/local/src/build.sh
