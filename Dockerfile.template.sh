#!/bin/bash

for LIB in ${LOCAL_LIBS}
do
  echo 'FROM libyal/'${LIB}' as '${LIB%:*}
done

cat <<'EOF'
FROM libyal/builder:${BASEIMAGE}
ENV LIB_VER ${LIB_VER}

RUN git clone https://github.com/libyal/${LIB_NAME}.git
WORKDIR ${SRC_BASE}/${LIB_NAME}
RUN ${SRC_BASE}/checkout.sh ${LIB_VER}
EOF

for LIB in ${LOCAL_LIBS}
do
  LIB=${LIB%:*}
  echo "COPY --from=${LIB} \${SRC_BASE}/${LIB}/${LIB}/ \${SRC_BASE}/\${LIB_NAME}/${LIB}/"
done

cat <<'EOF'
ENV CONFIGURE_OPTIONS ${CONFIGURE_OPTIONS}
RUN ${SRC_BASE}/build.sh
EOF
