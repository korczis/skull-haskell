OUTPUT_DIR = bin

all: bin cabal

bin:
	mkdir -p $(OUTPUT_DIR)

build:
	cabal build
	
cabal: Setup.hs skull-haskell.cabal
	cabal configure
	cabal build

clean:
	cabal clean

.DEFAULT: all

.PHONY: all
