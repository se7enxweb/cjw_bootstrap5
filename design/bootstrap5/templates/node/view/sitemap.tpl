{def $page_limit=30
     $col_count=2
     $sub_children=0
     $child_url_alias=''
     $children=fetch('content','list',hash('parent_node_id', $node.node_id,
                                           'limit', $page_limit,
                                           'offset', $view_parameters.offset,
                                           'sort_by', $node.sort_array,
					   'class_filter_type',  'exclude',
                                           'class_filter_array', array( 'comment' )
					 )
			)}
<div class="container py-4">

<h1 class="mb-3">{"Sitemap"|i18n("design/bootstrap5/view/sitemap")}{* $node.name|wash *}</h1>

<ul class="list-unstyled ps-3">
{foreach $children as $key => $child}
{set $child_url_alias=$child.url_alias}
{if $child.class_identifier|eq( 'link' )}
  {set $child_url_alias=$child.data_map.location.content}
{/if}
<li>
<h2><a href={$child_url_alias|ezurl}>{$child.name}</a></h2>
    {* if ne( $child.node_id, 180 ) *}
    {* if $child.class_identifier|eq( 'event_calendar' )}
        {set $sub_children=fetch('content','list',hash( 'parent_node_id', $child.node_id,
                                                        'limit', $page_limit,
                                                        'sort_by', array( 'attribute', false(), 'event/from_time' ),
							'class_filter_type',  'exclude',
							'class_filter_array', array( 'link', 'comment' )
							)
				 )}
    {else *}
        {set $sub_children=fetch('content','list',hash( 'parent_node_id', $child.node_id,
                                                        'limit', $page_limit,
                                                        'sort_by', $child.sort_array))}
    {* /if *}
    <ul class="list-unstyled ps-3">
    {foreach $sub_children as $sub_child}
    <li><a href={$sub_child.url_alias|ezurl}>{$sub_child.name}</a></li>
    {/foreach}
    </ul>
    {* /if *}
</li>
{/foreach}
</ul>

</div>
