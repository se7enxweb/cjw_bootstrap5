{* Multi calendar — one table of upcoming events per linked calendar. *}
{set-block scope=root variable=cache_ttl}900{/set-block}

<article class="content-view-full class-multicalendar">

  <header class="mb-3">
    <h1>{$node.name|wash()}</h1>
  </header>

  {if $node.data_map.description.has_content}
    <div class="attribute-short mb-4">
      {attribute_view_gui attribute=$node.data_map.description}
    </div>
  {/if}

  {foreach $node.data_map.calendars.content.relation_list as $relation}
    {def $related_node = fetch( 'content', 'node', hash( 'node_id', $relation.node_id ) )
         $related_node_children = fetch( 'content', 'list', hash( 'parent_node_id', $relation.node_id,
                                                                  'limit', 5,
                                                                  'class_filter_type', 'include',
                                                                  'class_filter_array', array( 'event' ),
                                                                  'sort_by', array( 'attribute', true(), 'event/from_time' ) ) )}
    <section class="mb-4">
      <h2 class="h5"><a href="{$related_node.url_alias|ezurl( no )}">{$related_node.name|wash()}</a></h2>

      {if $related_node_children|count()}
        <div class="table-responsive">
          <table class="table table-striped align-middle">
            <thead>
              <tr>
                <th scope="col">{'Event'|i18n( 'design/bootstrap5/full/multicalendar' )}</th>
                <th scope="col">{'Start date'|i18n( 'design/bootstrap5/full/multicalendar' )}</th>
                <th scope="col">{'Category'|i18n( 'design/bootstrap5/full/multicalendar' )}</th>
                <th scope="col">{'Description'|i18n( 'design/bootstrap5/full/multicalendar' )}</th>
              </tr>
            </thead>
            <tbody>
            {foreach $related_node_children as $child}
              <tr>
                <td><a href="{$child.url_alias|ezurl( no )}">{$child.name|wash()}</a></td>
                <td>{attribute_view_gui attribute=$child.data_map.from_time}</td>
                <td>{attribute_view_gui attribute=$child.data_map.category}</td>
                <td>{attribute_view_gui attribute=$child.data_map.text}</td>
              </tr>
            {/foreach}
            </tbody>
          </table>
        </div>
      {else}
        <p class="text-body-secondary">{'No upcoming events.'|i18n( 'design/bootstrap5/full/multicalendar' )}</p>
      {/if}
    </section>
    {undef $related_node $related_node_children}
  {/foreach}

</article>
