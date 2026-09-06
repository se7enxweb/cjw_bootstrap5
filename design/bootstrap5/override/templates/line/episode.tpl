{* episode content class does not exist in this installation; ported verbatim from source fields *}
{* Episode - Line view *}

<div class="d-flex align-items-start border-bottom py-2">

    {section show=$node.data_map.image.has_content}
        <div class="flex-shrink-0 me-3" style="width:80px;height:80px;overflow:hidden;">
            {attribute_view_gui image_class=articlethumbnail href=$node.url_alias|ezurl attribute=$node.data_map.image}
        </div>
    {/section}

    <div class="flex-grow-1">
        <h6 class="mb-1"><a href={$node.url_alias|ezurl}>{$node.data_map.title.content|wash}</a></h6>

        {section show=$node.data_map.intro.content.is_empty|not}
        <p class="mb-0 text-body-secondary small">
            {attribute_view_gui attribute=$node.data_map.intro}
        </p>
        {/section}
    </div>

</div>
