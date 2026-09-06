{* OER image - Full view *}

<article class="container py-4">
    <h1 class="mb-3">{$node.data_map.name.content|wash()}</h1>

    <figure class="figure">
        {attribute_view_gui image_class=large attribute=$node.data_map.image}
        <figcaption class="figure-caption">
            {if $node.data_map.description.has_content}
            <p class="mb-1">{attribute_view_gui attribute=$node.data_map.description}</p>
            {/if}
            {'Source:'|i18n('design/bootstrap5/full/oer_image')}
            {attribute_view_gui attribute=$node.data_map.author}
            &middot;
            {if $node.data_map.source_url.has_content}
            <a href="{$node.data_map.source_url.content|wash}" target="_blank" rel="noopener noreferrer">{attribute_view_gui attribute=$node.data_map.license}</a>
            {else}
            {attribute_view_gui attribute=$node.data_map.license}
            {/if}
        </figcaption>
    </figure>
</article>
