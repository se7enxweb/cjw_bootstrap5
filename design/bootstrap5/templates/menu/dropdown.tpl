{* DropDown Menu (Bootstrap 5 navbar-nav / dropdown) : START *}

{def $root_node = fetch( 'content', 'node', hash( 'node_id', $indexpage ) )
     $top_menu_class_filter = ezini( 'MenuContentSettings', 'TopIdentifierList', 'menu.ini' )
     $top_menu_items = fetch( 'content', 'list', hash('parent_node_id', $root_node.node_id,
                                                      'sort_by', $root_node.sort_array,
							      'class_filter_type', 'include', 'class_filter_array', $top_menu_class_filter, 'ignore_visibility', false() ))
     $top_menu_items_count = $top_menu_items|count()
     $level_2_items = 0
     $level_2_items_count = 0
     $level_3_items = 0
     $level_3_items_count = 0
     $top_level_exclude_items = ezini( 'ThemeSettings', 'TopLevelExcludeItems', 'cjw_bootstrap5.ini' )
     $level_2_limit = 7
     $current_node_id = first_set($module_result.node_id, 0 )
     $path_node_ids = array()}
{foreach $module_result.path as $path_node}
  {set $path_node_ids = $path_node_ids|append($path_node.node_id)}
{/foreach}
<ul class="navbar-nav">
{if $top_menu_items_count}
{foreach $top_menu_items as $key => $item}
{set $level_2_items = fetch('content', 'list', hash( 'parent_node_id', $item.node_id, 'sort_by', array( 'priority', false() ), 'class_filter_type', 'include', 'class_filter_array', $top_menu_class_filter, 'limit', $level_2_limit, 'ignore_visibility', false() ))}
{set $level_2_items_count = $level_2_items|count()}
{def $li_active = or( $path_node_ids|contains($item.node_id), $item.node_id|eq($current_node_id) )}

{if eq( $item.class_identifier, 'link')}

<li class="nav-item" id="node_id_{$item.node_id}">
<a
  {if eq( $ui_context, 'browse' )}
href={concat("content/browse/", $item.node_id)|ezurl}
  {else}
href={$item.data_map.location.content|ezurl}
{if and( is_set( $item.data_map.open_in_new_window ), $item.data_map.open_in_new_window.data_int )}
 target="_blank"
{/if}
  {/if}
  {if $pagedata.is_edit}
onclick="return false;"
  {/if}
  title="{$item.data_map.location.data_text|wash}"
  class="nav-link{if $li_active} active{/if}"
  rel={$item.url_alias|ezurl}>
{if $item.data_map.location.data_text}{$item.data_map.location.data_text|wash()}{else}{$item.name|wash()}{/if}</a>
  </li>
{else}
{if or( $level_2_items_count|eq(0), $top_level_exclude_items|contains( $item.node_id ) )}
<li class="nav-item">
  <a role="button" href={if eq( $ui_context, 'browse' )}{concat("content/browse/", $item.node_id)|ezurl}{else}{$item.url_alias|ezurl}{/if}
 class="nav-link{if $li_active} active{/if}"
 {if $pagedata.is_edit}
  onclick="return false;"
 {/if}>{$item.name|wash()}</a>
</li>
{else}
<li class="nav-item dropdown" id="node_id_{$item.node_id}">
  <a href={$item.url_alias|ezurl} class="nav-link dropdown-toggle{if $li_active} active{/if}" role="button" data-bs-toggle="dropdown" aria-expanded="false">{$item.name|wash()}</a>

  <ul class="dropdown-menu">

{foreach $level_2_items as $key => $item}
 {set $level_3_items = fetch('content', 'list', hash( 'parent_node_id', $item.node_id, 'sort_by', array( 'priority', false() ), 'class_filter_type', 'include', 'class_filter_array', $top_menu_class_filter, 'limit', $level_2_limit, 'ignore_visibility', false() ))}
 {set $level_3_items_count = $level_3_items|count()}
 {def $li2_active = or( $path_node_ids|contains($item.node_id), $item.node_id|eq($current_node_id) )}
{if eq( $item.class_identifier, 'link')}
<li id="node_id_{$item.node_id}">
<a
{if eq( $ui_context, 'browse' )} href={concat("content/browse/", $item.node_id)|ezurl}{else} href={$item.data_map.location.content|ezurl}
{if and( is_set( $item.data_map.open_in_new_window ), $item.data_map.open_in_new_window.data_int )} target="_blank" {/if}
{/if}
{if $pagedata.is_edit} onclick="return false;" {/if}
title="{$item.data_map.location.data_text|wash}"
role="button"
class="dropdown-item{if $li2_active} active{/if}"
rel={$item.url_alias|ezurl}>{if $item.data_map.location.data_text}{$item.data_map.location.data_text|wash()}{else}{$item.name|wash()}{/if}</a>
  </li>
{else}
{if $level_3_items_count|eq(0)}
<li>
<a
href={if eq( $ui_context, 'browse' )}{concat("content/browse/", $item.node_id)|ezurl}{else}{$item.url_alias|ezurl}{/if}
class="dropdown-item{if $li2_active} active{/if}"
{if $pagedata.is_edit} onclick="return false;"{/if}>{$item.name|wash()}</a>
</li>
{else}
<li class="dropdown-submenu" id="node_id_{$item.node_id}">
  <a href={$item.url_alias|ezurl} class="dropdown-item dropdown-toggle{if $li2_active} active{/if}" role="button" data-bs-toggle="dropdown" aria-expanded="false">{$item.name|wash()}</a>
  <ul class="dropdown-menu">
{foreach $level_3_items as $key => $item}
 {def $li3_active = or( $path_node_ids|contains($item.node_id), $item.node_id|eq($current_node_id) )}
{if eq( $item.class_identifier, 'link')}
<li id="node_id_{$item.node_id}">
<a
{if eq( $ui_context, 'browse' )} href={concat("content/browse/", $item.node_id)|ezurl}{else} href={$item.data_map.location.content|ezurl}
{if and( is_set( $item.data_map.open_in_new_window ), $item.data_map.open_in_new_window.data_int )} target="_blank" {/if}
{/if}
{if $pagedata.is_edit} onclick="return false;" {/if}
title="{$item.data_map.location.data_text|wash}"
role="button"
class="dropdown-item{if $li3_active} active{/if}"
rel={$item.url_alias|ezurl}>{if $item.data_map.location.data_text}{$item.data_map.location.data_text|wash()}{else}{$item.name|wash()}{/if}</a>
  </li>
{else}
<li>
<a
href={if eq( $ui_context, 'browse' )}{concat("content/browse/", $item.node_id)|ezurl}{else}{$item.url_alias|ezurl}{/if}
class="dropdown-item{if $li3_active} active{/if}"
{if $pagedata.is_edit} onclick="return false;"{/if}>{$item.name|wash()}</a>
</li>
 {/if}
{/foreach}
  </ul>
</li>
{/if}
{/if}
{/foreach}
  </ul>
</li>
 {/if}
{/if}
{/foreach}
  {/if}
 </ul>

{undef $level_2_items $level_2_items_count $level_3_items $level_3_items_count $root_node $top_menu_items $top_menu_items_count $current_node_id $path_node_ids}

{* DropDown Menu : END *}
