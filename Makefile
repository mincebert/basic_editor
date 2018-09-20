DEST:=.build
RELEASES:=./releases

##########################################################################
##########################################################################

TASS:=64tass --m65xx --nostart -Wall -Wno-implied-reg
BOOTVOL:=../../beeb/beeb-files/stuff/65boot/0
BEVOL:=../../beeb/beeb-files/stuff/basic_editor/0

.PHONY:build
build: VER?=$(shell date '+%Y-%m-%d %H:%M:%S')
build:
	mkdir -p $(DEST)
	$(TASS) -D BUILD_TYPE=0 -D "VER=\"_\"" basiced.s65 -L$(DEST)/basiced_.lst -o$(DEST)/basiced_.rom
	$(TASS) -D BUILD_TYPE=4 -D "VER=\"xxxx\"" basiced.s65 -L$(DEST)/basiced_type4.lst -o$(DEST)/basiced_type4.rom
	$(TASS) -D BUILD_TYPE=0 -D "VER=\"$(VER)\"" basiced.s65 -L$(DEST)/basiced.lst -o$(DEST)/basiced.rom
	$(TASS) -D BUILD_TYPE=1 -D "VER=\"$(VER)\"" basiced.s65 -L$(DEST)/hibasiced.lst -o$(DEST)/hibasiced.rom

	@python tools/checksize.py $(DEST)/basiced_.rom $(DEST)/basiced.rom $(DEST)/hibasiced.rom
#	python checksize.py $(DEST)/rbasiced_b800.rom

	@test -d $(BOOTVOL) && cp -v $(DEST)/basiced.rom $(BOOTVOL)/R.BETOM && touch $(BOOTVOL)/R.BETOM.inf && cp -v $(DEST)/hibasiced.rom $(BOOTVOL)/RHBETOM && touch $(BOOTVOL)/RHBETOM.inf
	@test -d $(BEVOL) && cp -v $(DEST)/basiced.rom $(BEVOL)/R.BETOM && touch $(BEVOL)/R.BETOM.inf && cp -v $(DEST)/hibasiced.rom $(BEVOL)/R.HBETOM && touch $(BEVOL)/R.HBETOM.inf && cp -v $(DEST)/basiced_type4.rom $(BEVOL)/R.BE4TOM && touch $(BEVOL)/R.BE4TOM.inf

	@sha1sum $(DEST)/basiced_.rom
	@sha1sum $(DEST)/basiced.rom
	@test -f lkg/basiced.rom && sha1sum lkg/basiced.rom || true
	@sha1sum $(DEST)/hibasiced.rom 
	@test -f lkg/hibasiced.rom && sha1sum lkg/hibasiced.rom || true
#
#	python tools/make_reloc.py --not-emacs $(DEST)/rbasiced_8000.rom $(DEST)/rbasiced_b800.rom

##########################################################################
##########################################################################

.PHONY:release
release:
	test -n "$(VER)" # VER variable must be set.
	rm -Rvf $(RELEASES)/$(VER)
	mkdir -p $(RELEASES)/$(VER)
	$(MAKE) build
	cp $(DEST)/basiced.rom $(RELEASES)/$(VER)/
	cp $(DEST)/hibasiced.rom $(RELEASES)/$(VER)/

##########################################################################
##########################################################################
