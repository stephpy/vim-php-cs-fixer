Vim-php-cs-fixer by steph_py
============================

Integrate [php-cs-fixer](https://github.com/fabpot/PHP-CS-Fixer) created by fabpot.

This plugin will execute the php-cs-fixer fix command on the directory where you launch the command.

Options available:

```viml
let g:php_cs_fixer_path = ~/php-cs-fixer.phar "define the path to the php-cs-fixer.phar
let g:php_cs_fixer_level = "all"              " which level ?
let g:php_cs_fixer_finder = "Symfony21Finder" " Which finder ?
let g:php_cs_fixer_php_path = "php"           " Which php to use
let g:php_cs_fixer_default_mapping = 1        " Enable the mapping by default
let g:php_cs_fixer_dry_run = 0                " Call command with dry-run option
```

Default mapping is `<leader>pcd`

If you want to change it:

```viml
map <leader>pcd :call PhpCsFixerFix(expand('%:p:h'))<CR>
```
