# pyenv-ccache

Make Python build faster, with using the leverage of `ccache`.

## Installation

### Installing as a pyenv plugin

Make sure you have pyenv 0.2.0 or later, then run:

    git clone https://github.com/pyenv/pyenv-ccache.git $(pyenv root)/plugins/pyenv-ccache


### Installing with Homebrew (for OS X users)

Mac OS X users can install pyenv-ccache with the
[Homebrew](http://brew.sh) package manager.

*This is the recommended method of installation if you installed pyenv
 with Homebrew.*

```
$ brew install pyenv-ccache
```

Or, if you would like to install the latest development release:

```
$ brew install --HEAD pyenv-ccache
```

## Usage

1. Install `ccache` into your system.
2. Install any version of CPython with using `pyenv install`.

## How It Works

pyenv-ccache hooks every invocation of `pyenv install` commands, then injecting `ccache` into `cc`.

## History

**0.0.2** (Apr 21, 2014)

* Setup ccache for CXX.
* fix install script (#1)

**0.0.1** (Apr 13, 2014)

* Initial public release.

## License

(The MIT License)

Copyright (c) 2014 Yamashita, Yuu <<yamashita@geishatokyo.com>>

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINpipENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
