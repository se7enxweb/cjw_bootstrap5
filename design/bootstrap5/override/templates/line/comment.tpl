{* Comment - Line view *}

<div class="d-flex align-items-start border-bottom py-2">
    <div class="flex-shrink-0 me-2">
        <i class="bi bi-chat"></i>
    </div>
    <div class="flex-grow-1">
        <h6 class="mb-1">{$node.name|wash}</h6>

        <p class="mb-1 text-body-secondary small">
            <span class="date">{$node.object.published|l10n(datetime)}</span>
            <span class="author">{$node.data_map.author.content|wash}</span>
        </p>

        <p class="mb-0">{$node.data_map.message.content|wash(xhtml)|break}</p>
    </div>
</div>
