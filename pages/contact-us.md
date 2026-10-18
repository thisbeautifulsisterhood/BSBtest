---
title: Join the Sisterhood
layout: default
permalink: /contact-us.html
---

<div class="bsb-contact-page">

  <nav class="bsb-search-nav">

    <div class="bsb-search-nav-inner">

      <a href="{{ '/' | relative_url }}">
        Home
      </a>

      <div class="bsb-search-nav-dropdown">

        <a href="{{ '/search.html' | relative_url }}">
          Search the Sisterhood
          <span class="bsb-nav-arrow">⌄</span>
        </a>

        <div class="bsb-search-nav-menu">

          <a href="{{ '/subjects.html' | relative_url }}">
            Genres
          </a>

          <a href="{{ '/subjects.html' | relative_url }}">
            Keywords
          </a>

          <a href="{{ '/locations.html' | relative_url }}">
            States
          </a>

          <a href="{{ '/authors/' | relative_url }}">
            Authors
          </a>

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


  <section class="bsb-contact-section">

    <div class="bsb-contact-shell">

      <div class="bsb-contact-heading">

        <p class="bsb-contact-eyebrow">
          Contribute to the project
        </p>

        <h1>
          Join the Sisterhood
        </h1>

        <p>
          Share a question, suggestion, research idea, digitized text, cover,
          illustration, or other material with the project team.
        </p>

      </div>


      <form
        class="bsb-contact-form"
        action="mailto:beautifulsisterhoodbooks@gmail.com"
        method="post"
        enctype="text/plain"
      >

        <h2>
          Your Information
        </h2>

        <div class="bsb-contact-two-column">

          <div class="bsb-field">
            <label for="bsb-name">Name</label>
            <input
              id="bsb-name"
              name="Name"
              type="text"
              required
            >
          </div>

          <div class="bsb-field">
            <label for="bsb-email">Email</label>
            <input
              id="bsb-email"
              name="Email"
              type="email"
              required
            >
          </div>

        </div>


        <div class="bsb-field">

          <label for="bsb-message">
            Please briefly ask a question, describe your suggestion, or outline
            your proposed topic, and someone will be in touch with you soon!
          </label>

          <textarea
            id="bsb-message"
            name="Message"
            rows="8"
          ></textarea>

        </div>


        <div class="bsb-field">

          <label for="bsb-link">
            If you have a link to a digitized text, covers, or illustrations,
            please submit it here:
          </label>

          <input
            id="bsb-link"
            name="Digitized material link"
            type="url"
            placeholder="https://"
          >

        </div>


        <div class="bsb-field">

          <label for="bsb-file">
            If you would like to upload digitized text, covers, or illustrations,
            please do that here: (JPEG or PDF only)
          </label>

          <input
            id="bsb-file"
            name="Attachment"
            type="file"
            accept=".jpg,.jpeg,.pdf"
          >

          <p class="bsb-contact-note">
            Note: file attachments depend on your email application and browser.
            You can always email materials directly using the address below.
          </p>

        </div>


        <div class="bsb-contact-email-box">

          <span>
            Alternatively, feel free to email any questions or digitized material to
          </span>

          <a href="mailto:beautifulsisterhoodbooks@gmail.com">
            beautifulsisterhoodbooks@gmail.com
          </a>

        </div>


        <div class="bsb-contact-actions">

          <button
            class="bsb-contact-submit"
            type="submit"
          >
            Submit
          </button>

        </div>

      </form>

    </div>

  </section>


  {% include bsb-footer.html %}

</div>
