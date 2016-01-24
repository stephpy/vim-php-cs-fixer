"
" Fixtures/Integration/set
"
let s:suite  = themis#suite('php-cs-fixer')
let s:assert = themis#helper('assert')

function! s:PhpCsFixerBaseTest(fileName) abort "{{{
    call system('cp tests/fixtures/set/' . a:fileName . ' /tmp/')
    call PhpCsFixerFix('tests/fixtures/set/' . a:fileName, 0)
    call s:assert.equals(readfile('tests/fixtures/set/' . a:fileName), readfile('tests/results/set/' . a:fileName))
    call system('mv /tmp/' . a:fileName . ' tests/fixtures/set/')
endfunction "}}}

function! s:suite.PSR2() abort "{{{
    "TODO:error
    let g:php_cs_fixer_level = 'psr2'

    "call s:PhpCsFixerBaseTest('@PSR2.php')
endfunction "}}}

function! s:suite.Symfony() abort "{{{
    "TODO:No input
    let g:php_cs_fixer_level = 'symfony'

    "call s:PhpCsFixerBaseTest('@Symfony.php')
endfunction "}}}

