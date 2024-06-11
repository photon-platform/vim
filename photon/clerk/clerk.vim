" https://stackoverflow.com/questions/1533565/how-to-get-visually-selected-text-in-vimscript
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

function! ClerkChat(prompt = '')
    " Check if there is a visual selection
    let visual_selection = s:get_visual_selection()

    if !empty(visual_selection)
        " If there is a visual selection, use it as the buffer content
        let buffer_content = visual_selection
    else
        " If there is no visual selection, use the entire buffer content
        let buffer_content = join(getline(1, '$'), "\n")
    endif

    " Use a local variable for the prompt
    let l:prompt = a:prompt

    if empty(l:prompt)
        let l:prompt = input("Enter your prompt: ")
    endif

    if empty(l:prompt)
        echo "Prompt is empty. Aborting."
        return
    endif

    " Wrap the buffer content in triple backticks
    let wrapped_content = "```" . "\n" . buffer_content . "\n" . "```"
    " Combine the buffer content with the prompt
    let full_prompt = wrapped_content . "\n\n" . l:prompt
    " Call the clerk.py script with the combined prompt
    let command = "python3 ~/.vim/photon/clerk/clerk.py chat " . shellescape(full_prompt)
    let output = system(command)
    if v:shell_error
        echohl ErrorMsg | echo "Error: " . output | echohl None
    else
        " Split the window vertically and open a new buffer
        execute 'vsplit'
        " execute 'splitright'
        execute 'enew'
        " Set buffer options
        setlocal buftype=nofile
        setlocal bufhidden=hide
        setlocal noswapfile
        setlocal buflisted
        setlocal syntax=markdown
        " Write the output to the new buffer
        call setline(1, split(output, "\n"))
    endif
endfunction


function! ClerkCode(prompt = '')
    let system_prompt = "You are a code generator. You are to take the code wrapped in ``` below and regenerate the code as output, following the instructions which follow the code block. Do not include any commentary unless inserted as comments in the code. Do not wrap your output in triple backticks.\n\n"

    " Get the entire buffer content
    let buffer_content = join(getline(1, '$'), "\n")

    " Use a local variable for the prompt
    let l:prompt = a:prompt

    if empty(l:prompt)
        let l:prompt = input("Enter your prompt: ")
    endif

    if empty(l:prompt)
        echo "Prompt is empty. Aborting."
        return
    endif

    " Wrap the buffer content in triple backticks
    let wrapped_content = "```" . "\n" . buffer_content . "\n" . "```"
    " Combine the buffer content with the prompt
    let full_prompt = system_prompt . wrapped_content . "\n\n" . l:prompt
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
        setlocal syntax=python
        " Write the output to the new buffer
        call setline(1, split(output, "\n"))
        " Perform a diff between the original and the new buffer
        execute 'diffthis'
        execute 'wincmd p'
        execute 'diffthis'
    endif
endfunction

function! ClerkFim()
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
        " Split the window vertically and open a new buffer
        execute 'vsplit'
        execute 'enew'
        " Set buffer options
        setlocal buftype=nofile
        setlocal bufhidden=hide
        setlocal noswapfile
        setlocal buflisted
        setlocal syntax=python
        " Write the output to the new buffer
        call setline(1, split(output, "\n"))
        " Move the cursor back to the original buffer
        " wincmd p
    endif
endfunction

command! -nargs=? -range ClerkChat call ClerkChat(<f-args>)
command! ClerkFim call ClerkFim()

command! -nargs=? -range ClerkCode call ClerkCode(<f-args>)

