{* File - Line view *}
<div class="d-flex align-items-start border-bottom py-2">
    <div class="flex-shrink-0 me-2">
        <i class="bi bi-file-earmark-arrow-down fs-4 text-primary"></i>
    </div>
    <div class="flex-grow-1">
        <h6 class="mb-1"><a href={$node.url_alias|ezurl}>{$node.data_map.name.content|wash()}</a></h6>
        {if $node.data_map.author.has_content}
        <p class="mb-0 text-body-secondary small">{attribute_view_gui attribute=$node.data_map.author}</p>
        {/if}
    </div>
</div>
