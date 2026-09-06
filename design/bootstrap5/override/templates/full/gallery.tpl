{* Gallery - Full view (simple) *}

{def $children=fetch( content , list , hash( parent_node_id , $node.node_id ,
                                             class_filter_type , 'include' ,
                                             class_filter_array , array( 'image', 'video' ),
                                             sort_by, array( array( 'priority' , true() ), array( 'published' , true() ) ) ))}

<article class="container py-4">
    <h1 class="mb-3">{$node.name|wash()}</h1>

    <div id="myGallery{$node.node_id}" class="myGallery row row-cols-2 row-cols-sm-3 row-cols-md-4 g-3">
        {foreach $children as $image_node}
            <div class="col">
                <a href={$image_node.url_alias|ezurl} class="card h-100 text-decoration-none">
                {if eq( $image_node.class_identifier, 'video' )}
                    {attribute_view_gui attribute=$image_node.data_map.file}
                {else}
                    {attribute_view_gui image_class=medium attribute=$image_node.data_map.image}
                {/if}
                <div class="card-body p-2">
                    <p class="card-text small text-body-secondary mb-0">{$image_node.name|wash}</p>
                </div>
                </a>
            </div>
        {/foreach}
    </div>
</article>
