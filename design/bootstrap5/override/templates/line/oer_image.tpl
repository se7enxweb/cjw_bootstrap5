{* OER image - Line view *}
<div class="d-flex align-items-start border-bottom py-2">
    <div class="flex-shrink-0 me-3" style="width:80px;height:80px;overflow:hidden;">
        {attribute_view_gui image_class=large attribute=$node.data_map.image}
    </div>
    <div class="flex-grow-1">
        <h6 class="mb-1"><a href={$node.url_alias|ezurl}>{$node.data_map.name.content|wash()}</a></h6>
        <p class="mb-0 text-body-secondary small">
            {attribute_view_gui attribute=$node.data_map.author} &middot; {attribute_view_gui attribute=$node.data_map.license}
        </p>
    </div>
</div>
