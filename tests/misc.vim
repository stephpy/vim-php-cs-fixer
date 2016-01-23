"
" Fixtures/Integration/misc
"
let s:suite  = themis#suite('php-cs-fixer')
let s:assert = themis#helper('assert')

function! s:PhpCsFixerBaseTest(fileName) abort "{{{
    call system('cp tests/fixtures/misc/' . a:fileName . ' /tmp/')
    call PhpCsFixerFix('tests/fixtures/misc/' . a:fileName, 0)
    call s:assert.equals(readfile('tests/fixtures/misc/' . a:fileName), readfile('tests/results/misc/' . a:fileName))
    call system('mv /tmp/' . a:fileName . ' tests/fixtures/misc/')
endfunction "}}}

function! s:suite.Imports() abort "{{{
    let g:php_cs_fixer_level       = 'none'
    let g:php_cs_fixer_fixers_list = 'multiple_use,remove_leading_slash_use,remove_lines_between_uses,ordered_use'

    call s:PhpCsFixerBaseTest('imports.php')
endfunction "}}}

function! s:suite.PhpClosingTag_ShortTag() abort "{{{
    let g:php_cs_fixer_level       = 'none'
    let g:php_cs_fixer_fixers_list = 'php_closing_tag,short_tag'

    call s:PhpCsFixerBaseTest('php_closing_tag,short_tag.php')
endfunction "}}}

