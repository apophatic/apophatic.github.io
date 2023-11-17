# accessible images: :after

2023-10-23

**Note:** This is an alternate form of the unnecessarily-unstyled-in a-critical-manner broken image logo and, if added, alternate text we typically see for offline images. This doesn't affect Safari-like browsers.

Styling the `img` element to account for offline images–e.g., if (1) the image path is not found, (2) the image has been deleted, (3) the connection has been broken and the image did not load, (4) the webmaster is forbidding the image to load, and so on–is a great accessibility practice.

Like we thought for [accessible externally-pointing hyperlinks](/accessible-hyperlinks-after), our thinking is similar here: what we are interested in is the *after-the-matter*, i.e., `:after`.

But a pre-requisite for the following is to subscribe to the seemingly most pressing accessibility issue on the web: using the `img` element's `alt` property.

> The `HTMLImageElement` property `alt` provides fallback (alternate) text to display when the image specified by the `<img>` element is not loaded.
>
> ...
>
> Perhaps the most important reason to use the `alt` property is to support accessibility, as the `alt` text may be used by screen readers and other assistive technologies to help differently-abled users make full use of your content. It will be read aloud or sent to the touch device, for example, to support visually impaired users.

Now, the first on this log, something handy for our situation, a CSS function.

> The `attr()` CSS function is used to retrieve the value of an attribute of the selected element and use it in the stylesheet. It can also be used on pseudo-elements, in which case the value of the attribute on the pseudo-element's originating element is returned.

You may now suddenly infer what we are doing. If a visitor to our website can't retrieve a particular image, we throw out the particular `alt` text for the respective image to indicate what the image was. This is incredibly useful.

And so, the meat of our task is done:

```css
img:after {
    content: attr(alt);
}
```

But what we are doing further, and this is the critical part of our situation, is styling this in a critically-conscious manner compared to the default (see the note above).

```css
img {
    max-width: 100%;
    min-height: 4em;
    border: 2px dotted #ba55d3;

    /* :after styling necessities */
    display: block;
    position: relative;
}

img:after {
    font-size: 90%;

    /* spit out the alt text */
    content: attr(alt);

    /* vertically center the alt text */
    display: grid;
    align-content: center;

    /* horizontally center the alt text */
    text-align: center;

    /* overlap default alt text */
    position: absolute;
    z-index: 2;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;

    /* make lack of image distinctive */
    background-color: #410000;
}
```

The result for an image not found locally of the Milky Way Galaxy:

![Milky Way Galaxy](../public/images/milky-way-galaxy.jpg "Milky Way Galaxy")

This is a lot better than the default.