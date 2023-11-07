# the cost of modern webdev

2023-10-17

I was un-installing unnecessary packages I had installed with `brew` and realized there were far too many to account for. Instead of going through each package in `brew list` and looking up the respective purpose, I decided to purge the entire formulae:

```bash
brew remove --force $(brew list --formula)
```

Re-installing the necessary packages, I was not surprised to infer the large memory cost of modern web development, re: Node.js-based development:

`brew install node` requires 58MB, not to mention its required dependencies which account for another ~242MB. Then there is `node_modules` in an application, and all the `"dependencies"` and `"devDependencies"`, and their dependecies, ad infinitum. Regardless of the latter ending up in a `.gitignore`, the memory requirements and complexity of modern web development is seemingly unnecessary.

