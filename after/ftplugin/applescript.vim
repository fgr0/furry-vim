if executable('osascript')
    call SingleCompile#SetCompilerTemplate('applescript','osascript', 'AppleScript Interpreter', 'osascript', '-e $(FILE_TITLE)$')
    call SingleCompile#ChooseCompiler('applescript', 'osascript')
endif
