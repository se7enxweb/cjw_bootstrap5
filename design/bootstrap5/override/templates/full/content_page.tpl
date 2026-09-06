{* Content page - Full view *}

<article class="container py-4">
    <h1 class="mb-2">{$node.data_map.title.content|wash()}</h1>

    {if $node.data_map.level.has_content}
    <p class="mb-3">
        <span class="badge text-bg-secondary">{attribute_view_gui attribute=$node.data_map.level}</span>
    </p>
    {/if}

    <div class="content-body mb-4">
        {attribute_view_gui attribute=$node.data_map.body}
    </div>

    {if or( $node.data_map.author.has_content, $node.data_map.license.has_content )}
    <div class="card bg-body-tertiary">
        <div class="card-body small text-body-secondary">
            {if $node.data_map.author.has_content}
            <p class="mb-1">{'Author:'|i18n('design/bootstrap5/full/content_page')} {attribute_view_gui attribute=$node.data_map.author}</p>
            {/if}
            {if $node.data_map.license.has_content}
            <p class="mb-1">
                {'License:'|i18n('design/bootstrap5/full/content_page')}
                {if $node.data_map.source_url.has_content}
                <a href="{$node.data_map.source_url.content|wash}" target="_blank" rel="noopener noreferrer">{attribute_view_gui attribute=$node.data_map.license}</a>
                {else}
                {attribute_view_gui attribute=$node.data_map.license}
                {/if}
            </p>
            {/if}
            {if $node.data_map.modification_note.has_content}
            <p class="mb-0 fst-italic">{attribute_view_gui attribute=$node.data_map.modification_note}</p>
            {/if}
        </div>
    </div>
    {/if}
</article>
