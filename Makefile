PDF_BUILDER = pdflatex
BUILD_DIR = build
BUILDER_OPTIONS = -output-directory $(BUILD_DIR)

DROPBOX = `which dropbox`

all: dropbox_stop pdf clean dropbox_start

resync: clean dropbox_start

dropbox_stop:
	$(DROPBOX) stop

pdf: document.tex
	$(PDF_BUILDER) $(BUILDER_OPTIONS) document.tex
	$(PDF_BUILDER) $(BUILDER_OPTIONS) document.tex
	$(PDF_BUILDER) $(BUILDER_OPTIONS) document.tex

clean:
	-rm -f $(BUILD_DIR)/*.aux
	-rm -f $(BUILD_DIR)/*.glo
	-rm -f $(BUILD_DIR)/*.idx
	-rm -f $(BUILD_DIR)/*.log
	-rm -f $(BUILD_DIR)/*.nav
	-rm -f $(BUILD_DIR)/*.snm
	-rm -f $(BUILD_DIR)/*.toc
	-rm -f $(BUILD_DIR)/*.out
	-rm -f *~

dropbox_start:
	$(DROPBOX) start
