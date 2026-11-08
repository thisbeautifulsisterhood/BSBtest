---
title: Site Search
layout: search
permalink: /search.html
# see _data/search-config.csv for display options
# Lunr.js search will be added below the content in this file
---

<script>
document.addEventListener("DOMContentLoaded", function () {
  document.body.classList.add("bsb-search-body");

  /* Hide CollectionBuilder's normal site masthead/navbar on this page only. */
  const selectors = [
    "#header",
    "header#header",
    ".site-header",
    "nav.navbar",
    ".navbar"
  ];

  selectors.forEach(function (selector) {
    document.querySelectorAll(selector).forEach(function (element) {
      /* Do not hide our custom white Search-page nav. */
      if (!element.classList.contains("bsb-search-nav")) {
        element.style.display = "none";
      }
    });
  });

  document.querySelectorAll("button, a").forEach(function (element) {
    if (element.textContent.trim() === "Search Options") {
      element.style.display = "none";
    }
  });
});
</script>


<style>
  .bsb-search-page {
    width: 100vw;
    max-width: none;
    margin-left: calc(50% - 50vw);
    margin-right: calc(50% - 50vw);
    overflow-x: hidden;
    background: #ffffff;
    color: #1c1917;
  }

  .bsb-search-page .bsb-search-hero {
    box-sizing: border-box;
    width: 100%;
    min-height: 468px;
    margin: 0;
    padding: 110px 40px;
    display: flex;
    align-items: center;
    justify-content: center;
    background:
      linear-gradient(rgba(185, 193, 181, 0.20), rgba(185, 193, 181, 0.20)),
      url("{{ '/assets/img/bsb/Copy-of-This-Beautiful-Sisterhood-of-Books-6.png' | relative_url }}")
      center center / cover no-repeat;
  }

  .bsb-search-page .bsb-search-hero-box {
    box-sizing: border-box;
    width: min(1268px, 100%);
    max-width: 1268px;
    margin: 0 auto;
    padding: 56px 16px 48px;
    background: rgba(128, 161, 158, 0.58);
    box-shadow: 20px 20px 30px rgba(0, 0, 0, 0.20);
  }

  .bsb-search-page .bsb-search-hero-box h1 {
    margin: 0 0 50px;
    color: #1c1917;
    font-family: "DM Sans", Arial, sans-serif;
    font-size: clamp(36px, 3.3vw, 48px);
    font-weight: 400;
    line-height: 1.2;
  }

  .bsb-search-page .bsb-search-hero-box p {
    margin: 0;
    color: #1c1917;
    font-family: "Figtree", Arial, sans-serif;
    font-size: clamp(20px, 1.45vw, 24px);
    font-weight: 400;
    line-height: 1.4;
  }

  .bsb-search-page .bsb-search-nav {
    width: 100%;
    margin: 0;
    padding: 8px 40px;
    background: #ffffff;
  }

  .bsb-search-page .bsb-search-nav-inner {
    width: 100%;
    max-width: 1000px;
    margin: 0 auto;
    min-height: 72px;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 28px;
  }

  .bsb-search-page .bsb-search-nav a {
    white-space: nowrap;
  }

  .bsb-search-page .bsb-discover {
    width: 100%;
    max-width: 1400px;
    margin: 0 auto;
    padding: 80px 40px;
    box-sizing: border-box;
  }

  .bsb-search-page .bsb-discover-grid {
    display: grid;
    grid-template-columns: minmax(0, 1fr) minmax(0, 1fr);
    gap: 40px;
    align-items: center;
  }

  .bsb-search-page .bsb-discover-image img {
    display: block;
    width: 100%;
    height: auto;
    box-shadow: 6px 6px 9px rgba(0, 0, 0, 0.20);
  }

  .bsb-search-page .bsb-discover-content h2 {
    margin: 0 0 18px;
    font-family: "DM Sans", Arial, sans-serif;
    font-size: clamp(36px, 3.3vw, 48px);
    font-weight: 400;
    line-height: 1.2;
  }

  .bsb-search-page .bsb-discover-content p,
  .bsb-search-page .bsb-discover-bottom p {
    color: #1c1917;
    font-family: "Figtree", Arial, sans-serif;
    font-size: clamp(20px, 1.45vw, 24px);
    line-height: 1.4;
  }

  .bsb-search-page .bsb-discover-bottom {
    margin-top: 40px;
  }

  .bsb-search-page .bsb-search-gold-rule {
    width: 100%;
    height: 2px;
    margin: 40px 0 0;
    border: 0;
    background: #d4af37;
  }

  .bsb-search-page .bsb-database,
  .bsb-search-page .bsb-search-links {
    width: 100%;
    margin: 0;
    box-sizing: border-box;
    background: #faf9f6;
  }

  .bsb-search-page .bsb-database {
    padding: 80px 40px 40px;
  }

  .bsb-search-page .bsb-database-grid,
  .bsb-search-page .bsb-search-links-grid {
    width: 100%;
    max-width: 1400px;
    margin: 0 auto;
  }

  .bsb-search-page .bsb-database-grid {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 40px;
    align-items: center;
  }

  .bsb-search-page .bsb-database h3 {
    margin: 0;
    font-size: clamp(20px, 1.45vw, 24px);
    font-weight: 400;
  }

  .bsb-search-page .bsb-database h2 {
    margin: 12px 0 0;
    font-family: "DM Sans", Arial, sans-serif;
    font-size: clamp(36px, 3.3vw, 48px);
    font-weight: 400;
    line-height: 1.2;
  }

  .bsb-search-page .bsb-database p {
    margin: 0 0 20px;
    font-size: clamp(20px, 1.45vw, 24px);
    line-height: 1.4;
  }

  .bsb-search-page .bsb-search-links {
    padding: 40px 40px 80px;
  }

  .bsb-search-page .bsb-search-links-grid {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 24px;
  }

  .bsb-search-page .bsb-specific-search {
    box-sizing: border-box;
    width: min(1400px, calc(100% - 80px));
    margin: 0 auto 80px;
    padding: 80px 40px;
    background:
      linear-gradient(rgba(114, 130, 121, 0.80), rgba(114, 130, 121, 0.80)),
      url("{{ '/assets/img/bsb/rectangular-old-fashioned-curly-golden-border-with-light-blue-background-1.png' | relative_url }}")
      center / cover no-repeat;
    color: #ffffff;
  }

  .bsb-search-page .bsb-specific-search-inner {
    max-width: 800px;
    margin: 0 auto;
    text-align: center;
  }

  .bsb-search-page .bsb-specific-search h2,
  .bsb-search-page .bsb-specific-search p {
    color: #ffffff;
  }

  .bsb-search-page .bsb-specific-search h2 {
    margin: 0 0 18px;
    font-family: "DM Sans", Arial, sans-serif;
    font-size: clamp(24px, 2.4vw, 32px);
    font-weight: 400;
  }

  .bsb-search-page .bsb-specific-search p {
    font-size: clamp(20px, 1.45vw, 24px);
  }

  body.bsb-search-body .search-options,
  body.bsb-search-body #search-options,
  body.bsb-search-body #searchOptions {
    display: none !important;
  }

  @media (max-width: 767px) {
    .bsb-search-page .bsb-search-hero {
      min-height: 360px;
      padding: 60px 18px;
    }

    .bsb-search-page .bsb-search-hero-box {
      padding: 34px 20px;
    }

    .bsb-search-page .bsb-search-hero-box h1 {
      margin-bottom: 28px;
    }

    .bsb-search-page .bsb-search-nav {
      padding: 10px 18px;
    }

    .bsb-search-page .bsb-search-nav-inner {
      flex-wrap: wrap;
      gap: 14px 20px;
    }

    .bsb-search-page .bsb-discover,
    .bsb-search-page .bsb-database,
    .bsb-search-page .bsb-search-links {
      padding-left: 18px;
      padding-right: 18px;
    }

    .bsb-search-page .bsb-discover-grid,
    .bsb-search-page .bsb-database-grid,
    .bsb-search-page .bsb-search-links-grid {
      grid-template-columns: 1fr;
    }

    .bsb-search-page .bsb-specific-search {
      width: calc(100% - 36px);
      margin-bottom: 56px;
      padding: 56px 24px;
    }
  }
