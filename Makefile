export BASEREPO ?= libyal
export BASETAG ?= builder-debian-sid-1.2.0
export SRC_BASE ?= /usr/local/src
export CONFIGURE_OPTIONS ?= --prefix=/usr
export DOLLAR := $$

SUBDIRS := libcerror libclocale libbfio libcaes libcdata libcdatetime
SUBDIRS += libcfile libcnotify libcpath libcsplit libcthreads libfcache
SUBDIRS += libfdata libfguid libfvalue libhmac libodraw libsmdev libsmraw
SUBDIRS += libuna libfwnt

all: $(SUBDIRS:%=%/Dockerfile)

$(SUBDIRS:%=%/):
	mkdir $@

$(SUBDIRS:%=%/hooks/post_push): post_push
	mkdir -p $(dir $@)
	cp post_push $(dir $@)

$(SUBDIRS:%=%/hooks/push): push
	mkdir -p $(dir $@)
	cp push $(dir $@)

#LN_LIBS uses checkout + ln
#LOCAL_LIBS uses docker COPY
libcerror/Dockerfile:    export LN_LIBS=
libcaes/Dockerfile:      export LN_LIBS=libcerror
libcdatetime/Dockerfile: export LN_LIBS=libcerror
libclocale/Dockerfile:   export LN_LIBS=libcerror
libcnotify/Dockerfile:   export LN_LIBS=libcerror
libcsplit/Dockerfile:    export LN_LIBS=libcerror
libcthreads/Dockerfile:  export LN_LIBS=libcerror
libfguid/Dockerfile:     export LN_LIBS=libcerror
libcdata/Dockerfile:     export LN_LIBS=libcerror libcthreads
libuna/Dockerfile:       export LN_LIBS=libcdatetime libcerror libclocale libcnotify:master libcfile
libcfile/Dockerfile:     export LN_LIBS=libcerror libclocale libcnotify libuna
libcpath/Dockerfile:     export LN_LIBS=libcerror libclocale libcsplit libuna
libbfio/Dockerfile:      export LN_LIBS=libcdata libcerror libcfile libclocale libcnotify libcpath libcsplit libcthreads libuna
libfcache/Dockerfile:    export LN_LIBS=libcdata libcerror libcthreads
libfdata/Dockerfile:     export LN_LIBS=libcdata libcerror libcnotify libcthreads libfcache
libfwnt/Dockerfile:      export LN_LIBS=libcdata libcerror libcnotify libcthreads
libfvalue/Dockerfile:    export LN_LIBS=libcdata libcerror libcnotify libcthreads libfdatetime libfguid libfwnt libuna
libhmac/Dockerfile:      export LN_LIBS=libcerror libcfile libclocale libcnotify libcpath libcsplit libuna
libodraw/Dockerfile:     export LN_LIBS=libbfio libcdata libcerror libcfile libclocale libcnotify libcpath libcsplit libcthreads libhmac libuna
libsmdev/Dockerfile:     export LN_LIBS=libcdata libcerror libcfile libclocale libcnotify libcthreads libuna
libsmraw/Dockerfile:     export LN_LIBS=libbfio libcdata libcerror libcfile libclocale libcnotify libcpath libcsplit libcthreads libfcache libfdata libfvalue libhmac libuna
libewf/Dockerfile:       export LN_LIBS=libbfio libcaes libcdata libcdatetime libcerror libcfile libclocale libcnotify libcpath libcsplit libcthreads libfcache libfdata libfguid libfvalue libhmac libodraw libsmdev libsmraw libuna

update_versions:
	(for x in ${SUBDIRS}; \
	do \
		echo -n "export $${x}="; \
		git ls-remote --tags https://github.com/libyal/$${x}.git |\
		sort -g -k3 -t/ | tail -n 1 | awk -F/ '{print $$3}'; \
	done ) > versions

include versions
export libcdatetime := 2485bb579b #20171209

autotag:
	for x in ${SUBDIRS}; \
	do \
		git tag -f $${x}-$${!x}; \
	done


%/Dockerfile: export LIB_NAME=$(@D)
%/Dockerfile: Dockerfile.template.sh %/ Makefile versions
	./Dockerfile.template.sh |envsubst '$${BASEREPO} $${BASETAG} $${LIB_NAME} $${SRC_BASE} $${CONFIGURE_OPTIONS} $${DOLLAR}' > $@

.PHONY: all update_versions autotag
