#!/bin/bash

if [ $USE_COPY == true ]
then
  for LIB in ${LOCAL_LIBS}
  do
    ARR=(${LIB/:/ })
    LIB=${ARR[0]}
    VER=${ARR[1]}
    if [ "$VER" == '' ]
    then
      VER=${!LIB}
    fi
    echo 'FROM ${BASEREPO}:'${LIB}-${VER}' as '${LIB}
  done
fi
echo   'FROM ${BASEREPO}:${BASETAG}'
echo

if [ $USE_LN == true ]
then
  LN_LIBS=${LOCAL_LIBS}
fi
for LIB in ${LN_LIBS} ${LIB_NAME}
do
  ARR=(${LIB/:/ })
  LIB=${ARR[0]}
  VER=${ARR[1]}
  if [ "$VER" == '' ]
  then
    VER=${!LIB}
  fi
  echo "WORKDIR ${SRC_BASE}"
  echo "RUN git clone https://github.com/libyal/${LIB}.git"
  echo "WORKDIR ${SRC_BASE}/${LIB}"
  echo "RUN git checkout ${VER}"
done

if [ $USE_COPY == true ]
then
  for LIB in ${LOCAL_LIBS}
  do
    echo "COPY --from=${LIB} \${SRC_BASE}/${LIB}/${LIB}/ \${SRC_BASE}/\${LIB_NAME}/${LIB}/"
  done
fi

if [ $USE_LN == true ]
then
  for LIB in ${LN_LIBS}
  do
    LIB=${LIB%:*}
    echo "RUN ln -s ../${LIB}/${LIB}/"
  done
fi

echo 'ENV CONFIGURE_OPTIONS ${CONFIGURE_OPTIONS}'

if [ $USE_SYNC == true ]
then
  echo 'RUN ./synclibs.sh'
fi

cat <<'EOF'
RUN ./autogen.sh
RUN ./configure ${DOLLAR}{CONFIGURE_OPTIONS}
RUN make install
RUN ldconfig
RUN make dist-gzip
RUN cp -rf dpkg debian
RUN dpkg-buildpackage -b -us -uc -rfakeroot
EOF
