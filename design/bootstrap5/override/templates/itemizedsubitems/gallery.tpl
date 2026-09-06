{* Gallery as a frontpage block: the first images as thumbnails.
   Unlike ezwebin (a plain text list) the block shows the images here —
   for a gallery that is the point. *}
<div class="content-view-embed class-gallery card mb-4">
  <div class="card-header">
    <h2 class="h5 mb-0"><a class="link-body-emphasis text-decoration-none" href={$object.main_node.url_alias|ezurl}>{$object.name|wash()}</a></h2>
  </div>

  {def $limit  = first_set( $object_parameters.limit, 5 )
       $offset = first_set( $object_parameters.offset, 0 )
       $children = array()}

  {set $children = fetch( content, list, hash( 'parent_node_id', $object.main_node_id,
                                               'limit', $limit,
                                               'offset', $offset,
                                               'class_filter_type', 'include',
                                               'class_filter_array', array( 'image' ),
                                               'sort_by', $object.main_node.sort_array ) )}

  {if $children|count()}
    <div class="card-body">
      <div class="row row-cols-2 row-cols-sm-3 row-cols-md-5 g-2">
      {foreach $children as $child}
        <div class="col">
          <a href={$child.url_alias|ezurl} title="{$child.name|wash()}">
            {attribute_view_gui attribute=$child.data_map.image image_class=small}
          </a>
        </div>
      {/foreach}
      </div>
    </div>
  {else}
    <div class="card-body text-body-secondary">{'No images.'|i18n( 'design/bootstrap5/itemizedsubitems' )}</div>
  {/if}

  {undef $limit $offset $children}
</div>
