{* Image in a horizontal card row. *}
<figure class="content-view-horizontallylistedsubitems class-image h-100 mb-0">
    {attribute_view_gui attribute=$node.data_map.image image_class=small href=$node.url_alias|ezurl()}
    <figcaption class="small mt-1">
      <a href="{$node.url_alias|ezurl( no )}">{$node.name|wash()}</a>
    </figcaption>
</figure>
