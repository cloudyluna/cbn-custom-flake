NIX = nix
NIX_FORMATTER = nixfmt
SOURCES = $(shell find . -name "*.nix")
TARGET ?= .\#extras

.PHONY: all build format check url-hash git-hash

all: format build

build: $(SOURCES)
	$(NIX) build --refresh $(TARGET)

format: $(SOURCES)
	$(NIX_FORMATTER) $(SOURCES)

# NOTE: Make sure to git add the latest state of files to your current git tree 
# if you encounter weird missing files issue.
check: $(SOURCES)
	$(NIX) flake check

update:
	nvfetcher && $(NIX) build --refresh $(TARGET)

