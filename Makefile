.PHONY: all
BASEREPO ?= libyal
export BASEREPO
BASEIMAGE ?= builder-debian-sid-1.2.0
export BASEIMAGE
SRC_BASE ?= /usr/local/src
export SRC_BASE
CONFIGURE_OPTIONS ?= --prefix=/usr
export CONFIGURE_OPTIONS
DOLLAR := $$
export DOLLAR

SUBDIRS := libcerror libclocale libbfio libcaes libcdata libcdatetime
SUBDIRS += libcfile libcnotify libcpath libcsplit libcthreads libfcache
SUBDIRS += libfdata libfguid libfvalue libhmac libodraw libsmdev libsmraw
SUBDIRS += libuna libfwnt

libcerror/Dockerfile:    export LOCAL_LIBS=
libcaes/Dockerfile:      export LOCAL_LIBS=libcerror
libcdatetime/Dockerfile: export LOCAL_LIBS=libcerror
libclocale/Dockerfile:   export LOCAL_LIBS=libcerror
libcnotify/Dockerfile:   export LOCAL_LIBS=libcerror
libcsplit/Dockerfile:    export LOCAL_LIBS=libcerror
libcthreads/Dockerfile:  export LOCAL_LIBS=libcerror
libfguid/Dockerfile:     export LOCAL_LIBS=libcerror
libcdata/Dockerfile:     export LOCAL_LIBS=libcerror libcthreads
libuna/Dockerfile:       export LOCAL_LIBS=libcdatetime libcerror libclocale libcnotify
libuna/Dockerfile:       export LN_LIBS=libcfile
libcfile/Dockerfile:     export LOCAL_LIBS=libcerror libclocale libcnotify libuna
libcpath/Dockerfile:     export LOCAL_LIBS=libcerror libclocale libcsplit libuna
libbfio/Dockerfile:      export LOCAL_LIBS=libcdata libcerror libcfile libclocale libcnotify libcpath libcsplit libcthreads libuna
libfcache/Dockerfile:    export LOCAL_LIBS=libcdata libcerror libcthreads
libfdata/Dockerfile:     export LOCAL_LIBS=libcdata libcerror libcnotify libcthreads libfcache
libfwnt/Dockerfile:      export LOCAL_LIBS=libcdata libcerror libcnotify libcthreads
libfvalue/Dockerfile:    export LOCAL_LIBS=libcdata libcerror libcnotify libcthreads libfdatetime libfguid libfwnt libuna
libhmac/Dockerfile:      export LOCAL_LIBS=libcerror libcfile libclocale libcnotify libcpath libcsplit libuna
libodraw/Dockerfile:     export LOCAL_LIBS=libbfio libcdata libcerror libcfile libclocale libcnotify libcpath libcsplit libcthreads libhmac libuna
libsmdev/Dockerfile:     export LOCAL_LIBS=libcdata libcerror libcfile libclocale libcnotify libcthreads libuna
libsmraw/Dockerfile:     export LOCAL_LIBS=libbfio libcdata libcerror libcfile libclocale libcnotify libcpath libcsplit libcthreads libfcache libfdata libfvalue libhmac libuna
libewf/Dockerfile:       export LOCAL_LIBS=libbfio libcaes libcdata libcdatetime libcerror libcfile libclocale libcnotify libcpath libcsplit libcthreads libfcache libfdata libfguid libfvalue libhmac libodraw libsmdev libsmraw libuna

libcerror/Dockerfile:    export LIB_VER=latest
libcaes/Dockerfile:      export LIB_VER=latest
libcdatetime/Dockerfile: export LIB_VER=master
libclocale/Dockerfile:   export LIB_VER=latest
libcnotify/Dockerfile:   export LIB_VER=latest
libcsplit/Dockerfile:    export LIB_VER=latest
libcthreads/Dockerfile:  export LIB_VER=latest
libfguid/Dockerfile:     export LIB_VER=latest
libcdata/Dockerfile:     export LIB_VER=latest
libuna/Dockerfile:       export LIB_VER=latest
libcfile/Dockerfile:     export LIB_VER=latest
libcpath/Dockerfile:     export LIB_VER=latest
libbfio/Dockerfile:      export LIB_VER=latest
libfcache/Dockerfile:    export LIB_VER=latest
libfdata/Dockerfile:     export LIB_VER=latest
libfwnt/Dockerfile:      export LIB_VER=latest
libfvalue/Dockerfile:    export LIB_VER=latest
libhmac/Dockerfile:      export LIB_VER=latest
libodraw/Dockerfile:     export LIB_VER=latest
libsmdev/Dockerfile:     export LIB_VER=latest
libsmraw/Dockerfile:     export LIB_VER=latest
libewf/Dockerfile:       export LIB_VER=latest

all: $(SUBDIRS:%=%/Dockerfile)

$(SUBDIRS:%=%/):
	mkdir $@

$(SUBDIRS:%=%/hooks/post_push): post_push
	mkdir -p $(dir $@)
	cp post_push $(dir $@)

$(SUBDIRS:%=%/hooks/push): push
	mkdir -p $(dir $@)
	cp push $(dir $@)

%/Dockerfile: export LIB_NAME=$(@D)
%/Dockerfile: Dockerfile.template.sh %/ %/hooks/post_push %/hooks/push Makefile
	./Dockerfile.template.sh |envsubst '$${LIB_NAME} $${BASEREPO} $${BASEIMAGE} $${SRC_BASE} $${CONFIGURE_OPTIONS} $${LIB_VER} $${DOLLAR}' > $@
