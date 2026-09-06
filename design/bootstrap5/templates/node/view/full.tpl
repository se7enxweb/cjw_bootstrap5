{* Generic full view — the fallback for every class without its own
   full/<class>.tpl (e.g. handbuchepub). Shows all attributes that are not
   already in the class name pattern, and evaluates the optional control
   fields enable_comments / show_children / enable_tipafriend.

   Compared to the ezwebin template, the border-box nesting
   (six divs for rounded corners) is dropped — .card does that here. *}

<article class="content-view-full class-{$node.object.class_identifier}">

  <header class="mb-3">
    <h1>{$node.name|wash()}</h1>
  </header>

  {def $name_pattern = $node.object.content_class.contentobject_name|explode('>')|implode(',')
       $name_pattern_array = array( 'enable_comments', 'enable_tipafriend', 'show_children', 'show_children_exclude', 'show_children_pr_page' )}
  {set $name_pattern = $name_pattern|explode('|')|implode(',')}
  {set $name_pattern = $name_pattern|explode('<')|implode(',')}
  {set $name_pattern = $name_pattern|explode(',')}
  {foreach $name_pattern as $name_pattern_string}
      {set $name_pattern_array = $name_pattern_array|append( $name_pattern_string|trim() )}
  {/foreach}

  {foreach $node.object.contentobject_attributes as $attribute}
    {if $name_pattern_array|contains( $attribute.contentclass_attribute_identifier )|not()}
      <div class="attribute-{$attribute.contentclass_attribute_identifier} mb-3">
        {attribute_view_gui attribute=$attribute}
      </div>
    {/if}
  {/foreach}

  {if $node.object.content_class.is_container}

    {if and( is_unset( $versionview_mode ), is_set( $node.data_map.enable_comments ), $node.data_map.enable_comments.data_int )}
      <section class="mt-4">
        <h2 class="h4">{'Comments'|i18n( 'design/bootstrap5/full/generic' )}</h2>
        <div class="content-view-children">
          {foreach fetch_alias( comments, hash( parent_node_id, $node.node_id ) ) as $comment}
            {node_view_gui view='line' content_node=$comment}
          {/foreach}
        </div>

        {if fetch( 'content', 'access', hash( 'access', 'create', 'contentobject', $node, 'contentclass_id', 'comment' ) )}
          <form method="post" action={"content/action"|ezurl}>
            <input type="hidden" name="ClassIdentifier" value="comment">
            <input type="hidden" name="NodeID" value="{$node.object.main_node.node_id}">
            <input type="hidden" name="ContentLanguageCode" value="{ezini( 'RegionalSettings', 'ContentObjectLocale', 'site.ini' )}">
            <button class="btn btn-primary" type="submit" name="NewButton">{'New comment'|i18n( 'design/bootstrap5/full/generic' )}</button>
          </form>
        {else}
          {if ezmodule( 'user/register' )}
            <p>{'%login_link_startLog in%login_link_end or %create_link_startcreate a user account%create_link_end to comment.'|i18n( 'design/bootstrap5/full/generic', , hash( '%login_link_start', concat( '<a href="', '/user/login'|ezurl( no ), '">' ), '%login_link_end', '</a>', '%create_link_start', concat( '<a href="', '/user/register'|ezurl( no ), '">' ), '%create_link_end', '</a>' ) )}</p>
          {else}
            <p>{'%login_link_startLog in%login_link_end to comment.'|i18n( 'design/bootstrap5/full/generic', , hash( '%login_link_start', concat( '<a href="', '/user/login'|ezurl( no ), '">' ), '%login_link_end', '</a>' ) )}</p>
          {/if}
        {/if}
      </section>

    {elseif and( is_set( $node.data_map.show_children ), $node.data_map.show_children.data_int )}
      {def $page_limit = first_set( $node.data_map.show_children_pr_page.data_int, 10 )
           $classes = ezini( 'MenuContentSettings', 'ExtraIdentifierList', 'menu.ini' )
           $children_count = ''}
      {if is_set( $node.data_map.show_children_exclude )}
        {set $classes = $node.data_map.show_children_exclude.content|explode(',')}
      {/if}

      {set $children_count = fetch_alias( 'children_count', hash( 'parent_node_id', $node.node_id,
                                                                  'class_filter_type', 'exclude',
                                                                  'class_filter_array', $classes ) )}

      <div class="content-view-children mt-4">
        {if $children_count}
          {foreach fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,
                                                  'offset', $view_parameters.offset,
                                                  'sort_by', $node.sort_array,
                                                  'class_filter_type', 'exclude',
                                                  'class_filter_array', $classes,
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
    {/if}
  {/if}

  {if and( is_unset( $versionview_mode ), is_set( $node.data_map.enable_tipafriend ), $node.data_map.enable_tipafriend.data_int )}
    {def $tipafriend_access = fetch( 'user', 'has_access_to', hash( 'module', 'content', 'function', 'tipafriend' ) )}
    {if and( ezmodule( 'content/tipafriend' ), $tipafriend_access )}
      <p class="mt-3">
        <a href={concat( '/content/tipafriend/', $node.node_id )|ezurl}>{'Tip a friend'|i18n( 'design/bootstrap5/full/generic' )}</a>
      </p>
    {/if}
    {undef $tipafriend_access}
  {/if}

</article>
