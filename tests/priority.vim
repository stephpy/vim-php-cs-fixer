"
" Fixtures/Integration/priority
"
let s:suite  = themis#suite('php-cs-fixer')
let s:assert = themis#helper('assert')

function! s:PhpCsFixerBaseTest(fileName) abort "{{{
    call system('cp tests/fixtures/priority/' . a:fileName . ' /tmp/')
    call PhpCsFixerFix('tests/fixtures/priority/' . a:fileName, 0)
    call s:assert.equals(readfile('tests/fixtures/priority/' . a:fileName), readfile('tests/results/priority/' . a:fileName))
    call system('mv /tmp/' . a:fileName . ' tests/fixtures/priority/')
endfunction "}}}

function! s:suite.AlignDoubleArrow_OperatorsSpaces() abort "{{{
    let g:php_cs_fixer_level       = 'none'
    let g:php_cs_fixer_fixers_list = 'align_double_arrow,operators_spaces'

    call s:PhpCsFixerBaseTest('align_double_arrow,operators_spaces.php')
endfunction "}}}

function! s:suite.AlignEquals_OperatorsSpaces() abort "{{{
    let g:php_cs_fixer_level       = 'none'
    let g:php_cs_fixer_fixers_list = 'align_equals,operators_spaces'

    call s:PhpCsFixerBaseTest('align_equals,operators_spaces.php')
endfunction "}}}

function! s:suite.ClassDefinition_TrailingSpaces() abort "{{{
    "TODO:error
    let g:php_cs_fixer_level       = 'none'
    let g:php_cs_fixer_fixers_list = 'class_definition,trailing_spaces'

    "call s:PhpCsFixerBaseTest('class_definition,trailing_spaces.php')
endfunction "}}}

function! s:suite.DoubleArrowMultilineWhitespaces_AlignDoubleArrow() abort "{{{
    let g:php_cs_fixer_level       = 'none'
    let g:php_cs_fixer_fixers_list = 'double_arrow_multiline_whitespaces,align_double_arrow'

    call s:PhpCsFixerBaseTest('double_arrow_multiline_whitespaces,align_double_arrow.php')
endfunction "}}}

function! s:suite.DuplicateSemicolon_ExtraEmptyLines() abort "{{{
    "TODO:error
    let g:php_cs_fixer_level       = 'none'
    let g:php_cs_fixer_fixers_list = 'duplicate_semicolon,extra_empty_lines'

    "call s:PhpCsFixerBaseTest('duplicate_semicolon,extra_empty_lines.php')
endfunction "}}}

function! s:suite.DuplicateSemicolon_SwitchCaseSemicolonToColon() abort "{{{
    "TODO:error
    let g:php_cs_fixer_level       = 'none'
    let g:php_cs_fixer_fixers_list = 'duplicate_semicolon,switch_case_semicolon_to_colon'

    "call s:PhpCsFixerBaseTest('duplicate_semicolon,switch_case_semicolon_to_colon.php')
endfunction "}}}

function! s:suite.EchoToPrint_ShortEchoTag() abort "{{{
    let g:php_cs_fixer_level       = 'none'
    let g:php_cs_fixer_fixers_list = 'echo_to_print,short_echo_tag'

    call s:PhpCsFixerBaseTest('echo_to_print,short_echo_tag.php')
endfunction "}}}

function! s:suite.MultipleUse_UnusedUse() abort "{{{
    let g:php_cs_fixer_level       = 'none'
    let g:php_cs_fixer_fixers_list = 'multiple_use,unused_use'

    call s:PhpCsFixerBaseTest('multiple_use,unused_use.php')
endfunction "}}}

function! s:suite.PhpdocNoEmptyReturn_PhpdocOrder() abort "{{{
    let g:php_cs_fixer_level       = 'none'
    let g:php_cs_fixer_fixers_list = 'phpdoc_no_empty_return,phpdoc_order'

    call s:PhpCsFixerBaseTest('phpdoc_no_empty_return,phpdoc_order.php')
endfunction "}}}

function! s:suite.PhpdocNoEmptyReturn_PhpdocSeparation() abort "{{{
    let g:php_cs_fixer_level       = 'none'
    let g:php_cs_fixer_fixers_list = 'phpdoc_no_empty_return,phpdoc_separation'

    call s:PhpCsFixerBaseTest('phpdoc_no_empty_return,phpdoc_separation.php')
endfunction "}}}

function! s:suite.PhpdocNoPackage_PhpdocSeparation() abort "{{{
    let g:php_cs_fixer_level       = 'none'
    let g:php_cs_fixer_fixers_list = 'phpdoc_no_package,phpdoc_separation'

    call s:PhpCsFixerBaseTest('phpdoc_no_package,phpdoc_separation.php')
endfunction "}}}

function! s:suite.RemoveLeadingSlashUse_OrderedUse() abort "{{{
    let g:php_cs_fixer_level       = 'none'
    let g:php_cs_fixer_fixers_list = 'remove_leading_slash_use,ordered_use'

    call s:PhpCsFixerBaseTest('remove_leading_slash_use,ordered_use.php')
endfunction "}}}

function! s:suite.ShortBoolCast_SpacesCast() abort "{{{
    let g:php_cs_fixer_level       = 'none'
    let g:php_cs_fixer_fixers_list = 'short_bool_cast,spaces_cast'

    call s:PhpCsFixerBaseTest('short_bool_cast,spaces_cast.php')
endfunction "}}}

function! s:suite.TrailingSpaces_UnneededControlParentheses() abort "{{{
    let g:php_cs_fixer_level       = 'none'
    let g:php_cs_fixer_fixers_list = 'trailing_spaces,unneeded_control_parentheses'

    call s:PhpCsFixerBaseTest('trailing_spaces,unneeded_control_parentheses.php')
endfunction "}}}

function! s:suite.UnusedUse_ExtraEmptyLines() abort "{{{
    let g:php_cs_fixer_level       = 'none'
    let g:php_cs_fixer_fixers_list = 'unused_use,extra_empty_lines'

    call s:PhpCsFixerBaseTest('unused_use,extra_empty_lines.php')
endfunction "}}}

function! s:suite.UnusedUse_LineAfterNamespace() abort "{{{
    let g:php_cs_fixer_level       = 'none'
    let g:php_cs_fixer_fixers_list = 'unused_use,line_after_namespace'

    call s:PhpCsFixerBaseTest('unused_use,line_after_namespace.php')
endfunction "}}}
