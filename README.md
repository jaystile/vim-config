# vim-config
My personal settings for vim 8+

1. `cp vimrc ~/.vim/vimrc`
1. `vim tmp.txt` should download all the plugins
1. `:PlugUpdate` to verify

## Go Development
1. [vim-for-go-developement](https://pmihaylov.com/vim-for-go-development/)
   ```
	 vim -c 'CocInstall -sync coc-go coc-html coc-css coc-json|q'
	 ```

## Rust Development
1. [coc-rust-analyzer](https://github.com/fannheyward/coc-rust-analyzer)
	```
	:CocInstall coc-rust-analyzer
	```

### Rust Debugging
1. Add the configuration to the vimrc
	```
	" Termdebug - for debugging rust
	let termdebugger="rust-gdb"
	" Open the debugger split vertically instead of horizontally
	let g:termdebug_wide=1
	```
1. `packadd termdebug` inside of vim.
1. `RustTest!` will build the binary and run all the tests. Capture the `target/debug...` path.
	```
	Finished test [unoptimized + debuginfo] target(s) in 0.03s
	Running unittests (target/debug/deps/longestsubstring-f2e27d97e79033d4)
	```
1. `Termdebug target/debug/deps/longestsubstring-f2e27d97e79033d4` to start gdb
  1. `break 13` to set a breakpoint
	1. `run --test test_01` to run a specific test which helps prevent thread switching. You can also try `set scheduler-locking step` which will allow you to `step` and `next`, but as soon as you `continue` all threads continue.
	1. `next` as needed
	1. `info locals`
	1. `quit`

