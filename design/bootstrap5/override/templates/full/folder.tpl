{* Folder - Full view *}

<article class="container py-4">

    <h1 class="mb-3">{attribute_view_gui attribute=$node.data_map.name}</h1>

    {if eq( ezini( 'folder', 'SummaryInFullView', 'content.ini' ), 'enabled' )}
        {if $node.object.data_map.short_description.has_content}
            <p class="lead">
                {attribute_view_gui attribute=$node.data_map.short_description}
            </p>
        {/if}
    {/if}

    {if $node.object.data_map.description.has_content}
        <div class="content-body mb-3">
            {attribute_view_gui attribute=$node.data_map.description}
        </div>
    {/if}

    {if $node.object.data_map.show_children.data_int}
        {def $page_limit = 20
             $classes = array( 'infobox' )
             $children = array()
             $children_count = ''}

        {if le( $node.depth, '3')}
            {set $classes=array( 'infobox' )}
        {/if}

        {set $children=fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,
                                                      'offset', $view_parameters.offset,
                                                      'sort_by', $node.sort_array,
                                                      'class_filter_type', 'exclude',
                                                      'class_filter_array', $classes,
                                                      'limit', $page_limit ) )
             $children_count=fetch_alias( 'children_count', hash( 'parent_node_id', $node.node_id,
                                                                  'class_filter_type', 'exclude',
                                                                  'class_filter_array', $classes ) )}

        <div class="row row-cols-1 row-cols-md-3 g-4">
            {foreach $children as $child }
                <div class="col">
                    {node_view_gui view='line' content_node=$child}
                </div>
            {/foreach}
        </div>

        {include name=navigator
                 uri='design:navigator/google.tpl'
                 page_uri=$node.url_alias
                 item_count=$children_count
                 view_parameters=$view_parameters
                 item_limit=$page_limit}

    {/if}
</article>
