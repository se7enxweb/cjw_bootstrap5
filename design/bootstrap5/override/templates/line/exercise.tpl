{* Exercise - Line view *}
<div class="d-flex align-items-start border-bottom py-2">
    <div class="flex-shrink-0 me-2">
        <i class="bi bi-pencil-square fs-4 text-primary"></i>
    </div>
    <div class="flex-grow-1">
        <h6 class="mb-1"><a href={$node.url_alias|ezurl}>{$node.data_map.title.content|wash()}</a></h6>
        {if $node.data_map.level.has_content}<span class="badge text-bg-secondary me-1">{attribute_view_gui attribute=$node.data_map.level}</span>{/if}
        {if $node.data_map.difficulty.has_content}<span class="badge text-bg-info">{'Difficulty:'|i18n('design/bootstrap5/line/exercise')} {attribute_view_gui attribute=$node.data_map.difficulty}</span>{/if}
    </div>
</div>
