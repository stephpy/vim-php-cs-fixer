Vim-php-cs-fixer by steph_py
============================

Integrate [php-cs-fixer](https://github.com/fabpot/PHP-CS-Fixer) created by fabpot.

Options available:

```viml
let g:php_cs_fixer_path = ~/php-cs-fixer.phar "define the path to the php-cs-fixer.phar
let g:php_cs_fixer_level = "all"              " which level ?
let g:php_cs_fixer_finder = "Symfony21Finder" " Which finder ?
let g:php_cs_fixer_php_path = "php"           " Which php to use
let g:php_cs_fixer_default_mapping = 1        " Enable the mapping by default
```

Default mapping is `<leader>pcd`

**You have to launch this command at the root of your project**

If you want to change it:

```viml
map <leader>pcd :call PhpCsFixerFix(expand('%:p:h'))<CR>
```
