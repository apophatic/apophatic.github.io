# from latex to typst

2023-11-13

For as long as I remember, I've been using LaTeX, the typesetting system, for updating my résumé. My editor of choice was, not the web-based editor [Overleaf](https://www.overleaf.com/), but rather, the University of Oregon's [Richard Koch's](https://pages.uoregon.edu/koch/) [TeXShop](https://pages.uoregon.edu/koch/texshop/)–initially released in 2000. 

It was always fun and interesting looking up solutions on the [TeX Stack Exchange](https://tex.stackexchange.com/) for things I wanted to do but would quickly run into a wall trying to do. I mean, there is seemingly a high amount of material relating to TeX on the web that one is bound to find a solution to their problem quickly or eventually. And anyways, there is [CTAN](https://www.ctan.org/):

> The Comprehensive TEX Archive Network (CTAN) is the central place for all kinds of material around TEX. CTAN has currently 6511 packages. 2955 contributors have contributed to it. Most of the packages are free and can be downloaded and used immediately.

On the other hand, I came across [Typst](https://typst.app), a brand new typesetting system, a few months ago but it wasn't until a few nights that I played around with it. The Typst web-based editor and documentation were a breeze to work with. It might be that since I never had a web-based editor (e.g., Overleaf) workflow for working with LaTeX, I never realized the easy possibility of fledging out a fairly customized document quickly (i.e., without *building the document* as you do on TeXShop). 

But I think what I like most about Typst is its syntax. The below shows what creating a simple rule looks like, which one may easily decipher:

```typst
#show heading.where(
  level: 2
): it => {
  smallcaps(it)
}
```

LaTeX versus Typst almost feels like a battle between ancient and modern philosophers. Jokingly, shall we say: *The safest general characterization of the typesetting system tradition is that it consists of a series of footnotes to TeX?*  But for now, I'm going to be using Typst exclusively. Although, given how new it is, I wouldn't be surprised in significant shortcomings.