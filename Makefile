OUTPUT_DIR = bin

all: bin cabal

bin:
	mkdir -p $(OUTPUT_DIR)

cabal: Setup.hs skull-haskell.cabal
	cabal configure
	cabal build

.DEFAULT: all

.PHONY: all
