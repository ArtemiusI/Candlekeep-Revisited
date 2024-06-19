---
navigation: 1
title: Home
permalink: /
nav_order: 1
---

## IElib
{: .no_toc}

* TOC
{: toc}

IElib is a companion library for [BGforge MLS](https://bgforge.net/mls/), a VScode extension providing support for [WeiDU](https://weidu.org/~thebigg/README-WeiDU.html) syntaxes, as well as Infinity Engine script and dialog file formats.

Essentially, it defines various constants: opcode numbers, icon numbers, etc, so that they could be used instead of magic numbers, improving overall code readability and simplifying development. (Similarly to what WeiDU does.) Most of the these are pulled from [IESDP](https://gibberlings3.github.io/iesdp/).

![]({{ site.baseurl }}/assets/example.png "Example")

It also provides some custom functions and macros that could be useful. The documentation on those is to the left.

IElib's primary purpose is to be used with MLS, but if you prefer, you can use it standalone as well.

## Usage
1. Init submodule
```bash
cd mymod
git submodule add -b master https://github.com/BGforgeNet/BGforge-MLS-IElib.git lib/bgforge
git commit -m "added BGforge IElib"
```
  (Note: once you've added a submodule to your repo, new clones will require an additional step: `git submodule update --init --recursive`.)
1. Enable
```
ALWAYS
  OUTER_SPRINT BGFORGE_LIB_DIR "%MOD_FOLDER%/lib/bgforge"
  INCLUDE ~%BGFORGE_LIB_DIR%/main.tpa~
END
```
  Browse the code to see the available constants, use BGforge MLS to get tips (completion and stuff).
1. Update
```bash
git submodule update --remote
git add lib/bgforge
git commit -m "updated BGforge IElib"
  ```

## Questions and issues
- Report bugs, suggest features, send pull requests to [Github](https://github.com/BGforgeNet/BGforge-MLS-IElib).
- Ask questions and discuss on the [forum](https://forums.bgforge.net/viewforum.php?f=35).
