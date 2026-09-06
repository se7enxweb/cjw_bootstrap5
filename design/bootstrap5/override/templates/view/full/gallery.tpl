<h1 class="mb-3">{$node.name|wash()}</h1>
{def $children=fetch( content , list , hash( parent_node_id , $node.node_id ,
                                             class_filter_type , 'include' ,
                                             class_filter_array , array( 'image', 'video' ),
                                             sort_by, array( array( 'priority' , true() ), array( 'published' , true() ) ) ))}
<div id="myGallery{$node.node_id}" class="row g-3">
    {foreach $children as $image_node}
        <div class="col-6 col-md-4 col-lg-3">
        {node_view_gui content_node=$image_node view='image_gallery' width="320" height="240"}
        </div>
    {/foreach}
</div>
