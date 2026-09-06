{* Related content from the tags field. Expects $related_content. *}
<div class="attribute-relatedcontent mt-4">
  <h2 class="h5">{'Related content'|i18n( 'design/bootstrap5/parts/related_content' )}</h2>
  <ul class="list-unstyled mb-0">
  {foreach $related_content|reverse() as $related_object max 7}
    <li class="mb-1"><a href="{$related_object.url_alias|ezurl( 'no' )}" title="{$related_object.name|wash()}">{$related_object.name|wash()}</a></li>
  {/foreach}
  </ul>
</div>
