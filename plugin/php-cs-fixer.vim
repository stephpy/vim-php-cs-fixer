if exists("g:vim_php_cs_fixer") || &cp
    finish
endif
let g:vim_php_cs_fixer = 1

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
call s:initVariable("g:php_cs_fixer_php_path", "php")
call s:initVariable("g:php_cs_fixer_default_mapping", 1)
call s:initVariable("g:php_cs_fixer_dry_run", 0)
call s:initVariable("g:php_cs_fixer_verbose", 0)

let g:php_cs_fixer_command = g:php_cs_fixer_php_path.' '.g:php_cs_fixer_path.' fix'

if exists('g:php_cs_fixer_config')
    let g:php_cs_fixer_command = g:php_cs_fixer_command.' --config='.g:php_cs_fixer_config
endif


fun! PhpCsFixerFix(path, dry_run)
    let command = g:php_cs_fixer_command.' '.a:path

    if a:dry_run == 1
        echohl Title | echo "[DRY RUN MODE]" | echohl None
        let command = command.' --dry-run'
    endif

    if exists('g:php_cs_fixer_fixers_list')
        let command = command.' --fixers='.g:php_cs_fixer_fixers_list
    endif

    let s:output = system(command)
    if v:shell_error
        echohl Error | echo s:output | echohl None
    else
        let s:nbLines = len(split(s:output, '\n'))
        let s:nbFilesModified = (s:nbLines - 1)

        if g:php_cs_fixer_verbose == 1
            echohl Title | echo s:output | echohl None
        else
            if s:nbFilesModified > 0
                echohl Title | echo "There is ".s:nbFilesModified." file(s) modified(s)" | echohl None
            else
                echohl Title | echo "There is no cs to fix" | echohl None
            endif
        endif

        " if there is no cs to fix, we have not to ask for remove dry run
        if a:dry_run == 1 && s:nbFilesModified > 0
            let l:confirmed = confirm("Do you want to launch command without dry-run option ?", "&Yes\n&No", 2)
            if l:confirmed == 1
                call PhpCsFixerFix(a:path, 0)
            endif
        endif
    endif
endfun

fun! PhpCsFixerFixDirectory()
    call PhpCsFixerFix(expand('%:p:h'), g:php_cs_fixer_dry_run)
endfun

fun! PhpCsFixerFixFile()
    call PhpCsFixerFix(expand('%:p'), g:php_cs_fixer_dry_run)
endfun

if(g:php_cs_fixer_default_mapping == 1)
    nnoremap <silent><leader>pcd :call PhpCsFixerFixDirectory()<CR>
    nnoremap <silent><leader>pcf :call PhpCsFixerFixFile()<CR>
endif
