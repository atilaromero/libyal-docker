FROM atilaromero/libyal:builder-debian-sid-1.3.1

WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libfwnt.git
WORKDIR /usr/local/src/libfwnt
RUN git checkout 20170115
RUN ./synclibs.sh
RUN ./autogen.sh
ENV CONFIGURE_OPTIONS --prefix=/usr --enable-static-executables=yes --enable-python
RUN ./configure ${CONFIGURE_OPTIONS}
RUN make install
RUN ldconfig
RUN make dist-gzip
RUN cp -rf dpkg debian
RUN dpkg-buildpackage -b -us -uc -rfakeroot