</style>

<div class="bsb-search-page">

  <!-- ==================================================
       HERO
       ================================================== -->

  <section class="bsb-search-hero">
    <div class="bsb-search-hero-box">
      <h1>Search the Sisterhood</h1>

      <p>
        Recovering the 1884 Woman’s Literary Department for the
        21<sup>st</sup>&nbsp;Century
      </p>
    </div>
  </section>


  <!-- ==================================================
       WHITE NAVIGATION BAR
       ================================================== -->

  <nav class="bsb-search-nav" aria-label="Sisterhood navigation">
    <div class="bsb-search-nav-inner">

      <a href="{{ '/' | relative_url }}">Home</a>

      <div class="bsb-search-nav-dropdown">
        <a
          class="bsb-search-nav-main-link"
          href="{{ '/search.html' | relative_url }}"
        >
          Search the Sisterhood
          <span class="bsb-nav-arrow" aria-hidden="true">⌄</span>
        </a>

        <div class="bsb-search-nav-menu">
          <a href="{{ '/subjects.html' | relative_url }}">Genres</a>
          <a href="{{ '/subjects.html' | relative_url }}">Keywords</a>
          <a href="{{ '/locations.html' | relative_url }}">States</a>
          <a href="{{ '/authors/' | relative_url }}">Authors</a>
        </div>
      </div>

      <a href="{{ '/study.html' | relative_url }}">
        Study the Sisterhood
      </a>

      <a href="{{ '/teach.html' | relative_url }}">
        Teach the Sisterhood
      </a>

      <a href="{{ '/join.html' | relative_url }}">
        Join the Sisterhood
      </a>

    </div>
  </nav>


  <!-- ==================================================
       DISCOVER THE SISTERHOOD
       ================================================== -->

  <section class="bsb-discover">

    <div class="bsb-discover-grid">

      <div class="bsb-discover-image">
        <img
          src="{{ '/assets/img/bsb/search-library.png' | relative_url }}"
          alt="Library"
        >
      </div>

      <div class="bsb-discover-content">

        <h2>
          Discover the <em>Sisterhood</em>
        </h2>

        <p>
          The original Woman’s Literary Department was created for exhibition
          at the 1884 New Orleans World’s Fair. It comprised more than 1,400
          items – books, journals, newspapers, and sheet music donated by
          publishers and collected by “lady delegates” from around the US.
        </p>

        <p>
          While the vast majority of these materials were written and edited
          by US women, works from England, France, and Germany was also included
          – as was several titles by men. Black women were not represented,
          despite having proposed to exhibit their works alongside those by
          white women.
        </p>

        <a
          class="bsb-search-outline-button"
          href="{{ '/black-women-and-the-1884-world-fair/' | relative_url }}"
        >
          Access The “Black Women and the 1884 World Fair Exhibit”
        </a>

      </div>

    </div>


    <div class="bsb-discover-bottom">

      <p>
        At the Fair’s conclusion, the director of the Woman’s Literary
        Department, Maud Howe, declared herself determined “to keep this
        beautiful sisterhood of books together” as a permanent library.
        But circumstances intervened and, within months of its presentation
        to a local arts society, the physical collection was scattered and lost.
      </p>

      <p>
        <em>This Beautiful Sisterhood of Books</em>&nbsp;recovers Maud’s
        library for new readers and researchers.
      </p>

    </div>

    <hr class="bsb-search-gold-rule">

  </section>


  <!-- ==================================================
       DATABASE INTRO
       ================================================== -->

  <section class="bsb-database">

    <div class="bsb-database-grid">

      <div>
        <h3>
          Explore Maud’s library in its new digital form…
        </h3>

        <h2>
          Search the Sisterhood Database!
        </h2>
      </div>

      <div>
        <p>
          Do you have information, such as links to resources or materials,
          that may help us complete the database?
        </p>

        <a
          class="bsb-database-contact"
          href="https://tulane.co1.qualtrics.com/jfe/form/SV_09gg00GSSSi4LVY"
          target="_blank"
          rel="noreferrer noopener"
        >
          Contact Us
        </a>
      </div>

    </div>

  </section>


  <!-- ==================================================
       SEARCH CATEGORY LINKS
       ================================================== -->

  <section class="bsb-search-links">

    <div class="bsb-search-links-grid">

      <a
        class="bsb-search-link-card blue"
        href="{{ '/authors/' | relative_url }}"
      >
        Search by Authors →
      </a>

      <a
        class="bsb-search-link-card gold"
        href="{{ '/subjects.html' | relative_url }}"
      >
        Search by Genres →
      </a>

      <a
        class="bsb-search-link-card gold"
        href="{{ '/locations.html' | relative_url }}"
      >
        Search by States →
      </a>

      <a
        class="bsb-search-link-card blue"
        href="{{ '/subjects.html' | relative_url }}"
      >
        Search by Keywords →
      </a>

    </div>

  </section>


  <!-- ==================================================
       LOOKING FOR SOMETHING SPECIFIC
       ================================================== -->

  <section class="bsb-specific-search">

    <div class="bsb-specific-search-inner">

      <h2>
        Looking For Something Specific?
      </h2>

      <p>
        Use the search bar…
      </p>

      <p class="bsb-search-note">
        Use the CollectionBuilder search below to search the database.
      </p>

    </div>

  </section>


  {% include bsb-footer.html %}

</div>
