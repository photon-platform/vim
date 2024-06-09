function! s:get_visual_selection()
    " Why is this not a built-in Vim script function?!
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "\n")
endfunction

function! ClerkChat(prompt)
    " Get the content of the visual selection or the entire buffer if no selection is made
    let buffer_content = s:get_visual_selection()
    if empty(buffer_content)
        " Get the content of the entire buffer
        let buffer_content = join(getline(1, '$'), "\n")
    endif

    " Wrap the buffer content in triple backticks
    let wrapped_content = "```" . "\n" . buffer_content . "\n" . "```"
    " Combine the buffer content with the prompt
    let full_prompt = a:prompt . "\n\n" . wrapped_content
    " Call the clerk.py script with the combined prompt
    let command = "python3 ~/.vim/photon/clerk/clerk.py chat " . shellescape(full_prompt)
    let output = system(command)
    if v:shell_error
        echohl ErrorMsg | echo "Error: " . output | echohl None
    else
        " Split the window vertically and open a new buffer
        execute 'vsplit'
        execute 'enew'
        " Set buffer options
        setlocal buftype=nofile
        setlocal bufhidden=hide
        setlocal noswapfile
        setlocal buflisted
        setlocal syntax=markdown
        " Write the output to the new buffer
        call setline(1, split(output, "\n"))
        " Move the cursor back to the original buffer
        " wincmd p
    endif
endfunction

function! ClerkFim()
    let lnum = search('# FIM:', 'bn')
    if lnum == 0
        echo "No FIM comment found"
        return
    endif
    let prompt = join(getline(1, lnum), "\n")
    let suffix = join(getline(lnum + 1, '$'), "\n")
    let command = "python3 ~/.vim/photon/clerk/clerk.py fim " . shellescape(prompt) . " " . shellescape(suffix)
    let output = system(command)
    if v:shell_error
        echohl ErrorMsg | echo "Error: " . output | echohl None
    else
        let middle = split(output, "\n")
        call append(lnum, middle)
        execute lnum . 'delete _'
    endif
endfunction

command! -nargs=1 -range ClerkChat call ClerkChat(<f-args>)
command! ClerkFim call ClerkFim()

