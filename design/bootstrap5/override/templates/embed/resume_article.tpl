<div class="card mb-3">
    <div class="card-body">
    <h5 class="card-title"><a href={$object.main_node.url_alias|ezurl}>{$object.data_map.title.content|wash}</a></h5>
    {if $object.data_map.image.has_content}
        <div class="mb-2">
            {attribute_view_gui image_class=articlethumbnail attribute=$object.data_map.image}
        </div>
    {/if}
    {if $object.data_map.intro.content.is_empty|not}
    <p class="card-text text-body-secondary">
        {attribute_view_gui attribute=$object.data_map.intro}
    </p>
    {/if}
    {attribute_view_gui attribute=$object.data_map.body}
    </div>
</div>
