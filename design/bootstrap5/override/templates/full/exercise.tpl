{* Exercise - Full view *}

<article class="container py-4">
    <h1 class="mb-2">{$node.data_map.title.content|wash()}</h1>

    <p class="mb-3">
        {if $node.data_map.type.has_content}<span class="badge text-bg-secondary me-1">{attribute_view_gui attribute=$node.data_map.type}</span>{/if}
        {if $node.data_map.level.has_content}<span class="badge text-bg-secondary me-1">{attribute_view_gui attribute=$node.data_map.level}</span>{/if}
        {if $node.data_map.difficulty.has_content}<span class="badge text-bg-info me-1">{'Difficulty:'|i18n('design/bootstrap5/full/exercise')} {attribute_view_gui attribute=$node.data_map.difficulty}</span>{/if}
        {if $node.data_map.auto_gradable.content}<span class="badge text-bg-success"><i class="bi bi-check-circle"></i> {'Auto-graded'|i18n('design/bootstrap5/full/exercise')}</span>{/if}
    </p>

    <div class="content-body mb-3">
        {attribute_view_gui attribute=$node.data_map.question}
    </div>

    {if $node.data_map.instruction.has_content}
    <div class="alert alert-info">
        {attribute_view_gui attribute=$node.data_map.instruction}
    </div>
    {/if}

    {if $node.data_map.options.has_content}
    <div class="card mb-3">
        <div class="card-header">{'Answer options'|i18n('design/bootstrap5/full/exercise')}</div>
        <div class="card-body">
            {attribute_view_gui attribute=$node.data_map.options}
        </div>
    </div>
    {/if}

    {if $node.data_map.hint.has_content}
    <p class="mb-3">
        <button type="button" class="btn btn-outline-secondary btn-sm" data-bs-toggle="collapse" data-bs-target="#hint-{$node.node_id}">
            <i class="bi bi-lightbulb"></i> {'Show hint'|i18n('design/bootstrap5/full/exercise')}
        </button>
        <span id="hint-{$node.node_id}" class="collapse d-block mt-2">
            <div class="content-body">{attribute_view_gui attribute=$node.data_map.hint}</div>
        </span>
    </p>
    {/if}

    {if $node.data_map.solution.has_content}
    <p class="mb-3">
        <button type="button" class="btn btn-outline-primary btn-sm" data-bs-toggle="collapse" data-bs-target="#solution-{$node.node_id}">
            <i class="bi bi-check2-square"></i> {'Show solution'|i18n('design/bootstrap5/full/exercise')}
        </button>
        <span id="solution-{$node.node_id}" class="collapse d-block mt-2">
            <div class="content-body">{attribute_view_gui attribute=$node.data_map.solution}</div>
        </span>
    </p>
    {/if}

    {if or( $node.data_map.author.has_content, $node.data_map.license.has_content )}
    <div class="card bg-body-tertiary">
        <div class="card-body small text-body-secondary">
            {if $node.data_map.author.has_content}
            <p class="mb-1">{'Author:'|i18n('design/bootstrap5/full/exercise')} {attribute_view_gui attribute=$node.data_map.author}</p>
            {/if}
            {if $node.data_map.license.has_content}
            <p class="mb-0">
                {'License:'|i18n('design/bootstrap5/full/exercise')}
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
