" Taken from NerdTree
function! s:initVariable(var, value)
    if !exists(a:var)
        exec 'let ' . a:var . ' = ' . "'" . substitute(a:value, "'", "''", "g") . "'"
        return 1
    endif
    return 0
endfunction

call s:initVariable("g:php_cs_fixer_path", "~/php-cs-fixer.phar")
call s:initVariable("g:php_cs_fixer_level", "all")
call s:initVariable("g:php_cs_fixer_config", "default")
call s:initVariable("g:php_cs_fixer_php_path", "php")
call s:initVariable("g:php_cs_fixer_fixers_list", "")
call s:initVariable("g:php_cs_fixer_default_mapping", 1)
call s:initVariable("g:php_cs_fixer_dry_run", 0)

let g:php_cs_fixer_command = g:php_cs_fixer_php_path.' '.g:php_cs_fixer_path.' fix --config='.g:php_cs_fixer_config

fun! PhpCsFixerFix(path)
    let command = g:php_cs_fixer_command.' '.a:path

    if(g:php_cs_fixer_dry_run == 1)
        let command = command.' --dry-run'
    endif

    if(strlen(g:php_cs_fixer_fixers_list))
        let command = command.' --fixers='.g:php_cs_fixer_fixers_list
    endif

    let output = system(command)
    if v:shell_error
        echohl Error | echo output | echohl None
    else
        " todo, count how many files have been updated
        echohl Title | echo output | echohl None
    endif
endfun

fun! PhpCsFixerFixDirectory()
    call PhpCsFixerFix(expand('%:p:h'))
endfun

fun! PhpCsFixerFixFile()
    call PhpCsFixerFix(expand('%:p'))
endfun

if(g:php_cs_fixer_default_mapping == 1)
    map <leader>pcd :call PhpCsFixerFixDirectory()<CR>
    map <leader>pcf :call PhpCsFixerFixFile()<CR>
endif
