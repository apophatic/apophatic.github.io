# accessible hyperlinks: :active

October 21, 2023

To do accessibility on the web justice, it isn't enough having hyperlinks solely differentiated by the default link color, the default `text-decoration: underline`, and the default, when hovering, `cursor: pointer`. I have been indifferent and susceptible to not doing this for a long time but over the years, I've noticed this on a fair share of websites and I thought it was accessibly neat.

What I'm talking about is this behavior you typically see with form inputs: an outline when you focus-in on the input field. We may just as well fully adopt it for anchor elements.

What we'll need is the `:active` pseudo-class:

> The `:active` CSS pseudo-class represents an element (such as a button) that is being activated by the user. When using a mouse, "activation" typically starts when the user presses down the primary mouse button.

And the `outline` CSS property:

> Outline is a line outside of the element's border. Unlike other areas of the box, outlines don't take up space, so they don't affect the layout of the document in any way.

Therefore, the standard for hyperlinks around the web should have something like this (as used on this site):

```css
a:active {
    outline: 1px dotted #853d97;
}
```