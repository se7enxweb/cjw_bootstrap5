{* audio content class does not exist in this installation; ported verbatim from source fields *}
<div class="d-flex align-items-start border-bottom py-2">
    <div class="flex-grow-1">
        <h6 class="mb-1">
            <a href={$node.url_alias|ezurl()}>{$node.name|wash()}</a>
        </h6>
        <div class="mb-1">
            {attribute_view_gui attribute=$node.data_map.file width="620" height="440"}
        </div>
        <p class="mb-0 text-body-secondary small">{if $node.data_map.description.has_content}{attribute_view_gui attribute=$node.data_map.description}{/if}</p>
        {*attribute_view_gui attribute=$node.data_map.rating *}
    </div>
</div>
