# Decap CMS Pilot Setup

This folder contains a draft configuration for adding Decap CMS to the project as a friendly editing layer over GitHub. The pilot is scoped to the wishlist only — adding more content types comes later, once the team is comfortable with the workflow.

## What's in this folder

Three files plus this README:

- **`admin_index.html`** — entry point HTML that loads Decap from its CDN. Should be placed in the repo at `admin/index.html`.
- **`admin_config.yml`** — the main Decap configuration declaring how the wishlist gets edited. Should be placed in the repo at `admin/config.yml`.
- **`wishlist.yml`** — the wishlist data converted from CSV to YAML (which is what Decap can edit). Should replace `_data/wishlist.csv` at `_data/wishlist.yml`.

## How the pieces fit together

When a contributor visits `thisbeautifulsisterhood.org/admin/`, the browser loads `admin/index.html`. That file pulls in the Decap CMS JavaScript bundle from a CDN. Decap then reads `admin/config.yml` to learn what content the site has and how to edit it. The config points at `_data/wishlist.yml` as the file being edited.

When the contributor logs in (via GitHub) and clicks save on a change, Decap commits the modified YAML file back to the GitHub repo on their behalf. GitHub triggers an automatic rebuild of the static site. Within a couple of minutes, the change is live.

## Required code changes elsewhere in the repo

Migrating the wishlist from CSV to YAML changes one line of the Jekyll template. In `pages/wishlist.md`, the two filter expressions that currently read:

```liquid
{% assign current = site.data.wishlist | where: "status", "current" %}
{% assign aspirational = site.data.wishlist | where: "status", "aspirational" %}
```

become:

```liquid
{% assign current = site.data.wishlist.authors | where: "status", "current" %}
{% assign aspirational = site.data.wishlist.authors | where: "status", "aspirational" %}
```

The added `.authors` reflects that the YAML file wraps the list under an `authors:` key (Decap requires a named root field). Everything else in the template — the loops, the image rendering, the styling — stays exactly the same.

The references inside the loop also need a small adjustment: the field formerly called `name` in the CSV is still `name`, but the `objectid` column was renamed to `slug` in the YAML to be more contributor-friendly. Update any references from `author.objectid` to `author.slug`.

## Before deploying

Three things to set up before this works end to end:

**1. Replace the placeholder in `admin/config.yml`.** The line `repo: ORG_OR_USERNAME/REPO_NAME` needs to point at the actual GitHub repository, such as `tulane-cads/beautiful-sisterhood`.

**2. Set up GitHub OAuth authentication.** Decap needs a way to log contributors in. The simplest path is to use Netlify's free OAuth bridge:
   - Sign up for a free Netlify account (no need to host the site there).
   - Connect the GitHub account.
   - Netlify's OAuth bridge handles the authentication handshake at no cost.
   - Documentation: https://decapcms.org/docs/github-backend/

   An alternative is to self-host a GitHub OAuth proxy on a small VPS or serverless function — more control, more setup time.

**3. Add contributors as repo collaborators.** Each contributor needs a GitHub account and write access to the repository. Without write access, the GitHub backend will let them log in but reject their save attempts.

## How contributors will use it

After setup, the contributor workflow is:

1. Visit `thisbeautifulsisterhood.org/admin/` in a browser.
2. Click "Login with GitHub" and authorize the connection (one-time per browser).
3. The admin dashboard shows "Wishlist Authors" as the only editable collection.
4. Click into it to see the full list of 54 authors. Each entry shows the name and current status.
5. Click "+" to add a new author, fill in the form, save. Or click an existing author to edit them.
6. Saved changes appear on the live site within a couple of minutes.

The form fields have hints explaining the conventions (slug format, status meanings, image dimensions), so contributors don't need to memorize them.

## Testing locally before going live

It's possible to test Decap against a local Jekyll build using `npx decap-server` as a mock backend. This lets the team try the admin interface without touching the production repo. Useful for the initial walkthrough.

```bash
# In one terminal, run the Jekyll site as normal:
bundle exec jekyll serve

# In a second terminal, run the local Decap backend:
npx decap-server

# Visit http://localhost:4000/admin/ — Decap will use the local backend
# instead of GitHub, so saves write to your local files rather than committing.
```

This requires temporarily changing `backend.name` from `github` to `test-repo` in `admin/config.yml`. Switch it back before deploying.

## Expanding past the pilot

Once the wishlist editing flow is working and the team is comfortable, the next collections to add are likely:

- **Author profile essays** as a folder collection at `_authors/`, with rich-text editing for the essay body
- **Static pages** (About, Teach, Study) as another folder collection at `pages/`
- **The main catalog** — this is the largest and most sensitive collection, and probably benefits from a custom editing interface or being kept on Google Sheets sync rather than going through Decap

Each addition is more YAML in `admin/config.yml`. No new infrastructure required.

## Known limitations of Decap

A few things worth setting team expectations about up front:

- The rich-text editor is good but not Word-quality. Footnotes, complex tables, and citation formatting need manual markdown.
- Two contributors editing the same author simultaneously will produce a merge conflict on save. Rare in practice but possible.
- Image uploads work but don't automatically resize. The hints tell contributors what dimensions to use, but no automatic enforcement.
- If GitHub is down, the admin interface is unavailable. (The public site continues to work, since it's static.)

None of these are dealbreakers; they're shape-of-the-tool realities to plan around.
