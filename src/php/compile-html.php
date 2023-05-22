<?php

require_once __DIR__ . '/../../vendor/autoload.php';

use Symfony\Component\Yaml\Parser;

use Twig\Loader\FilesystemLoader;
use Twig\Environment;
use Twig\TwigFilter;
use Twig\Extra\Html\HtmlExtension;



$sourceDir = __DIR__.'/../../';
echo "Compiling Twig into src/docs/html .. ".PHP_EOL;
if (!file_exists($sourceDir."/src/docs/html/")) {
    mkdir($sourceDir."/src/docs/html/");
}

$loader = new FilesystemLoader([
    $sourceDir."/src/docs/twig/"
]);
$twig = new Environment($loader);
$twig->addExtension(new HtmlExtension());
$html = $twig->render("test.html.twig");

file_put_contents($sourceDir."/src/docs/html/test.html",$html);
echo "Compiled Twig.".PHP_EOL;
