# multipackage

This repo attempts to create multiple, versioned packages of some content and attach it to the repo.
It uses `make` for the workflow to combine both `composer` and `npm`.

That requires 
- make
- npm
- composer

## make commands

- make install\
  calls composer install, npm install, etc

- make compile 
  - make compile-css\
    using node, compiles sass to css in `src/assets/css`

  - make compile-html\
    using php, compiles twig to html in `src/docs/html`

- make build \
  copies files to various `/build/(build)`
  creates tar files of each build

<<<<<<< Updated upstream
- make release tag=$tag\
  calls `npm version $tag && npm publish` to github for each package \
  and `hub release edit -a *tgz` for each zipped package.
=======
- make release [version=$version]\
  calls `npm version $version && npm publish` to github for each build \
  and `hub release edit -a *tgz` for each zipped build.
>>>>>>> Stashed changes
  this target is called by a github action, see below

- make clean \
  remove generated files in `/build/(build)`, `src/assets/css` and `src/docs/html`

## packaging

Packaging is set up following

https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-npm-registry#publishing-multiple-packages-to-the-same-repository

## releasing

Releasing is done using a Github action, on `Release`.
<<<<<<< Updated upstream
Use the  Github UI to create a new release. Make sure
to use a valid semantic version as a tag name (for NPM).
=======
Use a release tag that is also a valid NPM version tag,
like `v3.2.1`.
>>>>>>> Stashed changes

A new release creates **npm packages** and **github release assets**
for every build in the build dir.

If you want to call the `make release` target from the command 
line, you can; it would require a  github token with packages 
privileges to be set in  `.npmrc` in this repo; see `.npmrc-dist` 
for an example; and the `hub` command installed. Also a release with
version (version) would already have to exist on github.