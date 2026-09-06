{* Folder - embedded *}
<div class="content-view-embed class-folder card my-3">
    <div class="card-body">
        <h5 class="card-title mb-1"><a href={$object.main_node.url_alias|ezurl}>{$object.name|wash()}</a></h5>
        <div class="card-text text-body-secondary">
            {attribute_view_gui attribute=$object.main_node.object.data_map.short_description}
        </div>
    </div>
</div>
