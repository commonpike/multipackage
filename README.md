# multipackage

This repo attempts to create multiple, versioned packages of some content and attach it to the repo.
It uses `make` for the workflow to combine both `composer` and `npm`.

That requires 
- make
- npm
- composer
- npx

## make commands

- make install\
  calls composer install, npm install, etc

- make compile 
  - make compile-css\
    using node, compiles sass to css in `src/assets/css`

  - make compile-html\
    using php, compiles twig to html in `src/docs/html`

- make packages \
  copies files to various `/build/(package)`

- make release [version=$version]\
  calls `npm version $version && npm publish` to github for each package \
  this is typically done automatically by a github action

- make clean \
  remove generated files in `/build/(package)`, `src/assets/css` and `src/docs/html`

## packaging

Packaging is set up following

https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-npm-registry#publishing-multiple-packages-to-the-same-repository

## releasing

Releasing is done using a Github action, on `Release`.
However, if you want to release from the command line,
you can, using `make release`; it would require a 
github token with packages privileges to be set in 
`.npmrc` in this repo; see `.npmrc-dist` for an example.