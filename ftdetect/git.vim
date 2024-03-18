au BufRead,BufNewFile *patch* if match(getline(1), "^diff --git.*$") >= 0 | set filetype=gitdiff | endif
