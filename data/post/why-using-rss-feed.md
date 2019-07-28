---
pre-title: Post
title: Why using RSS feed
url: /post/why-using-rss-feed
date: 2019/07/28
description: I've been using RSS feed over a month now. This brought me some benefits that I want to tell you about.
thumbnail-url: /img/post/why-using-rss-feed/thumbnail.png
---

I've been using RSS feed over a month now. This brought me some benefits that I want to tell you about.

But first, You may not be familiar with RSS, so let me give you a short explanation.

## What is this?

RSS (Really Simple Syndication) is a way to share site updates on a standardized way.

The way it work is very simple.

You have the RSS files, and the RSS clients.

### RSS files

If you want to have one, you first create an RSS file with certain format ([reference](https://validator.w3.org/feed/docs/rss2.html)) with the site information you want to share. That file is going to be updated when some information of the site changes. The most common example is to give an update when a new article gets added.

You have to host that file on some domain, like [`https:nperrin.io/feed/index.xml`](/feed/index.xml), and make sure to update it.

### RSS clients

The RSS clients fetch the RSS files that you added (by their url), every X time. The client checks if they were any updates, if they were, you'll get an indication of that, maybe an article was added, then you could consume that content there.

## What's so cool about this

### All in one place

You don't have to go to different platforms that track your behaviour and show you ads. You have all in one place.

### Implementation

As a content creator, if you want to notify your subscribers of a site update, you just have to update this file that you host. It's very simple to implement.

### Source awareness

Maybe this is something that only happens to me.

Reading through twitter I might encounter a random url of a news, I'll read it and go away without knowing if the source was trustable.

Having a list of news sites to get information lets me get a better knowledge if the site is trustable or not, as I follow that site through oher news too.

Although you have browser extensions as [News Guard](https://www.newsguardtech.com/), I think it's better to create a small amount of trusted news sites.

### You're in control

As a content creator, you choose what to notify of your site updates. You won't get shutdown, de-rank or censored. As long as you're the owner of your RSS file...

### Spam

When some site asks for your e-mail, my guess is that the site won't use that only to send you updates.

They can sell their e-mail list to another company (as people subscribed to that site have similar interests and can be targeted for a product).

The site can also received money for publishing ads. If you have subscribers thought RSS feed, you don't know the amount of potential spam receivers you have (I think).

So for users that want to be spam free, this are good news.

## What's not so cool

### Discoverability

When you have a fixed list of channels, it's difficult to discover new ones, as you only consume the content, you don't get recommendations.

The bubble problem is within recommendations too. But I think you have a better chance of discover new and diverse type of content.

A posible solution would be to proacticaly search for new types of content when you get interested on something ([DuckDuckGo](https://duckduckgo.com)...), and check if that site you're checking has recommendations.

## Conclusion

There is a lot I don't know. I just uploaded my [rss feed](/feed/index.xml) yesterday, so feel free to correct me if you saw something wrong.

Finally I'll let some links if you got interested.

- [My RSS feed](/feed/index.xml).
- [E-mail and RSS feed client](https://www.thunderbird.net/en-US/thunderbird/all/).
- [RSS reference](https://validator.w3.org/feed/docs/rss2.html).
- [Some RSS utils](https://github.com/NormanPerrin/utils/tree/master/rss).
- [RSS wiki entry](https://en.wikipedia.org/wiki/RSS).

