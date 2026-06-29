---
title: Wish List of Black Women Writers
layout: page
permalink: /wishlist/
---

<style>
  .wishlist-page {
    --wl-ink: #1f1f1f;
    --wl-gold: #b89530;
    --wl-gold-soft: #c9a961;
    --wl-teal: #7d9da0;
    color: var(--wl-ink);
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", sans-serif;
  }

  /* Both headings — centered */
  .wishlist-page h2 {
    text-align: center;
    font-size: 2rem;
    font-weight: 500;
    margin-top: 3rem;
    margin-bottom: 0;
    color: var(--wl-ink);
  }

  /* Long gold bar above Aspirational heading */
  .wishlist-page h2:last-of-type::before {
    content: "";
    display: block;
    width: 100%;
    height: 3px;
    background: var(--wl-gold-soft);
    margin-bottom: 3rem;
  }

  /* Blurb paragraph with short black rules above and below */
  .wishlist-blurb {
    max-width: 720px;
    margin: 0 auto;
    line-height: 1.6;
  }
  .wishlist-blurb::before,
  .wishlist-blurb::after {
    content: "";
    display: block;
    width: 60px;
    height: 1px;
    background: var(--wl-ink);
    margin: 1rem auto;
  }

  /* Current Research: teal cards in a grid */
  .current-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
    gap: 1.5rem;
    list-style: none;
    padding: 0;
    margin: 2rem 0;
  }
  .current-grid li {
    background: var(--wl-teal);
    padding: 2.5rem 1.5rem 1.75rem;
    text-align: center;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    min-height: 380px;
  }
  .current-grid img {
    max-width: 75%;
    max-height: 260px;
    height: auto;
    margin: 0 auto;
    display: block;
  }
  .current-grid a {
    margin-top: 1.5rem;
    color: var(--wl-ink);
    text-decoration: underline;
    text-underline-offset: 3px;
    font-size: 1.05rem;
  }
  .current-grid a:hover {
    color: var(--wl-gold);
  }

  /* Aspirational: two-column bulleted list */
  .aspirational-list {
    column-count: 2;
    column-gap: 3rem;
    padding-left: 1.5rem;
    list-style: disc;
    margin: 2rem 0;
    line-height: 1.7;
  }
  .aspirational-list li {
    break-inside: avoid;
    padding: 0.15rem 0;
  }
  .aspirational-list a {
    color: var(--wl-gold);
    text-decoration: underline;
    text-underline-offset: 2px;
  }
  .aspirational-list a:hover {
    color: var(--wl-ink);
  }

  /* Page intro and legend text */
  .wishlist-intro,
  .wishlist-legend {
    max-width: 720px;
    margin: 1rem auto;
    line-height: 1.6;
  }

  @media (max-width: 720px) {
    .aspirational-list { column-count: 1; }
  }
</style>

<div class="wishlist-page" markdown="1">

<p class="wishlist-intro">This Wish List of Black Women Writers responds to the exclusion of Black women from the Woman’s Department of the 1884 New Orleans World’s Fair. It is a work in progress, intended as a place where visitors to the exhibit can continue to add the names of Black women writer whom we wish had been part of the New Orleans Woman’s Department. whose works should have been part of the 1884 library of women’s literature.
<br>
<br>
Although these women were originally omitted from “this beautiful sisterhood of books,” their presence on this Wish List rightfully places their writing among the representative works of the era, and invites further exploration and ongoing recovery.
<br>
<br>
The following names provide a beginning for our Wish List. These women published influential literary works across a variety of disciplines, genres and subjects, before or shortly after the fair. We included writers of children’s literature, journalism, memoir, autobiography, fiction, and religious writings. We did this to reflect the variety of genres present in the fair’s Women’s Department and Colored Department so that our readers could imagine how these Black women writers would have exhibited with them.
<br>
<br>
Please note that we have chosen not to limit our Wish List to writers already published before 1884. This is because we want to include writers whose careers might have benefitted from the inspiration of seeing other Black Women writers recognized at the New Orleans World’s Fair.
<br>
<br>
As examined in “Recovery is Not Innocent,” this work is hindered by what has been excluded from the historical record and archival collections. But, while we may never completely document the Black women writers of the era, we hope that continuing to expand this list will help point toward all the other, lost or not-yet-recovered works by Black women authors.
<br>
<br>
The Beautiful Sisterhood project publishes crowd-sourced research from scholars and students. Through this process, researchers and students have produced works about the following authors, who appear on the Beautiful Sisterhood wishlist. As researchers and students make contributions from our Aspirational Research list, those authors are moved to our Current Research list.</p>

## Current Research Developed from the Wishlist

{% assign current = site.data.wishlist.authors | where: "status", "current" %}
<ul class="current-grid">
{% for author in current %}
  <li>
    {% if author.image != "" %}
    <img src="{{ '/objects/' | append: author.image | relative_url }}"
         alt="{{ author.name }}"
         onerror="this.style.display='none'">
    {% endif %}
    <a href="{{ author.profile_url }}">{{ author.name }}</a>
  </li>
{% endfor %}
</ul>

## Aspirational Research Wish List

<p class="wishlist-blurb">We still need your contributions! In the form, add authors and works for inclusion, or propose your research projects about the authors and works already listed in our <em>Current Research</em> and <em>Aspirational Research</em> lists.</p>

{% assign aspirational = site.data.wishlist.authors | where: "status", "aspirational" %}
<ul class="aspirational-list">
{% for author in aspirational %}
  <li>{% if author.highlight == "true" %}<span style="color: var(--wl-gold);">{{ author.name }}</span>{% else %}{{ author.name }}{% endif %}</li>
{% endfor %}
</ul>

<p class="wishlist-legend">The names that appear in gold are currently being researched. The names in black are available for researchers. test tracking
</p>

</div>