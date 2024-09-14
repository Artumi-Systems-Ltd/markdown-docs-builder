# Makefile to preprocess .md files, convert .dot files to .png, and .md files to .odt and .pdf
# Any change in .dot files triggers all .md files to be recompiled to .odt and .pdf

# Command to convert .dot files to .png
DOT := dot
DOT_FLAGS := -Tpng

# Command to convert .md files to .odt and .pdf
PANDOC := pandoc

# Temporary preprocessed markdown file
TEMP_MD := temp.md

# Pattern rule to convert .dot files to .png
%.png: %.dot
	$(DOT) $(DOT_FLAGS) $< -o $@

# Preprocess .md files to strip text between markers before converting to .odt
%.odt: %.md $(wildcard *.dot)
	# Strip out text between <!-- START --> and <!-- END --> markers
	sed '/<!-- START -->/,/<!-- END -->/d' $< > $(TEMP_MD)
	# Convert preprocessed file to .odt
	$(PANDOC) $(TEMP_MD) -o $@

# Preprocess .md files to strip text between markers before converting to .pdf
%.pdf: %.md $(wildcard *.dot)
	# Strip out text between <!-- START --> and <!-- END --> markers
	sed '/<!-- START -->/,/<!-- END -->/d' $< > $(TEMP_MD)
	# Convert preprocessed file to .pdf
	$(PANDOC) $(TEMP_MD) -o $@

# Target to process all .dot, .md files to .png, .odt, and .pdf
all: $(patsubst %.dot,%.png,$(wildcard *.dot)) \
     $(patsubst %.md,%.odt,$(wildcard *.md)) \
     $(patsubst %.md,%.pdf,$(wildcard *.md))

# Clean up the generated png, odt, pdf, and temporary files
clean:
	rm -f *.png *.odt *.pdf $(TEMP_MD)

