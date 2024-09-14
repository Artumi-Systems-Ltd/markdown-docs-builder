# Makefile to preprocess .md files, convert .dot files to .png, and .md files to .odt and .pdf
# Any change in .dot files triggers all .md files to be recompiled to .odt and .pdf

# Command to convert .dot files to .png
DOT := dot
DOT_FLAGS := -Tpng

# Command to convert .md files to .odt and .pdf
PANDOC := pandoc

# Pattern rule to convert .dot files to .png
%.png: %.dot
	$(DOT) $(DOT_FLAGS) $< -o $@

# Preprocess .md and pipe directly into Pandoc to create .odt
%.odt: %.md $(wildcard *.dot)
	# Strip out text between <!-- START --> and <!-- END --> and pipe to Pandoc
	sed '/<!-- START -->/,/<!-- END -->/d' $< | $(PANDOC) -f markdown -o $@

# Preprocess .md and pipe directly into Pandoc to create .pdf
%.pdf: %.md $(wildcard *.dot)
	# Strip out text between <!-- START --> and <!-- END --> and pipe to Pandoc
	sed '/<!-- START -->/,/<!-- END -->/d' $< | $(PANDOC) -f markdown -o $@

# Target to process all .dot, .md files to .png, .odt, and .pdf
all: $(patsubst %.dot,%.png,$(wildcard *.dot)) \
     $(patsubst %.md,%.odt,$(wildcard *.md)) \
     $(patsubst %.md,%.pdf,$(wildcard *.md))

# Clean up the generated png, odt, and pdf files
clean:
	rm -f *.png *.odt *.pdf
