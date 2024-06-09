function ClerkChat(prompt) range
    " Check if there is a visual selection
    echo a:firstline
    echo a:lastline
    if a:firstline != a:lastline
        " Get the content of the current selection
        let buffer_content = join(getline(a:firstline, a:lastline), "\n")
    else
        " Get the content of the current buffer
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

command! -nargs=1 ClerkChat call ClerkChat(<q-args>)
command! ClerkFim call ClerkFim()

