# val town email rss notifications

2023-11-07

I've tried different RSS clients over the years, e.g., two of my favorite clients are the web-client [BazQux](https://bazqux.com/) and the self-hostable [Miniflux](https://miniflux.app/). While extremely useful, it never stuck in my workflow. It might be that my preference towards a minimal setup irked me away from using yet another application and service. What I haven't tried doing is using email for RSS notifications–of course, it's self-explanatory, i.e., see newsletters.

I've playing with [Val Town](https://www.val.town/) these past few days and it seems like a fun, handy tool:
> Val Town is a social website to write, run, and deploy code. Vals are small JavaScript/TypeScript snippets that run on our servers. You can create APIs, scheduled functions, email yourself, and persist small pieces of data — all from the browser.

First and foremost, inferring that my particular feeds are different from others, I create my first ever val, rssFeeds. An `Object` type containing keyed collections:

```javascript
export const rssFeeds = {
  	Evonomics: "https://evonomics.com/feed/"
};
```

Now, the fun begins. After reading through some vals, there are a couple that I need. 

Luckily, Val Town has it's own [standard library](https://www.val.town/u/std) with helpful vals like [std.email](https://www.val.town/v/std/email):

> @std.email is the web-standard and more powerful replacement for console.email.

As you notice the email val references other vals like the val for parsing a SendGrid email. 

Another val I need is newRSSItems. Again, you see this val reference another val to fetch the RSS which references other vals to parse the XML and fetch the text, which the latter references the standard library's fetch val and another normalize the URL val. This is pretty cool! "[A] network of atomic actions you can stack like Lego blocks."

To tie things up, you guessed it, I use some code from yet another val, pollRSSFeeds:

```javascript
import { email } from "https://esm.town/v/std/email?v=11";
import { newRSSItems } from "https://esm.town/v/stevekrouse/newRSSItems";
import { rssFeeds } from "https://esm.town/v/johndoe/rssFeeds";

export async function pollRSSFeeds({ lastRunAt }: Interval) {
  return Promise.all(
    Object.entries(rssFeeds).map(async ([name, url]) => {
      let items = await newRSSItems({
        url,
        lastRunAt,
      });
      if (items.length)
        await email({
          text: JSON.stringify(items, null, 2),
          subject: `New from ${name} RSS`,
        });
      return { name, items };
    }),
  );
}
```