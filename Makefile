type ?= patch
SEMANTIC_VERSION = $(type)

install:
	composer install
	npm install

compile-css:
	@echo
	node_modules/node-sass/bin/node-sass \
		--output-style compressed \
		src/assets/sass/main.scss \
		src/assets/css/main.css

compile-html:
	@echo
	php src/php/compile-html.php

compile: compile-css compile-html

clean-assets:

	@echo
	@echo Cleaning assets ..

	rm -rf src/assets/css/*
	echo "The CSS will be generated here." >> src/assets/css/README.md

	rm -rf src/docs/html/*
	echo "The HTML will be generated here." >> src/docs/html/README.md

clean-build:

	@echo
	@echo Cleaning build dir ..

	mkdir -p build/pds-compiled
	rm -rf build/pds-compiled/assets

	mkdir -p build/pds-source
	rm -rf build/pds-source/assets

	mkdir -p build/pds-docs
	rm -rf build/pds-docs/html

clean: clean-assets clean-build

packages:

	@if [ ! -f "src/assets/css/main.css" ] ; then echo "Compile css first" ; false ; fi
	@if [ ! -f "src/docs/html/test.html" ] ; then echo "Compile html first" ; false ; fi

	make clean-build

	@echo
	@echo Building pds-compiled ..
	mkdir build/pds-compiled/assets
	cp -r src/assets/css \
		src/assets/javascript \
		src/assets/images \
		build/pds-compiled/assets 
	rm -f build/pds-compiled/assets/css/README.md

	@echo
	@echo Building pds-source ..
	mkdir build/pds-source/assets
	cp -r src/assets/javascript \
		src/assets/images \
		src/assets/sass \
		build/pds-source/assets

	@echo
	@echo Building pds-docs ..
	cp -r src/docs/html build/pds-docs
	rm -f build/pds-docs/html/README.md

release:

	@if [ ! -d "build/pds-compiled/assets" ] ; then echo "build/pds-compiled not ready" ; false ; fi
	@if [ ! -d "build/pds-source/assets" ] ; then echo "build/pds-source not ready" ; false ; fi
	@if [ ! -d "build/pds-docs/html" ] ; then echo "build/pds-docs not ready" ; false ; fi

	@echo
	@echo Releasing pds-compiled ..
	cd build/pds-compiled && npm version $(SEMANTIC_VERSION)
	npm publish ./build/pds-compiled

	@echo
	@echo Releasing pds-source ..
	cd build/pds-source && npm version $(SEMANTIC_VERSION)
	npm publish ./build/pds-source

	@echo
	@echo Releasing pds-docs ..
	cd build/pds-docs && npm version $(SEMANTIC_VERSION)
	npm publish ./build/pds-docs
