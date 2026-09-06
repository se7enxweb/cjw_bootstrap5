{* Gallery - Full view *}

<article class="container py-4">

    <h1 class="mb-3">{$node.name|wash()}</h1>

    {section show=$node.data_map.image.content}
        <div class="mb-3">
            {attribute_view_gui alignment=right image_class=medium attribute=$node.data_map.image.content.data_map.image}
        </div>
    {/section}

    <p class="lead">
       {attribute_view_gui attribute=$node.data_map.short_description}
    </p>

    <div class="content-body mb-3">
       {attribute_view_gui attribute=$node.data_map.description}
    </div>

    {let page_limit=20
         children=fetch_alias( children, hash( parent_node_id, $node.node_id,
                                               offset, $view_parameters.offset,
                                               limit, $page_limit,
                                               sort_by, $node.sort_array ) )
         list_count=fetch_alias( children_count, hash( parent_node_id, $node.node_id ) )}

    {section show=$children}
        <p class="mb-3">
            <a href={$children[0].url_alias|ezurl}>{'View as slideshow'|i18n( 'design/base' )}</a>
        </p>

       <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-4">
           {section var=child loop=$children}
               <div class="col">
                  <a href={$child.item.url_alias|ezurl} class="card h-100 text-decoration-none">
                  {if eq( $child.item.class_identifier, 'video' )}
                      {attribute_view_gui attribute=$child.item.data_map.file}
                  {else}
                      {attribute_view_gui image_class=medium attribute=$child.item.data_map.image}
                  {/if}
                  <div class="card-body p-2">
                      <p class="card-text small text-body-secondary mb-0">{$child.item.name|wash}</p>
                  </div>
                  </a>
               </div>
           {/section}
       </div>
    {/section}

    {include name=navigator
             uri='design:navigator/google.tpl'
             page_uri=concat( '/content/view', '/full/', $node.node_id )
             item_count=$list_count
             view_parameters=$view_parameters
             item_limit=$page_limit}
    {/let}

</article>
