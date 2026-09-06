{set-block scope=root variable=cache_ttl}0{/set-block}

<div>
	{def $children = array()
	     $limit = 5
	     $offset = 0}

	{if is_set( $object_parameters.limit )}
		{set $limit = $object_parameters.limit}
	{/if}

	{if is_set( $object_parameters.offset )}
		{set $offset = $object_parameters.offset}
	{/if}

    {set $children=fetch( 'content', 'list', hash( 'parent_node_id', $object.main_node_id,
												   'limit', $limit,
												   'offset', $offset,
												   'class_filter_type', 'exclude',
												   'class_filter_array', array( 'infobox' ),
												   'sort_by', $object.main_node.sort_array ) )|shuffle }

    <h2><a href={$object.main_node.url_alias|ezurl()}>{$object.name|wash()}</a></h2>

    <div class="row g-3">
        <div class="col">
            <div class="card h-100">
                <div class="card-body">
                    {if is_set( $children.0 )}
                    {node_view_gui view=line content_node=$children.0}
                    {/if}
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card h-100">
                <div class="card-body">
                    {if is_set( $children.1 )}
                    {node_view_gui view=line content_node=$children.1}
                    {/if}
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card h-100">
                <div class="card-body">
                    {if is_set( $children.2 )}
                    {node_view_gui view=line content_node=$children.2}
                    {/if}
                </div>
            </div>
        </div>
    </div>

</div>
