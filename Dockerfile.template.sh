#!/bin/bash

for LIB in ${LOCAL_LIBS}
do
  echo 'FROM libyal/'${LIB}' as '${LIB%:*}
done

cat <<'EOF'
FROM libyal/builder:${BASEIMAGE}
ENV LIB_VER ${LIB_VER}

RUN git clone https://github.com/libyal/${LIB_NAME}.git
EOF

for LIB in ${LN_LIBS}
do
  LIB=${LIB%:*}
  echo "RUN git clone https://github.com/libyal/${LIB}.git"
done

cat <<'EOF'
WORKDIR ${SRC_BASE}/${LIB_NAME}
RUN ${SRC_BASE}/checkout.sh ${DOLLAR}{LIB_VER}
EOF

for LIB in ${LOCAL_LIBS}
do
  LIB=${LIB%:*}
  echo "COPY --from=${LIB} \${SRC_BASE}/${LIB}/${LIB}/ \${SRC_BASE}/\${LIB_NAME}/${LIB}/"
done

for LIB in ${LN_LIBS}
do
  LIB=${LIB%:*}
  echo "RUN ln -s ../${LIB}/${LIB}/"
done

cat <<'EOF'
ENV CONFIGURE_OPTIONS ${CONFIGURE_OPTIONS}
RUN ./autogen.sh
RUN ./configure ${DOLLAR}{CONFIGURE_OPTIONS}
RUN make install
RUN ldconfig
RUN make dist-gzip
RUN cp -rf dpkg debian
RUN dpkg-buildpackage -b -us -uc -rfakeroot
EOF
