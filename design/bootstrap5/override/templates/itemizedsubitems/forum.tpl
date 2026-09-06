{* Forum as a frontpage block: the most recently active topics. *}
<div class="content-view-embed class-forum card mb-4">
  <div class="card-header">
    <h2 class="h5 mb-0"><a class="link-body-emphasis text-decoration-none" href={$object.main_node.url_alias|ezurl}>{$object.name|wash()}</a></h2>
  </div>

  {def $limit  = first_set( $object_parameters.limit, 5 )
       $offset = first_set( $object_parameters.offset, 0 )
       $children = array()}

  {set $children = fetch( 'content', 'list', hash( 'parent_node_id', $object.main_node_id,
                                                   'limit', $limit,
                                                   'offset', $offset,
                                                   'sort_by', array( array( 'modified_subnode', false() ), array( 'node_id', false() ) ) ) )}

  {if $children|count()}
    <ul class="list-group list-group-flush">
    {foreach $children as $child}
      <li class="list-group-item">
        <a href={$child.url_alias|ezurl}>{$child.name|wash()}</a>
        <div class="small text-body-secondary">
          {$child.object.published|l10n( shortdatetime )} &middot; {$child.object.owner.name|wash}
        </div>
      </li>
    {/foreach}
    </ul>
  {else}
    <div class="card-body text-body-secondary">{'No topics yet.'|i18n( 'design/bootstrap5/itemizedsubitems' )}</div>
  {/if}

  {undef $limit $offset $children}
</div>
