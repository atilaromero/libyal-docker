FROM libyal/libcdata as libcdata
FROM libyal/libcerror as libcerror
FROM libyal/libcnotify as libcnotify
FROM libyal/libcthreads as libcthreads
FROM libyal/libfdatetime as libfdatetime
FROM libyal/libfguid as libfguid
FROM libyal/libfwnt as libfwnt
FROM libyal/libuna as libuna
FROM libyal/builder:builder-debian-sid-1.2.0
ENV LIB_VER latest

RUN git clone https://github.com/libyal/libfvalue.git
WORKDIR /usr/local/src/libfvalue
RUN /usr/local/src/checkout.sh latest
COPY --from=libcdata /usr/local/src/libcdata/libcdata/ /usr/local/src/libfvalue/libcdata/
COPY --from=libcerror /usr/local/src/libcerror/libcerror/ /usr/local/src/libfvalue/libcerror/
COPY --from=libcnotify /usr/local/src/libcnotify/libcnotify/ /usr/local/src/libfvalue/libcnotify/
COPY --from=libcthreads /usr/local/src/libcthreads/libcthreads/ /usr/local/src/libfvalue/libcthreads/
COPY --from=libfdatetime /usr/local/src/libfdatetime/libfdatetime/ /usr/local/src/libfvalue/libfdatetime/
COPY --from=libfguid /usr/local/src/libfguid/libfguid/ /usr/local/src/libfvalue/libfguid/
COPY --from=libfwnt /usr/local/src/libfwnt/libfwnt/ /usr/local/src/libfvalue/libfwnt/
COPY --from=libuna /usr/local/src/libuna/libuna/ /usr/local/src/libfvalue/libuna/
ENV CONFIGURE_OPTIONS --prefix=/usr
RUN /usr/local/src/build.sh
