hello:
	@echo "Hello, World"

install:
	composer install
	npm install

compile-css:
	node_modules/node-sass/bin/node-sass \
		--output-style compressed \
		src/assets/sass/main.scss \
		src/assets/css/main.css

compile-html:
	php src/php/compile-html.php

compile:
	compile-css
	compile-html

packages:
	mkdir -p build/package1
	rm -r build/package1/assets
	mkdir build/package1/assets
	cp -r src/assets/css \
		src/assets/javascript \
		src/assets/images \
		build/package1/assets 

	mkdir -p build/package2
	rm -r build/package2/assets
	mkdir build/package2/assets
	cp -r src/assets/javascript \
		src/assets/images \
		src/assets/sass \
		build/package2/assets

	mkdir -p build/docs
	rm -r build/docs/html
	cp -r src/docs/html build/docs

release:
	cd build/package1
	#npx release bla
	cd build/package2
	#npx release bla
