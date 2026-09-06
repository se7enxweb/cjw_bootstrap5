{* Chapter - Line view *}
<div class="d-flex align-items-start border-bottom py-2">
    <div class="flex-shrink-0 me-2">
        <i class="bi bi-journal-bookmark fs-4 text-primary"></i>
    </div>
    <div class="flex-grow-1">
        <h6 class="mb-0"><a href={$node.url_alias|ezurl}>{$node.data_map.title.content|wash()}</a></h6>
    </div>
</div>
