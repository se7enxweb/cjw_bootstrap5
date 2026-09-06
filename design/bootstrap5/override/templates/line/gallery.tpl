{* Gallery - Line view *}

<div class="d-flex align-items-start border-bottom py-2">

    {section show=$node.data_map.image.content}
        <div class="flex-shrink-0 me-3" style="width:80px;height:80px;overflow:hidden;">
            {attribute_view_gui image_class=large attribute=$node.data_map.image.content.data_map.image href=$node.url_alias|ezurl}
        </div>
    {/section}

    <div class="flex-grow-1">
        <h6 class="mb-1"><a href={$node.url_alias|ezurl}>{$node.name|wash()}</a></h6>

        <p class="mb-1 text-body-secondary small">
           {attribute_view_gui attribute=$node.data_map.short_description}
        </p>

        <div class="mb-0">
           {attribute_view_gui attribute=$node.data_map.rating}
        </div>
    </div>

</div>
