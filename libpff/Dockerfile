FROM atilaromero/libyal:builder-debian-sid-1.3.1

WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libpff.git
WORKDIR /usr/local/src/libpff
RUN git checkout 45978e56aedfa1a6a352e8992f0db26bbaaab381 
RUN ./synclibs.sh
RUN ./autogen.sh
ENV CONFIGURE_OPTIONS --prefix=/usr --enable-static-executables=yes --enable-python
RUN ./configure ${CONFIGURE_OPTIONS}
RUN make install
RUN ldconfig
RUN make dist-gzip
RUN cp -rf dpkg debian
RUN dpkg-buildpackage -b -us -uc -rfakeroot
