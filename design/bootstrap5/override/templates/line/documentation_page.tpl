{* Documentation page - list view. The title lives in the title field,
   not in the node name. *}
<div class="d-flex align-items-start border-bottom py-2">
    <div class="flex-grow-1">
        <h6 class="mb-0"><a href={$node.url_alias|ezurl}>{attribute_view_gui attribute=$node.object.data_map.title}</a></h6>
    </div>
</div>
