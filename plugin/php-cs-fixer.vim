if (!exists("g:php_cs_fixer_path"))
    let g:php_cs_fixer_path = "~/php-cs-fixer.phar"
endif

if (!exists("g:php_cs_fixer_level"))
    let g:php_cs_fixer_level = "all"
endif

if (!exists("g:php_cs_fixer_finder"))
    let g:php_cs_fixer_finder = "SymfonyFinder"
endif

if (!exists("g:php_cs_fixer_php_path"))
    let g:php_cs_fixer_php_path = "php"
endif

if !exists("g:php_cs_fixer_default_mapping")
    let g:php_cs_fixer_default_mapping = 1
endif

let g:php_cs_fixer_command = g:php_cs_fixer_php_path." ".g:php_cs_fixer_path." fix --level=".g:php_cs_fixer_level

fun! PhpCsFixerFix(path)
    exe ":! "g:php_cs_fixer_command" "a:path" "g:php_cs_fixer_finder
endfun

if(g:php_cs_fixer_default_mapping == 1)
    map <leader>pcd :call PhpCsFixerFix(expand('%:p:h'))<CR>
endif
