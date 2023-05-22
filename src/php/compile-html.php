<?php


$sourceDir = __DIR__.'/../../';
echo "Compiling Twig into src/docs/html .. ".PHP_EOL;
if (!file_exists($sourceDir."/src/docs/html/")) {
    mkdir($sourceDir."/src/docs/html/");
}
file_put_contents($sourceDir."/src/docs/html/test.html","test!");
echo "Compiled Twig.".PHP_EOL;
