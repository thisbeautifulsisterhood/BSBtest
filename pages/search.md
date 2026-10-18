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
});
</script>

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

      <a href="https://thisbeautifulsisterhood.org/study-the-sisterhood/">
        Study the Sisterhood
      </a>

      <a href="https://thisbeautifulsisterhood.org/teaching/">
        Teach the Sisterhood
      </a>

      <a href="https://thisbeautifulsisterhood.org/join/">
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
          href="https://thisbeautifulsisterhood.org/black-women-and-the-1884-world-fair/"
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
