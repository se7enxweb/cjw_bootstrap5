{* resume content class does not exist in this installation; ported verbatim from source fields *}
{* Article - Line view (object-based: renders $object.main_node, NOT $node) *}

<div class="d-flex align-items-start border-bottom py-2">

    {section show=$object.main_node.data_map.image.has_content}
        <div class="flex-shrink-0 me-3" style="width:80px;height:80px;overflow:hidden;">
            {attribute_view_gui image_class=articlethumbnail href=$object.main_node.url_alias|ezurl attribute=$object.main_node.data_map.image}
        </div>
    {/section}

    <div class="flex-grow-1">
        <h6 class="mb-1"><a href={$object.main_node.url_alias|ezurl}>{$object.main_node.data_map.title.content|wash}</a></h6>

        {section show=$object.main_node.data_map.intro.content.is_empty|not}
        <p class="mb-1 text-body-secondary small">
            {attribute_view_gui attribute=$object.main_node.data_map.intro}
        </p>
        {/section}

        {section show=$object.main_node.data_map.body.content.is_empty|not}
        <div class="mb-0">
            {attribute_view_gui attribute=$object.main_node.data_map.body}
        </div>
        {/section}
    </div>

</div>
