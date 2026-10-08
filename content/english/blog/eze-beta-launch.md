---
title: Beta Launch of eZe
meta_title: Beta Launch of eZe
description: Creating my own application and API to manage stocks
date: 2026-10-08T0:00:00Z
image: /images/thumbnails/eze_banner.png
categories:
  - EZE Finance
author: Johan
tags:
  - python
  - fastapi
draft: false
---
eZe is now in public beta. Right now it has only very basic functionality. You can create an account and call a few API endpoints, like getting a stock price, top performers and market status. It's built with FastAPI and htmx, with no build tools. You can try it at [eze.datatreehouse.org](https://eze.datatreehouse.org).

Here's how I got here.

## A tiny spreadsheet with big ideas

Yes, the title is corny.

Way back when EasyEquities launched in South Africa, I was excited. No more buying stocks in packs of 1, 10 or 100. I could take my R100 and buy a fraction of a share.

Then I wanted to get into the nitty-gritty of analysing my portfolio: the unit trust calculation, alpha and beta values, Matusalem's law, and so on. I found that Google Sheets has a built-in Google Finance [function](https://support.google.com/docs/answer/3093281?hl=en). Write `=GOOGLEFINANCE("JSE:SOL", "price")` in a cell and out comes the Sasol share price on the JSE. Literal magic. All the other tools out there cost a lot of money!

So I made a sheet. It grew and grew and grew, and then it hit a wall. Every calculation took effort, and I needed historical data to calculate alpha and beta values. A proper analysis ate whole afternoons.

I started that spreadsheet in varsity. Then I started working in software development and picked up version control, unit tests, APIs, Python, CI/CD, auth, database migrations and more. Then it hit me: I could build my own application and automate all of this. After a few years in software development, I had all the tools I needed to build the app of my dreams.

So I started developing eZe this year.

## The no-build stack

When I got the idea, I started thinking about what technology stack to use. After all, there were many to choose from. Someone has probably created another one by the time you got to this part of the post. I considered Next.js and Golang at some point. The speed of a compiled language with server-side and client-side rendering was appealing. I had just started learning Golang at the time, and it's a really cool language! But my day job was writing Python. That's where my expertise was.

Then I read some blog posts about people going back to basic "vanilla" applications. Just use HTML, CSS and JS. [HTML is a lot more powerful than we think](https://justfuckingusehtml.com/).

But JavaScript? It's a language I haven't explored much, and I think reactivity gets complex in some cases. [I don't like complexity](https://grugbrain.dev/#grug-on-complexity). That's probably why some people suggest [htmx](https://htmx.org/) to get a bit of reactivity into your app. Some people have migrated from React to htmx and claimed it worked wonders. [This Reddit post](https://www.reddit.com/r/htmx/comments/1qri2r7/switching_from_react_to_htmx_simplified_my/) speaks for itself.

I still needed a backend. I wanted to build my own auth and learn how it works. Auth is scary, and I wanted to get it right. Maybe the comfort of my daily language would be best. I also wanted to expose my application as an API, so other people can use my backend and calculations too. I'd understand if they thought my frontend was garbage.

That's when I stumbled onto this [No-Build Stack](https://blakecrosley.com/guides/fastapi-htmx) by Blake. The idea was stupidly simple:

> FastAPI + HTMX + Alpine.js + Jinja2 + plain CSS produces production web applications with zero build tools, zero `node_modules/`, and perfect Lighthouse scores

I liked that. One command to start my web application. A simple frontend. API integration and documentation out of the box. With FastAPI and SQLModel, I could define one Pydantic class that acts as both my ORM database definition, which plugs easily into Alembic for migrations, and the validation for my endpoints. That simplicity sold me.

## Just the beginning

Laying the foundations took a lot of work, and this is only the start. Now I can start working on the juicy things! How about managing your profile? MFA? Creating a portfolio? Email alerts? Graphs? Analytics! Oh, I'm so excited!

Give eZe a try.

{{< button label="Go to eZe" link="https://eze.datatreehouse.org" style="solid" >}}

Tell me what's missing or broken. Send me an email at johan@datatreehouse.org.