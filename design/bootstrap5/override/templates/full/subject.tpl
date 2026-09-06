{* Subject (Kurs) - Full view *}

{def $chapters=fetch( 'content', 'list', hash( 'parent_node_id', $node.node_id,
                                               'class_filter_type', 'include',
                                               'class_filter_array', array( 'chapter' ),
                                               'sort_by', $node.sort_array ) )}

<article class="container py-4">
    <h1 class="mb-3">{$node.data_map.name.content|wash()}</h1>

    {if $node.data_map.description.has_content}
    <div class="content-body mb-4">
        {attribute_view_gui attribute=$node.data_map.description}
    </div>
    {/if}

    {if $chapters|count}
    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-3">
        {foreach $chapters as $chapter}
        <div class="col">
            <a href={$chapter.url_alias|ezurl} class="card h-100 text-decoration-none">
                <div class="card-body">
                    <h2 class="h5 card-title mb-0">{$chapter.name|wash()}</h2>
                </div>
            </a>
        </div>
        {/foreach}
    </div>
    {else}
    <p class="text-body-secondary">{'No chapters yet.'|i18n('design/bootstrap5/full/subject')}</p>
    {/if}
</article>
