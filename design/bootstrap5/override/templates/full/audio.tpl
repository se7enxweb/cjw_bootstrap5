{* Audio - Full view *}

<article class="container py-4">
    <h1 class="mb-3">{$node.name|wash()}</h1>

    <figure class="mb-3">
        {attribute_view_gui attribute=$node.data_map.file width="620" height="440"}
        <figcaption class="text-body-secondary small mt-2">{if $node.data_map.description.has_content}{attribute_view_gui attribute=$node.data_map.description}{/if}</figcaption>
    </figure>
        {* attribute_view_gui attribute=$node.data_map.rating *}
</article>
