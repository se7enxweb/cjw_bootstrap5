{* Article in a horizontal card row. The column width is set by the
   surrounding embed/horizontally_listed_sub_items.tpl. *}
<div class="content-view-horizontallylistedsubitems class-article h-100">
    <h3 class="h6"><a href={$node.url_alias|ezurl}>{$node.data_map.title.content|wash}</a></h3>

    {if $node.data_map.image.has_content}
      <div class="mb-2">
        {attribute_view_gui image_class=articlethumbnail href=$node.url_alias|ezurl attribute=$node.data_map.image}
      </div>
    {/if}

    {if $node.data_map.intro.content.is_empty|not}
      <div class="text-body-secondary small">
        {attribute_view_gui attribute=$node.data_map.intro}
      </div>
    {/if}
</div>
