{* Documentation page — title, optional table of contents, text,
   date line and optionally the subpages. *}

<article class="content-view-full class-documentation-page">

  <header class="mb-3">
    <h1>{attribute_view_gui attribute=$node.object.data_map.title}</h1>
  </header>

  {if eztoc( $node.object.data_map.body )}
    <nav class="card mb-4">
      <div class="card-body">
        <h2 class="h6 card-title">{'Table of contents'|i18n( 'design/bootstrap5/full/documentation_page' )}</h2>
        {eztoc( $node.object.data_map.body )}
      </div>
    </nav>
  {/if}

  <div class="attribute-body">
    {attribute_view_gui attribute=$node.object.data_map.body}
  </div>

  <p class="text-body-secondary small mt-4 mb-0">
    {'Created:'|i18n( 'design/bootstrap5/full/documentation_page' )} {$node.object.published|l10n( shortdatetime )}
    &middot;
    {'Modified:'|i18n( 'design/bootstrap5/full/documentation_page' )} {$node.object.modified|l10n( shortdatetime )}
  </p>

  {if $node.object.data_map.show_children.data_int}
    {def $page_limit = 10
         $exclude = ezini( 'MenuContentSettings', 'ExtraIdentifierList', 'menu.ini' )
         $children_count = ''}
    {set $children_count = fetch_alias( 'children_count', hash( parent_node_id, $node.node_id,
                                                                class_filter_type, exclude,
                                                                class_filter_array, $exclude ) )}

    <div class="content-view-children mt-4">
      {if $children_count}
        {foreach fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,
                                                'offset', $view_parameters.offset,
                                                'sort_by', $node.sort_array,
                                                'class_filter_type', exclude,
                                                'class_filter_array', $exclude,
                                                'limit', $page_limit ) ) as $child}
          {node_view_gui view='line' content_node=$child}
        {/foreach}
      {/if}
    </div>

    {include name=navigator
             uri='design:navigator/google.tpl'
             page_uri=$node.url_alias
             item_count=$children_count
             view_parameters=$view_parameters
             item_limit=$page_limit}
    {undef $page_limit $exclude $children_count}
  {/if}

</article>
