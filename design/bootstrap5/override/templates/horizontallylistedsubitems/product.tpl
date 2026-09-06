{* Product in a horizontal card row. *}
<div class="content-view-horizontallylistedsubitems class-product h-100">
    <h3 class="h6"><a href={$node.url_alias|ezurl}>{$node.name|wash()}</a></h3>

    {if $node.data_map.image.has_content}
      <div class="mb-2">
        {attribute_view_gui image_class=small href=$node.url_alias|ezurl attribute=$node.data_map.image}
      </div>
    {/if}

    {if is_set( $node.data_map.price )}
      <div class="mb-1">{attribute_view_gui attribute=$node.data_map.price}</div>
    {/if}
</div>
