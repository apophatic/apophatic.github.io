# the cost of modern webdev

2023-10-17

I was un-installing unnecessary packages I had installed with `brew` and realized there were far too many to account for. Instead of going through each package in `brew list` and looking up the respective purpose, I decided to purge the entire formulae:

```bash
brew remove --force $(brew list --formula)
```

Re-installing the necessary packages, I was not surprised to infer the large memory cost of modern web development, i.e., Node.js-based development:

`brew install node` requires 58MB, not to mention its required dependencies which account for another 242MB. Furthermore, there is `node_modules` in a said application, and all the `"dependencies"` and `"devDependencies"`, and their dependencies, ad infinitum. Regardless of the latter ending up in a `.gitignore`, the memory requirements of modern web development is seemingly complex.

All the above is after experiencing installing `node` via `brew` on a no-longer-supported-operating-system by `brew` and having to wait for a long time for `node`'s `make` to complete.