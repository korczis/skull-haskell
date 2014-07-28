OUTPUT_DIR = bin

all: bin deps cabal

bin:
	mkdir -p $(OUTPUT_DIR)

build: deps
	cabal build
	
cabal: configure build

configure: Setup.hs skull-haskell.cabal
	cabal configure

clean:
	# cabal clean

deps: skull-haskell.cabal
	cabal install --only-dependencies

.DEFAULT: all

.PHONY: all
