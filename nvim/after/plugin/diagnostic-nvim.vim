" Options: {{{

    " Enable/Disable virtual text:
    let g:diagnostic_enable_virtual_text = 1

    " Change virtual text prefix
    let g:diagnostic_virtual_text_prefix = ''

    " Trim those looooooong virtual texts
    let g:diagnostic_trimmed_virtual_text = '20'

    " Spaced out texts:
    let g:space_before_virtual_text = 5       " default = 1

    " Show Me A Sign: {{{

        " Signs on/off:
        let g:diagnostic_show_sign = 0            " default = 1
        
        " Nvim's Sign Priority:
        let g:diagnostic_sign_priority = 20       " default = 20

        " Custom Signs: {{{
            call sign_define("LspDiagnosticsErrorSign", {"text" : "E", "texthl" : "LspDiagnosticsError"})
            call sign_define("LspDiagnosticsWarningSign", {"text" : "W", "texthl" : "LspDiagnosticsWarning"})
            call sign_define("LspDiagnosticsInformationSign", {"text" : "I", "texthl" : "LspDiagnosticsInformation"})
            call sign_define("LspDiagnosticsHintSign", {"text" : "H", "texthl" : "LspDiagnosticsHint"})
        " }}}
        
        " Enable/Disable Underline
        let g:diagnostic_enable_underline = 0     " default = 1 (on)
        
        " Enable/Disable auto popup window
        " When you jump to next or previous diagnostic, line diagnostic message 
        " will popup in a popup window, you can disable it by
        let g:diagnostic_auto_popup_while_jump = 0
        " Enable/Disable insert delay
        let g:diagnostic_insert_delay = 1
" }}}
