{* Multi calendar - Line view *}
<div class="d-flex align-items-start border-bottom py-2">
    <div class="flex-grow-1">
        <h6 class="mb-1"><a href={$node.url_alias|ezurl}>{$node.name|wash()}</a></h6>
        {if $node.data_map.description.has_content}
        <div class="mb-0 text-body-secondary small">
            {attribute_view_gui attribute=$node.data_map.description}
        </div>
        {/if}
    </div>
</div>
