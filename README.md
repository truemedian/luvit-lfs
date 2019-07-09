
# Luvit - LuaFileSystem

## Install

Install luvit-lfs by running the following command in
your project's directory

```shell
lit install truemedian/lfs
```

## Requirements

A full luvit install, this project relies on the `fs`,
`jit` and `bit` libraries (all of which are bundled with
the luvit binary)

## Limitations

Given this project integrates no C / C++ code, file
locking and unlocking would be much harder to achieve and
has been left out for that reason.
Along with the `setmode` function which requires
accessing C / C++ functions. (and ffi is not portable)

### Functions not implemented

- `lfs.setmode`
- `lfs.lock`
- `lfs.lock_dir`
- `lfs.unlock`

## Tests

Provided with this code is a simple tests `suite` that
runs with the `luvit/tap` library.
Pull Requests to add more specific and vigorous tests
are much appreciated.
