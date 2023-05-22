# multipackage

This repo attempts to create multiple, versioned packages of some content and attach it to the repo.
It uses `make` for the workflow to combine both `composer` and `npm`.

- make install\
  call composer install, npm install, etc

- make compile 
  - make compile-css\
    compiles sass to css in `assets/css`

  - make compile-html\
    compiles twig to html in `docs/html`

- make packages \
  copies files to `/build/(package)`

- make release $version\
  calls `npx release` to github for each package
