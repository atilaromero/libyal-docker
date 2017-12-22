FROM libyal/builder:builder-debian-sid-1.2.0

WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libcerror.git
WORKDIR /usr/local/src/libcerror
RUN git checkout 20170824
WORKDIR /usr/local/src
RUN git clone https://github.com/libyal/libcdatetime.git
WORKDIR /usr/local/src/libcdatetime
RUN git checkout 2485bb579b 
RUN ln -s ../libcerror/libcerror/
ENV CONFIGURE_OPTIONS --prefix=/usr
RUN ./autogen.sh
RUN ./configure ${CONFIGURE_OPTIONS}
RUN make install
RUN ldconfig
RUN make dist-gzip
RUN cp -rf dpkg debian
RUN dpkg-buildpackage -b -us -uc -rfakeroot
