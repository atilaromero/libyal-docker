FROM atilaromero/libyal:builder-debian-sid-1.3.0

WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libewf.git
WORKDIR /usr/local/src/libewf
RUN git checkout 20171104
ENV CONFIGURE_OPTIONS --prefix=/usr
RUN ./synclibs.sh
RUN ./autogen.sh
RUN ./configure ${CONFIGURE_OPTIONS}
RUN make install
RUN ldconfig
RUN make dist-gzip
RUN cp -rf dpkg debian
RUN dpkg-buildpackage -b -us -uc -rfakeroot
