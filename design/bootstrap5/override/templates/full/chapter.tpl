{* Chapter - Full view *}

{def $items=fetch( 'content', 'list', hash( 'parent_node_id', $node.node_id,
                                            'sort_by', $node.sort_array ) )}

<article class="container py-4">
    <h1 class="mb-3">{$node.data_map.title.content|wash()}</h1>

    {if $items|count}
    <div class="row row-cols-1 row-cols-md-2 g-2">
        {foreach $items as $item}
        <div class="col">
            {node_view_gui view=line content_node=$item}
        </div>
        {/foreach}
    </div>
    {else}
    <p class="text-body-secondary">{'This chapter has no content yet.'|i18n('design/bootstrap5/full/chapter')}</p>
    {/if}
</article>
