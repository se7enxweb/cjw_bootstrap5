{* File - Full view *}

<article class="container py-4">
    <h1 class="mb-3">{$node.data_map.name.content|wash()}</h1>

    {if $node.data_map.description.has_content}
    <div class="content-body mb-3">
        {attribute_view_gui attribute=$node.data_map.description}
    </div>
    {/if}

    <p class="mb-3">
        {attribute_view_gui attribute=$node.data_map.file}
    </p>

    {if $node.data_map.tags.has_content}
    <p class="mb-3">
        {foreach $node.data_map.tags.content.keywords as $keyword}
        <span class="badge text-bg-secondary me-1">{$keyword|wash}</span>
        {/foreach}
    </p>
    {/if}

    {if or( $node.data_map.author.has_content, $node.data_map.license.has_content )}
    <div class="card bg-body-tertiary">
        <div class="card-body small text-body-secondary">
            {if $node.data_map.author.has_content}
            <p class="mb-1">{'Author:'|i18n('design/bootstrap5/full/file')} {attribute_view_gui attribute=$node.data_map.author}</p>
            {/if}
            {if $node.data_map.license.has_content}
            <p class="mb-0">
                {'License:'|i18n('design/bootstrap5/full/file')}
                {if $node.data_map.source_url.has_content}
                <a href="{$node.data_map.source_url.content|wash}" target="_blank" rel="noopener noreferrer">{attribute_view_gui attribute=$node.data_map.license}</a>
                {else}
                {attribute_view_gui attribute=$node.data_map.license}
                {/if}
            </p>
            {/if}
        </div>
    </div>
    {/if}
</article>
