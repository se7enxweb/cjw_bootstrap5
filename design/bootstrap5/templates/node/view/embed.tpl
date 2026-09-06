{* Generic embed of a node inside an XML field. *}
<div class="content-view-embed class-{$node.object.class_identifier} my-3">
  <h2 class="h5 mb-0">
    {if is_set( $node.url_alias )}
      <a href="{$node.url_alias|ezurl( 'no' )}" title="{$node.name|wash()}">{$node.name|wash()}</a>
    {else}
      {$node.name|wash()}
    {/if}
  </h2>
</div>
