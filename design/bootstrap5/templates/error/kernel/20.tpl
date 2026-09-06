{* BC Note: Replaced textual concept of 'module' for 'page' and dropped unrelated user unfriendly message about siteaccess URI string *}
<div class="row justify-content-center py-5">
  <div class="col-md-8 text-center">
    <h1 class="display-4">{"Page not found"|i18n("design/bootstrap5/error/kernel")}</h1>
    <p class="lead">{"The requested page %module could not be found."|i18n("design/bootstrap5/error/kernel",,
                                                            hash('%module',$parameters.module|wash))}</p>
  </div>
  <div class="col-md-8">
    <div class="alert alert-warning">
      <p>{"Possible reasons for this are"|i18n("design/bootstrap5/error/kernel")}:</p>
      <ul class="mb-0">
          <li>{"The page URL was misspelled, try changing the URL."|i18n("design/bootstrap5/error/kernel")}</li>
          <li>{"The page no longer exists on this site."|i18n("design/bootstrap5/error/kernel")}</li>
      </ul>
    </div>
    <p class="text-body-secondary text-center">{"Apologies for any inconvenience this may have caused"|i18n("design/bootstrap5/error/kernel")}</p>
  </div>
</div>

{if $embed_content}

{$embed_content}
{/if}
