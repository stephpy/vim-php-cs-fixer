" Taken from NerdTree
function! s:initVariable(var, value)
    if !exists(a:var)
        exec 'let ' . a:var . ' = ' . "'" . substitute(a:value, "'", "''", "g") . "'"
        return 1
    endif
    return 0
endfunction

call s:initVariable("g:php_cs_fixer_default_mapping", 1)
call s:initVariable("g:php_cs_fixer_php_path", "php")
call s:initVariable("g:php_cs_fixer_finder", "SymfonyFinder")
call s:initVariable("g:php_cs_fixer_level", "all")
call s:initVariable("g:php_cs_fixer_path", "~/php-cs-fixer.phar")
call s:initVariable("g:php_cs_fixer_dry_run", 1)

let g:php_cs_fixer_command = g:php_cs_fixer_php_path.' '.g:php_cs_fixer_path.' fix --level='.g:php_cs_fixer_level

fun! PhpCsFixerFix(path)
    let command = g:php_cs_fixer_command.' '.a:path.' '.g:php_cs_fixer_finder
    if(g:php_cs_fixer_dry_run == 1)
        let command = command.' --dry-run'
    endif
    exe ':! echo '.command.' && '.command
endfun

if(g:php_cs_fixer_default_mapping == 1)
    map <leader>pcd :call PhpCsFixerFix(expand('%:p:h'))<CR>
endif
