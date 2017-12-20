FROM libyal/libcdatetime as libcdatetime
FROM libyal/libcerror as libcerror
FROM libyal/libcfile as libcfile
FROM libyal/libclocale as libclocale
FROM libyal/libcnotify as libcnotify
FROM libyal/builder:builder-debian-sid-1.2.0
ENV LIB_VER latest

RUN git clone https://github.com/libyal/libuna.git
WORKDIR /usr/local/src/libuna
RUN /usr/local/src/checkout.sh latest
COPY --from=libcdatetime /usr/local/src/libcdatetime/libcdatetime/ /usr/local/src/libuna/libcdatetime/
COPY --from=libcerror /usr/local/src/libcerror/libcerror/ /usr/local/src/libuna/libcerror/
COPY --from=libcfile /usr/local/src/libcfile/libcfile/ /usr/local/src/libuna/libcfile/
COPY --from=libclocale /usr/local/src/libclocale/libclocale/ /usr/local/src/libuna/libclocale/
COPY --from=libcnotify /usr/local/src/libcnotify/libcnotify/ /usr/local/src/libuna/libcnotify/
ENV CONFIGURE_OPTIONS --prefix=/usr
RUN /usr/local/src/build.sh
