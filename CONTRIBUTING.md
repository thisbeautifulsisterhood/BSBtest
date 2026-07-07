# Contributing to This Beautiful Sisterhood

Thank you for helping build this recovery project. This document explains how to contribute to the site — whether you're on the research team, a collaborator from another institution, or someone with a suggestion to share.

For step-by-step instructions on specific editing tasks (adding an author, updating the catalog, editing pages), see the **Site Editing Guide** in the project documentation. This document covers the higher-level workflow, conventions, and how to work with the rest of the team.

## Who this guide is for

There are three kinds of contributors, and this guide covers all three:

**Core team members** have write access to the repository and edit content directly through GitHub. Most contributions come from this group.

**Occasional collaborators** — students, visiting researchers, faculty from other institutions — may contribute a profile essay, correct an entry, or suggest an addition without joining the core team long-term. They can either request temporary access or submit changes through the pull request process below.

**Anyone with a suggestion** can propose additions, corrections, or improvements without editing anything themselves by filing an issue on GitHub. The core team will handle the actual edit.

## Getting set up

You need three things to contribute directly:

1. A free GitHub account. Sign up at https://github.com/signup if you don't already have one.

2. Access to this repository. Ask the site maintainer to add you as a collaborator. Include your GitHub username in the request. You'll receive an email invitation to accept.

3. Familiarity with the Site Editing Guide. Read it once before making your first change. Keep it open in a browser tab while you work.

No software installation is required for most tasks. All editing happens through GitHub's web interface at github.com in your browser.

## How to make a change

The workflow depends on the size of the change.

**Small edits — typos, factual corrections, a single row addition, a link update.** Navigate to the file on GitHub, click the pencil icon at the top of the file view to open the editor, make your change, scroll to the bottom, write a brief commit message describing what you did, and click "Commit changes." The site rebuilds automatically within a couple of minutes.

The direct-to-main workflow is fine for changes you're confident about. Everyone on the core team can make these.

**Larger changes — a new author profile, restructuring a section, changes that affect multiple files together.** Use a pull request instead of committing directly. Create a new branch when you start editing (GitHub's editor will prompt you: choose "Create a new branch and start a pull request"). Make all your changes on that branch. When you're ready, open the pull request and request review from at least one other team member. After they approve, merge the pull request.

The pull request workflow adds a step, but it means someone else sees the change before it goes live. For substantive additions this is worth it — the second pair of eyes catches things you missed, and the review conversation becomes part of the project's history.

**If you don't have write access** — you're an occasional collaborator or an external contributor — you can still submit changes by forking the repository, making changes on your fork, and opening a pull request against the main repository. The maintainer will review and merge. This is the same workflow used across the open-source world; if you've never done it before, GitHub has a good introduction at https://docs.github.com/en/get-started/quickstart/contributing-to-projects.

## Naming and formatting conventions

Consistency across contributors is what keeps the data usable over time. A few conventions to know:

**Object IDs and slugs** are all lowercase, use underscores rather than spaces, and never change once set (they appear in URLs). Wishlist slugs follow the pattern `lastname_firstname` — for example, `hopkins_pauline`. Catalog object IDs follow `state_lastname_sequence` — for example, `ny_harper_0012`. If you're not sure what ID to assign, ask before committing.

**Image filenames** match the object they belong to. A portrait of Pauline Hopkins goes in `objects/` as `hopkins_pauline.jpg`. Thumbnails for catalog items live in `objects/thumbs/` and follow the same convention.

**Multi-value fields** — subjects, genres, keywords — separate values with semicolons, not commas. `Poetry; Memoir; Autobiography` is three genres; `Poetry, Memoir, Autobiography` is one weirdly-named genre.

**Dates** use `YYYY` for year-only, `YYYY-MM-DD` for full dates. Never `June 3rd, 1880` or `June 1880`. If the year is uncertain, leave it blank rather than guessing.

**State names** are spelled out in full (`Louisiana`, not `LA`). Non-state values `Foreign`, `Miscellaneous`, and `Literary Table` are legitimate for the catalog and should be preserved when encountered.

The Site Editing Guide has a full field reference. When in doubt, check there.

## Writing good commit messages

Commit messages become the historical record of the project. Future team members (including future-you) will read them to figure out why something is the way it is. A few habits:

Write the message as a short sentence in the present tense describing what the commit does. `Add Pauline Hopkins to wishlist` is good. `updated stuff` is not.

For non-obvious changes, add a longer explanation after a blank line. Why did you make this change? What was the source? What did you consider and decide against?

If the change relates to a GitHub issue, reference it by number. `Fix Wells-Barnett birth date (closes #47)` will automatically close issue #47 when merged.

Avoid squashing multiple unrelated changes into one commit. Small, focused commits are easier to review and easier to undo if something turns out to be wrong.

## What happens after you commit

GitHub triggers an automatic rebuild whenever any file changes. There is no button to press. The rebuild takes one to three minutes.

To check whether your change went live: click the "Actions" tab at the top of the repository. The most recent workflow run shows the status. A green checkmark means the build succeeded and your change is live. A red X means the build failed — click into the run to see the error.

Most build failures are caused by malformed YAML front matter (missing quotes, wrong indentation), a CSV row with the wrong number of columns, or a broken image reference. The Site Editing Guide has a troubleshooting section covering the common cases.

If you can't figure out what broke, don't panic. Revert your last commit (GitHub has a "Revert" button on the commit page) to restore the site to a working state, then ask for help. Everyone breaks the site occasionally; that's what version control is for.

## Getting help

If you're stuck, the fastest way to get unstuck is to ask.

For general questions, editing conventions, or "does this seem right?" — reach out to the site maintainer directly. Include a link to the file or line you're asking about.

For bugs, broken pages, or unexpected behavior on the live site — open an issue on GitHub using the appropriate template. The issue templates are in the "Issues" tab under "New issue."

For pull request reviews — request review from a core team member when you open the PR. If you don't get a response within a few days, ping the maintainer.

Please don't fix problems silently and hope nobody notices. If you're not sure whether a change is correct, opening a discussion first is always better than committing and hoping.

## A note on scholarly standards

This project catalogs the work of Black women writers whose contributions were excluded from the historical record. Everything we add to the site participates in that recovery work. That means:

Accuracy matters more than speed. If you can't verify a fact from a reliable source, note it as unverified or leave it out.

Attribution matters. When you use a portrait, essay, or piece of information from another source, cite it. The `research_notes` and `digital_notes` fields exist for this.

Contributors matter. When you write a profile essay, you get bylined for it. The `contributor` field in the profile front matter is not optional.

The site is a scholarly artifact. Treat contributions as you would treat contributions to any peer-reviewed venue — with care, honesty, and respect for the people whose work you're representing.

## Reporting concerns

If you encounter problematic content on the site — factual errors, offensive language that slipped through review, plagiarism, or ethical concerns about a contribution — contact the site maintainer directly rather than opening a public issue. Sensitive matters deserve private handling first.

## Thank you

Every contribution, whether a full profile essay or a single typo fix, moves this project forward. The site exists because researchers took the time to add to it. Thank you for being one of them.
