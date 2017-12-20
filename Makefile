.PHONY: all

BASEIMAGE ?= builder-debian-sid-1.2.0
export BASEIMAGE
SRC_BASE ?= /usr/local/src
export SRC_BASE
CONFIGURE_OPTIONS ?= --prefix=/usr
export CONFIGURE_OPTIONS
LIB_VER ?= latest
export LIB_VER

SUBDIRS := libcerror libclocale libbfio libcaes libcdata libcdatetime
SUBDIRS += libcfile libcnotify libcpath libcsplit libcthreads libfcache
SUBDIRS += libfdata libfguid libfvalue libhmac libodraw libsmdev libsmraw
SUBDIRS += libuna

libbfio/Dockerfile: export LOCAL_LIBS=libcdata libcerror libcfile libclocale libcnotify libcpath libcsplit libcthreads libuna
libcaes/Dockerfile: export LOCAL_LIBS=libcerror
libcdata/Dockerfile: export LOCAL_LIBS=libcerror libcthreads
libcdatetime/Dockerfile: export LOCAL_LIBS=libcerror
libcerror/Dockerfile: export LOCAL_LIBS=
libcfile/Dockerfile: export LOCAL_LIBS=libcerror libclocale libcnotify libuna
libclocale/Dockerfile: export LOCAL_LIBS=libcerror
libcnotify/Dockerfile: export LOCAL_LIBS=libcerror
libcpath/Dockerfile: export LOCAL_LIBS=libcerror libclocale libcsplit libuna
libcsplit/Dockerfile: export LOCAL_LIBS=libcerror
libcthreads/Dockerfile: export LOCAL_LIBS=libcerror
libewf/Dockerfile: export LOCAL_LIBS=libbfio libcaes libcdata libcdatetime libcerror libcfile libclocale libcnotify libcpath libcsplit libcthreads libfcache libfdata libfguid libfvalue libhmac libodraw libsmdev libsmraw libuna
libfcache/Dockerfile: export LOCAL_LIBS=libcdata libcerror libcthreads
libfdata/Dockerfile: export LOCAL_LIBS=libcdata libcerror libcnotify libcthreads libfcache
libfguid/Dockerfile: export LOCAL_LIBS=libcerror
libfvalue/Dockerfile: export LOCAL_LIBS=libcdata libcerror libcnotify libcthreads libfdatetime libfguid libfwnt libuna
libhmac/Dockerfile: export LOCAL_LIBS=libcerror libcfile libclocale libcnotify libcpath libcsplit libuna
libodraw/Dockerfile: export LOCAL_LIBS=libbfio libcdata libcerror libcfile libclocale libcnotify libcpath libcsplit libcthreads libhmac libuna
libsmdev/Dockerfile: export LOCAL_LIBS=libcdata libcerror libcfile libclocale libcnotify libcthreads libuna
libsmraw/Dockerfile: export LOCAL_LIBS=libbfio libcdata libcerror libcfile libclocale libcnotify libcpath libcsplit libcthreads libfcache libfdata libfvalue libhmac libuna
libuna/Dockerfile: export LOCAL_LIBS=libcdatetime libcerror libcfile libclocale libcnotify

all: $(SUBDIRS:%=%/Dockerfile)

$(SUBDIRS:%=%/):
	mkdir $@

$(SUBDIRS:%=%/hooks/push):
	mkdir -p $(dir $@)
	cp push $(dir $@)

%/Dockerfile: export LIB_NAME=$(@D)
%/Dockerfile: Dockerfile.template.sh %/ %/hooks/push
	./Dockerfile.template.sh |envsubst '$${LIB_NAME} $${BASEIMAGE} $${SRC_BASE} $${CONFIGURE_OPTIONS} $${LIB_VER}' > $@
