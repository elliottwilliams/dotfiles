" adhere to 160 columns instead of 80
set tw=0
set colorcolumn=161
set winwidth=167
set bri
set briopt=shift:2

" bind key to jump to placeholder
"imap <buffer> <C-j> <Plug>(deoplete_swift_jump_to_placeholder)
imap <buffer> <C-j> <Plug>(autocomplete_swift_jump_to_placeholder)
