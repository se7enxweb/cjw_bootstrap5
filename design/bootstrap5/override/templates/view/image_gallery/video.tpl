{def $current_node_id=first_set($module_result.node_id, 0)}
<div class="card h-100">
    <div class="card-body">
        <h6 class="card-title text-truncate">
            <a href={$node.url_alias|ezurl} title="{$node.name|wash()}">
                {$node.name|wash()}
            </a>
        </h6>
    {if $node.node_id|eq( $current_node_id )}
        <div class="ratio ratio-16x9 col-md-8">
            {attribute_view_gui attribute=$node.data_map.file width="620" height="440"}
        </div>
    {else}
        <div class="ratio ratio-16x9 col-md-4">
            {attribute_view_gui attribute=$node.data_map.file width="240" height="240"}
        </div>
    {/if}
        {if $node.data_map.description.has_content}
        <p class="card-text small text-body-secondary mt-2">{attribute_view_gui attribute=$node.data_map.description}</p>
        {/if}
        {attribute_view_gui attribute=$node.data_map.rating}
    </div>
</div>
