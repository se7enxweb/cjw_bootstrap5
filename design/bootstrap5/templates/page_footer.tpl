{def $startyear=ezini( 'ThemeSettings', 'CopyrightStartYear', 'cjw_bootstrap5.ini' )}
<footer class="border-top py-4 mt-4">
    <div class="container text-center text-body-secondary small">
      <p class="mb-1">
        Copyright &#169; {if $startyear|ne('')}{$startyear} - {/if}{currentdate()|datetime( 'custom', '%Y' )} {ezini( 'SiteSettings', 'SiteName', 'site.ini' )}. All rights reserved.
      </p>
      {if $pagedesign.data_map.hide_powered_by.data_int|not}
      <p class="mb-0">
        Powered by <a href="https://exponential.se7enx.com" title="Exponential CMS Open Source Web Content Management">Exponential CMS</a> &middot;
        Design: <a href="/ezinfo/about">CJW Bootstrap 5</a>
      </p>
      {/if}
    </div>
</footer>
