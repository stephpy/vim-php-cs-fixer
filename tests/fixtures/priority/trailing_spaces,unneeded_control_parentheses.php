<?php
return (
    0 === strpos($method->name, 'get') &&
    3 < strlen($method->name) &&
    0 === $method->getNumberOfRequiredParameters()
);
