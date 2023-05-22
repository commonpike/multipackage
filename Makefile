hello:
	@echo "Hello, World"

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

packages:
	mkdir -p build/compiled
	rm -r build/compiled/assets
	mkdir build/compiled/assets
	cp -r src/assets/css \
		src/assets/javascript \
		src/assets/images \
		build/compiled/assets 

	mkdir -p build/source
	rm -r build/source/assets
	mkdir build/source/assets
	cp -r src/assets/javascript \
		src/assets/images \
		src/assets/sass \
		build/source/assets

	mkdir -p build/docs
	rm -r build/docs/html
	cp -r src/docs/html build/docs

release:
	cd build/compile
	#npx release bla
	cd build/source
	#npx release bla
	cd build/docs
	#npx release bla
