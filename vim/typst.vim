let s:typst_watch_job = v:null
let s:zathura_job = v:null

function! s:JobRunning(job) abort
  return a:job isnot v:null && job_status(a:job) ==# 'run'
endfunction

function! s:StartTypstWatch() abort
  let l:watchfile = expand('%:r') . '.watch.' . expand('%:e')
  let l:pdf = expand('%:r') . '.watch.pdf'

  " seed the shadow file so typst has something to watch immediately
  silent! execute 'write! ' . l:watchfile

  if !s:JobRunning(s:typst_watch_job)
    let s:typst_watch_job = job_start(['typst', 'watch', l:watchfile, l:pdf],
          \ {'in_io': 'null', 'out_io': 'null', 'err_io': 'null'})
  endif

  if !s:JobRunning(s:zathura_job)
    let s:zathura_job = job_start(['zathura', l:pdf],
          \ {'in_io': 'null', 'out_io': 'null', 'err_io': 'null'})
  endif

  augroup TypstWatchGroup
    autocmd!
    autocmd TextChanged,TextChangedI <buffer> silent! execute 'write! ' . l:watchfile
    autocmd VimLeavePre * call s:StopTypstWatch()
  augroup END
endfunction

function! s:StopTypstWatch() abort
  if s:JobRunning(s:typst_watch_job)
    call job_stop(s:typst_watch_job)
  endif
  let s:typst_watch_job = v:null

  if s:JobRunning(s:zathura_job)
    call job_stop(s:zathura_job)
  endif
  let s:zathura_job = v:null
endfunction

command! TypstWatch call s:StartTypstWatch()
command! TypstWatchStop call s:StopTypstWatch()
