# Site Editing Guide

*Referenced from [CONTRIBUTING.md](../CONTRIBUTING.md) as the step-by-step companion to that document. This
guide traces every path a contribution can take — a new page, a style change, a new row of data — and where it
lands once the site rebuilds.*

This site catalogs Black women writers excluded from the Woman's Department of the 1884 New Orleans World's
Fair. It's built on **CollectionBuilder-GH**, an open-source Jekyll template that turns a spreadsheet of
metadata into a full digital-collection website, with a project-specific layer of author essays and a wishlist
added on top.

## Contents

1. [What this project actually is](#1-what-this-project-actually-is)
2. [How the pieces fit together](#2-how-the-pieces-fit-together)
3. [Creating & editing pages](#3-creating--editing-pages)
4. [CSS & styling](#4-css--styling)
5. [Adding & placing data](#5-adding--placing-data)
6. [Build, deploy, and the Decap CMS pilot](#6-build-deploy-and-the-decap-cms-pilot)
7. [Conventions & standards](#7-conventions--standards)
8. [Known gaps worth flagging to new contributors](#8-known-gaps-worth-flagging-to-new-contributors)
9. [Quick reference — "I want to…"](#9-quick-reference--i-want-to)

---

## 1. What this project actually is

Two things are stacked on top of each other in this repository, and telling them apart is the single most
useful thing to understand before editing anything:

- **The CollectionBuilder-GH machinery** — generic, reusable Jekyll code (layouts, includes, JavaScript
  visualizations) that reads a CSV of item metadata and generates Browse, Map, Timeline, Search, Data-table, and
  Item-detail pages automatically. None of this is specific to this project; it's the same code every
  CollectionBuilder-GH site starts from.
- **The "This Beautiful Sisterhood" layer** — everything specific to this project: the author profile essays in
  `_authors/`, the Wish List page, the custom green/gold styling in `_sass/_custom.scss`, and the metadata in
  `_data/bsbtest.csv` itself.

When something looks stripped-down or generic (`pages/browse.md` is five lines long, for instance), that's the
CollectionBuilder layer — the real content is generated at build time from data, not written by hand. When
something has inline `<style>` blocks or hand-built HTML, that's usually a custom addition for this project.

> **Where the deeper docs live:** `docs/cb-docs.md` just points to the external
> [CollectionBuilder documentation site](https://collectionbuilder.github.io/cb-docs/) — that's the
> authoritative reference for template features not specific to this project. This guide focuses on how *this
> repository* is actually configured and customized.

---

## 2. How the pieces fit together

The build has no server and no database. Every page is generated once, at build time, from three kinds of
source material:

```
_config.yml         # site title, which CSV is "the" catalog, collections
_data/               # CSV + YAML — the content that drives everything
  bsbtest.csv           # the catalog: one row per collection item
  wishlist.csv           # the wishlist: one row per author
  theme.yml               # colors, fonts, per-page toggles
  config-*.csv             # which fields each visualization shows
_authors/            # a Jekyll "collection" — one .md essay per author
pages/               # thin front-matter shells for each template page
_layouts/            # the HTML skeleton each page type is wrapped in
_includes/           # reusable HTML/Liquid partials (nav, features, JS loaders)
_sass/ + assets/css/cb.scss  # styling pipeline
objects/             # the actual images/PDFs/audio files
admin/               # Decap CMS config — a pilot, wishlist-only (see §6)
```

### The core mental model: one row, six pages

Add or edit one row in `_data/bsbtest.csv` and, on the next build, **all of the following update
automatically**:

- **Browse page** — filters and thumbnails
- **Data table** — the sortable/searchable grid
- **Search index** — Lunr.js full-text search
- **Item page** (`/item.html?id=...`) — the item's detail view
- **Map** — only if `latitude`/`longitude` are set
- **Timeline** — only if `date` is set

Nobody edits the Browse page or the Map page directly — the JavaScript loaders in `_includes/js/` (DataTables,
Leaflet, TimelineJS, Lunr) render them in the browser from `assets/data/metadata.json`, a JSON export of the CSV
generated automatically at build time. **Find the data, not the page.**

---

## 3. Creating & editing pages

There are three distinct ways a "page" gets made here, and they call for different amounts of editing.

### 3a. Template pages — thin shells over generated content

`pages/browse.md`, `map.md`, `timeline.md`, `data.md`, `search.md`, `subjects.md`, `locations.md`, and `item.md`
are all like this. Each is mostly YAML front matter setting a `layout` and `permalink`, with a sentence or two
of intro text. The real content — the sortable table, the map markers, the filter buttons — is generated by the
layout and its includes at build/render time.

```yaml
---
title: Browse
layout: browse
permalink: /browse.html
# see _data/config-browse.csv for display options
---

## Browse Items
```

Editing one of these files safely means changing the intro prose above/below the front matter, not removing the
front matter itself or the layout it points to. To change what a template page *displays*, edit the matching
config CSV (see [§5a](#5a-display-config-files--what-shows-where)), not the page file.

### 3b. The About page — a real content page

`pages/about.md` is the one template page meant to hold real prose. It uses the `about` layout, which centers
text in a readable column, and can pull in drop-in components from `_includes/feature/` (see
[§5b](#5b-drop-in-content-blocks-for-page-bodies)) like jumbotrons and nav-menus. **Note:** it currently ships
with the template's placeholder copy about CollectionBuilder itself and an HTML comment flagging it for
replacement — this is a good first edit for a new contributor to make.

### 3c. Author profile essays

Author essays are a Jekyll *collection* (configured in `_config.yml` as `authors`, output to
`/authors/:slug/`). Each essay is its own Markdown file in `_authors/`.

**To add a new author profile:**

1. Add a portrait image to `objects/` (e.g. `hopkins_pauline.jpg`).
2. Create `_authors/hopkins_pauline.md` with front matter matching the existing example
   (`_authors/ida_b_wells-barnett.md`):

```yaml
---
title: "Pauline Hopkins"
slug: "hopkins_pauline"
contributor: "Your Name"
portrait: "hopkins_pauline.jpg"
life_dates: "1859–1930"
portrait_caption: "Pauline Hopkins, ca. 1901."
summary: "One or two sentences summarizing her significance."
layout: author
permalink: /authors/hopkins_pauline/
---

## Section One: A Brief Biography
Essay text goes here, in Markdown...
```

The `author` layout (`_layouts/author.html`) renders the portrait + title + byline header, then the essay body,
then a "Literary Works" section and a link back to the wishlist. Two Markdown/Liquid conventions used inside
these essays:

| Pattern | What it does |
|---|---|
| `> quote text` followed by `{: .pull-quote}` | Kramdown's inline attribute list (IAL) — attaches the `.pull-quote` CSS class (styled in `_sass/_custom.scss`) to the blockquote directly above it, producing the bordered, italicized pull-quote treatment. |
| `<img class="body-image">` | Inline images within the essay body use the `.body-image` / `.body-image-caption` classes for consistent captioned figures — see [§4](#4-css--styling). |

> **Convention from CONTRIBUTING.md:** the `contributor` field in the front matter is **not optional** —
> whoever writes the essay gets bylined for it. This is treated as a scholarly-attribution requirement, not a
> formality.

### 3d. Fully custom pages

`pages/wishlist.md` shows the third pattern: a page can carry its own `<style>` block and hand-built HTML/Liquid,
sidestepping the shared Sass system entirely. It defines its own CSS custom properties scoped to a
`.wishlist-page` wrapper class, then loops over `site.data.wishlist` to build two lists:

```liquid
{% assign current = site.data.wishlist | where: "status", "current" %}
<ul class="current-grid">
{% for author in current %}
  <li>...<a href="{{ author.profile_url }}">{{ author.name }}</a></li>
{% endfor %}
</ul>
```

This pattern (page-scoped `<style>` + wrapper class + CSS custom properties) is reasonable for a one-off page
design, but the trade-off is real: those styles aren't reusable elsewhere and won't respond to the site-wide
theme settings in `theme.yml`. Reach for it only when a page's design is genuinely unique to that page; for
anything reused across pages, put it in `_sass/_custom.scss` instead (see [§4](#4-css--styling)).

### 3e. Adding a page to the navigation menu

The top nav bar is generated entirely from `_data/config-nav.csv` — no template editing required.

| Column | Purpose |
|---|---|
| `display_name` | Text shown in the nav bar. |
| `stub` | The URL/permalink it links to. |
| `dropdown_parent` | Leave blank for a top-level link; set to another row's `display_name` to nest it in that dropdown instead. |

Add a row, and the link appears after the next build — `_includes/collection-nav.html` reads this file directly.

---

## 4. CSS & styling

The visual base is **Bootstrap 5** — utility classes like `btn-success`, `bg-dark`, `col-md-6` work directly in
any page's Markdown/HTML. On top of that, Sass is assembled at build time from several layers:

```
assets/css/cb.scss   # entry point — a Liquid-templated Sass file
  1. reads font/color variables from _data/theme.yml
  2. builds Bootstrap's $theme-colors map from _data/config-theme-colors.csv
  3. @imports, in order:
     _sass/_theme-colors.scss     # generated color variables
     _sass/_theme-utilities.scss  # bg-opacity helpers etc.
     _sass/_base.scss             # template-wide: nav, footer, skip-link
     _sass/_pages.scss            # template-wide: per-visualization CSS
     _sass/_custom.scss           # ← THIS PROJECT'S styles live here
```

Three different places to make a styling change, in order of how big the change is:

- **Small — colors & fonts sitewide.** Edit `_data/theme.yml` (base font, text/link color, navbar colors,
  Bootswatch theme swap) or `_data/config-theme-colors.csv` (redefine Bootstrap's primary/secondary/success/etc.
  colors). No Sass knowledge needed.
- **Medium — project-specific components.** Add rules to `_sass/_custom.scss` — the explicitly designated
  "put your overrides here" file. This is where `.author-profile`, `.pull-quote`, and `.body-image` already
  live.
- **Large — one unique page.** Use a scoped `<style>` block inside the page's own Markdown file, as
  `pages/wishlist.md` does. Wrap it in a unique class so it can't leak into other pages.

Nothing needs manual compiling — `_config.yml` sets `sass.style: compressed`, and GitHub Pages/Jekyll
recompiles automatically on every push.

> **Editing `_sass/_base.scss` or `_pages.scss`:** these two files are shared by *every* CollectionBuilder-GH
> page (nav bar, footer, map, timeline, subject clouds, item galleries). A change here affects the whole site,
> not just this project's custom pages — edit with more caution than `_custom.scss`.

---

## 5. Adding & placing data

This is the heart of the project. Nearly everything a contributor does day-to-day is adding or editing a row in
one of two CSV files.

### The main catalog — `_data/bsbtest.csv`

Configured as the site's metadata source via `metadata: bsbtest` in `_config.yml` (the filename, minus `.csv`).
Each row is one collection item. To add an item:

1. Drop the media file into `objects/`.
2. Add a row to `bsbtest.csv` with a unique `objectid` and a `filename` matching the file you just added.
3. Fill in as many of the fields below as you can — more fields means the item shows up correctly on more of
   the generated pages.

**Core fields** (condensed from `docs/metadata-info.csv`):

| Field | Required? | Notes |
|---|---|---|
| `objectid` | Yes | Unique, no spaces/special characters. Used in URLs — never change once set. |
| `filename` | Yes | Must match a file in `objects/`, with extension. |
| `title` | Yes | Primary name of the object. |
| `creator` | Suggested | "Last, First"; semicolon-separate multiple creators. |
| `date` | Suggested | ISO 8601 — powers the Timeline page. |
| `description` | Suggested | Free-text abstract. |
| `subject` | No | Semicolon-separated; powers Subjects cloud + Browse filter. |
| `location` | No | Powers Locations cloud. |
| `latitude` / `longitude` | No | Decimal degrees, 6 places — powers the Map page. |
| `type` / `format` | type: yes | DCMI type vocabulary / IMT media type. |
| `rights` | No | Free-text rights statement. |

Behind the scenes, Jekyll's CSV data reader (patched for compatibility in `_plugins/csv_compat.rb`) turns this
file into `site.data.bsbtest`, referenced throughout the templates as `site.data[site.metadata]` so the code
never hard-codes the catalog's filename.

### The wishlist — `_data/wishlist.csv`

A much simpler table: `objectid, name, status, profile_url, image`. `status` is either `aspirational` (name
only, no research done yet — appears in the two-column text list) or `current` (a profile exists — appears as a
portrait card linking to `profile_url`). The typical lifecycle: an author starts as `aspirational`; once someone
writes their essay (see [§3c](#3c-author-profile-essays)), the row is updated to `current` with the new
`profile_url` and a portrait filename.

### 5a. Display config files — what shows where

A second family of CSVs in `_data/` doesn't hold content — it controls *which metadata fields appear, and how*,
on each generated page. Edit these instead of the page templates when you want to change what's displayed.

| File | Controls |
|---|---|
| `config-metadata.csv` | Field labels + which fields show on the Item detail page. |
| `config-browse.csv` | Which fields appear as filter buttons / sort options on Browse. |
| `config-table.csv` | Which columns appear in the Data-table page. |
| `config-search.csv` | Which fields are indexed and displayed by Lunr.js search. |
| `config-map.csv` | Which fields appear in map marker popups. |
| `config-nav.csv` | Top navigation bar links ([§3e](#3e-adding-a-page-to-the-navigation-menu)). |
| `config-theme-colors.csv` | Bootstrap contextual color overrides ([§4](#4-css--styling)). |

Sitewide toggles that aren't per-field live in `_data/theme.yml` instead: the homepage banner image,
subject/location cloud minimums, map default zoom/center, whether compound-object children appear on the
Map/Timeline/Data pages, and so on. It's heavily commented — worth reading top to bottom once.

### 5b. Drop-in content blocks for page bodies

`_includes/feature/` holds Liquid includes that let a contributor add rich content to any Markdown page —
images, PDFs, audio/video, cards, buttons, alerts, modals, accordions, tag clouds, a TimelineJS embed — without
writing raw HTML. A live catalog of every option with working examples and copy-pasteable code lives in
`_includes/cb/feature_options.md`.

```liquid
{% include feature/image.html objectid="demo_001" width="75" caption="an image" %}

{% include feature/card.html header="Title" text="Body text" objectid="demo_001" width="25" %}

{% include feature/alert.html text="Heads up!" color="warning" align="center" %}
```

`feature/image.html` is the one worth understanding first — it accepts either a catalog `objectid` (pulling the
image, title, and item link automatically from `bsbtest.csv`), an external URL, or a relative path to a
non-catalog image (the latter two require an `alt` attribute for accessibility, since there's no metadata to
auto-fill it from).

---

## 6. Build, deploy, and the Decap CMS pilot

### How a change goes live

There is no committed GitHub Actions workflow in this repository — the build relies entirely on GitHub Pages'
built-in Jekyll handling. Any commit to `main` triggers an automatic rebuild (one to three minutes); check the
repository's **Actions** tab for build status. A red X there almost always means malformed YAML front matter, a
CSV row with the wrong number of columns, or a broken image reference.

### Which workflow to use

- **Small, confident edits** (typos, one data row, a link fix) — commit straight to `main` through GitHub's web
  editor.
- **Larger changes** (a new author profile, multi-file changes) — branch + pull request, reviewed by at least
  one other team member before merging.
- **No write access** — fork the repo and open a pull request against it; same flow as any open-source project.

### The Decap CMS pilot (`/admin`)

`admin/config.yml` configures a [Decap CMS](https://decapcms.org/) editing interface, reachable at `/admin`, as
a friendlier alternative to editing raw CSV/YAML on GitHub. As configured today it is explicitly scoped to a
single pilot use case: editing the wishlist's author list through a form, with fields for name, slug, research
status, profile URL, and portrait upload.

> **Not yet wired to production:** the backend is currently set to `test-repo` — "for local testing only," per
> its own comments — meaning saves in `/admin` write to local files, not to GitHub. Going live requires
> switching to the commented-out `github` backend block. It also currently targets `_data/wishlist.yml`, while
> the live wishlist data actually lives in `_data/wishlist.csv` — that mismatch needs to be resolved before the
> CMS pilot can edit the real file.

---

## 7. Conventions & standards

These are drawn from `CONTRIBUTING.md` and hold across the whole project:

| What | Rule | Example |
|---|---|---|
| IDs & slugs | Lowercase, underscores not spaces, never changed once set (they're in URLs) | `hopkins_pauline` |
| Wishlist slug pattern | `lastname_firstname` | `hopkins_pauline` |
| Catalog objectid pattern | `state_lastname_sequence` | `ny_harper_0012` |
| Image filenames | Match the object's id/slug; thumbnails in `objects/thumbs/` | `hopkins_pauline.jpg` |
| Multi-value fields | Semicolons, never commas | `Poetry; Memoir; Autobiography` |
| Dates | `YYYY` or `YYYY-MM-DD` only; leave blank if uncertain, don't guess | `1880` or `1880-06-03` |
| States | Spelled out in full; "Foreign," "Miscellaneous," "Literary Table" are valid non-state values | `Louisiana`, not `LA` |

**Commit messages** are treated as the project's historical record: present-tense, describes what the commit
does, references an issue number when relevant (`closes #47` auto-closes it on merge). **Attribution** matters —
cite sources for portraits, essays, and facts using the `research_notes` / `digital_notes` fields. If you can't
verify a fact, mark it unverified rather than guess.

---

## 8. Known gaps worth flagging to new contributors

A few things in the current state of the repo are worth knowing about up front, so they don't cause confusion:

- **This file fills a documented gap.** `CONTRIBUTING.md` repeatedly points to a "Site Editing Guide in the
  project documentation" — no such file existed in this repository until this one. Treat it as that guide, and
  keep it updated as the project evolves.
- **"Literary Works" list on author pages doesn't currently populate.** `_layouts/author.html` looks up related
  works via `site.data.collection_metadata_100` — a variable name that doesn't match the project's actual data
  (`site.data.bsbtest`, referenced elsewhere as `site.data[site.metadata]`). As written, that section will
  always render empty.
- **Decap CMS pilot isn't connected to the live wishlist file.** Covered in [§6](#6-build-deploy-and-the-decap-cms-pilot):
  `test-repo` backend plus a filename mismatch (`wishlist.yml` configured vs. `wishlist.csv` in use) mean edits
  through `/admin` don't yet reach the real site.
- **This may be a test/staging branch.** The repository name and several `wishlist.csv` `profile_url` values
  pointing to `thisbeautifulsisterhood.org` (the live site) rather than in-repo paths suggest this `BSBtest`
  repository is a staging or development copy, separate from production. Confirm with the maintainer before
  treating changes here as immediately public.

---

## 9. Quick reference — "I want to…"

| I want to… | Do this |
|---|---|
| Add a new catalog item | Add file to `objects/`, add a row to `_data/bsbtest.csv` |
| Write a new author essay | New Markdown file in `_authors/` |
| Add someone to the wishlist | New row in `_data/wishlist.csv` |
| Change the nav bar | Edit `_data/config-nav.csv` |
| Change sitewide colors/fonts | Edit `_data/theme.yml` |
| Add a reusable style | Add rules to `_sass/_custom.scss` |
| Style one unique page only | Inline `<style>` block inside that page's file, e.g. `pages/wishlist.md` |
| Change what a field shows on Browse/Data/Item/etc. | Edit the matching `_data/config-*.csv` |
| Embed an image/card/button in prose | Use an include from `_includes/feature/` |
| Check whether a change went live | Repository's **Actions** tab |

---

*Compiled from the repository: `_config.yml`, `CONTRIBUTING.md`, `_data/`, `_layouts/`, `_includes/`, `_sass/`,
`_authors/`, `pages/`, and `admin/config.yml`.*
