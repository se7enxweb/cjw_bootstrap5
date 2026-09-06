<div class="card h-100">
    <a href={$node.data_map.image.content.large.full_path|ezroot} title="{if $node.data_map.caption.has_content}{$node.data_map.caption.content.output.output_text}{/if}">
        <img src={$node.data_map.image.content.large.full_path|ezroot} class="card-img-top" style="width:100%;height:200px;object-fit:cover;" alt="{$node.data_map.image.content.alternative_text|wash()}" />
    </a>
    <div class="card-body">
        <h6 class="card-title text-truncate">
            <a href={$node.url_alias|ezurl} title="{$node.name|wash()}">
                {$node.name|wash()}
            </a>
        </h6>
        {if $node.data_map.caption.has_content}
        <p class="card-text small text-body-secondary">{$node.data_map.caption.content.output.output_text}</p>
        {/if}
        {attribute_view_gui attribute=$node.data_map.rating}
    </div>
</div>
