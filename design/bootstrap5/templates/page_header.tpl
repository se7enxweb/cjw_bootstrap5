
  <!-- Header area: START -->
  <header id="headerMain">
    <nav class="navbar navbar-expand-lg bg-body-tertiary border-bottom">
      <div class="container">
        <a href={"/"|ezurl} title="{ezini('SiteSettings','SiteName')}" class="navbar-brand d-flex align-items-center gap-2">
          {if and( is_set( $pagedesign ), $pagedesign.data_map.image.content.is_valid )}
            <img src={$pagedesign.data_map.image.content[logo].full_path|ezroot} alt="{$pagedesign.data_map.image.content[logo].text|wash}" height="40">
          {else}
            {* Default logo of this extension: the Exponential CMS brand
               (design/bootstrap5/images/logo.png), not a customer/project
               logo. Using your own logo: see README "Favicons & logo". *}
            <img src={"images/logo.png"|ezdesign()} alt="" height="40">
          {/if}
          {* The site name next to it is text, not an image wordmark.
             The alt attribute of the logo stays empty so screen readers
             do not read the name twice. *}
          <span class="fs-5 text-body-secondary">{ezini('SiteSettings','SiteName')|wash()}</span>
        </a>
        <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="{'Toggle navigation'|i18n('design/bootstrap5/page_header')}">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div id="navbarCollapse" class="collapse navbar-collapse">
          {include uri='design:menu/dropdown.tpl'}
        </div>
        <a href="/shop/cart" class="ms-2" title="{'Basket'|i18n('design/bootstrap5/page_header')}">
          <i class="bi bi-cart3 fs-4"></i>
        </a>
      </div>
    </nav>
  </header>
  <!-- Header area: END -->
