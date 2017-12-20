FROM libyal/libcerror as libcerror
FROM libyal/builder:builder-debian-sid-1.2.0
ENV LIB_VER latest

RUN git clone https://github.com/libyal/libcsplit.git
WORKDIR /usr/local/src/libcsplit
RUN /usr/local/src/checkout.sh latest
COPY --from=libcerror /usr/local/src/libcerror/libcerror/ /usr/local/src/libcsplit/libcerror/
ENV CONFIGURE_OPTIONS --prefix=/usr
RUN /usr/local/src/build.sh
