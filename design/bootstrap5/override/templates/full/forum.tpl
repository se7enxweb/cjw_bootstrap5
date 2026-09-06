{* Forum — topic overview with reply count, author and last reply.
   The page-number links inside a topic from the ezwebin template were
   dropped: they rebuilt by hand what the navigator already does, and
   the paging limit there was hardwired to 20 instead of using
   $page_limit. Whoever enters a topic keeps paging there. *}

{def $page_limit  = 20
     $topic_count = fetch( 'content', 'list_count', hash( 'parent_node_id', $node.node_id ) )}

<article class="content-view-full class-forum">

  <header class="mb-3">
    <h1>{$node.name|wash}</h1>
  </header>

  <div class="attribute-short mb-3">
    {attribute_view_gui attribute=$node.data_map.description}
  </div>

  {if is_unset( $versionview_mode )}
    {if $node.object.can_create}
      {def $notification_access = fetch( 'user', 'has_access_to', hash( 'module', 'notification', 'function', 'addtonotification' ) )}
      <form class="mb-4 d-flex gap-2" method="post" action={"content/action/"|ezurl}>
        <input type="hidden" name="ContentNodeID" value="{$node.node_id}">
        <input type="hidden" name="ContentObjectID" value="{$node.contentobject_id}">
        <input type="hidden" name="ContentLanguageCode" value="{ezini( 'RegionalSettings', 'ContentObjectLocale', 'site.ini' )}">
        <input type="hidden" name="NodeID" value="{$node.node_id}">
        <input type="hidden" name="ClassIdentifier" value="forum_topic">
        <button class="btn btn-primary" type="submit" name="NewButton">{'New topic'|i18n( 'design/bootstrap5/full/forum' )}</button>
        {if $notification_access}
          <button class="btn btn-outline-secondary" type="submit" name="ActionAddToNotification">{'Keep me updated'|i18n( 'design/bootstrap5/full/forum' )}</button>
        {/if}
      </form>
      {undef $notification_access}
    {else}
      <p>{'You need to be logged in to get access to the forums. You can do so %login_link_start%here%login_link_end%'|i18n( 'design/bootstrap5/full/forum', , hash( '%login_link_start%', concat( '<a href=', '/user/login/'|ezurl, '>' ), '%login_link_end%', '</a>' ) )}</p>
    {/if}
  {/if}

  <div class="content-view-children">
    <div class="table-responsive">
      <table class="table table-striped align-middle">
        <thead>
          <tr>
            <th scope="col">{'Topic'|i18n( 'design/bootstrap5/full/forum' )}</th>
            <th scope="col" class="text-end">{'Replies'|i18n( 'design/bootstrap5/full/forum' )}</th>
            <th scope="col">{'Author'|i18n( 'design/bootstrap5/full/forum' )}</th>
            <th scope="col">{'Last reply'|i18n( 'design/bootstrap5/full/forum' )}</th>
          </tr>
        </thead>
        <tbody>
        {if $topic_count}
          {foreach fetch( 'content', 'list', hash( 'parent_node_id', $node.node_id,
                                                   'limit', $page_limit,
                                                   'offset', $view_parameters.offset,
                                                   'sort_by', array( array( attribute, false(), 'forum_topic/sticky' ),
                                                                     array( 'modified_subnode', false() ),
                                                                     array( 'node_id', false() ) ) ) ) as $topic}
            {def $topic_reply_count = fetch( 'content', 'tree_count', hash( parent_node_id, $topic.node_id ) )
                 $last_reply = fetch( 'content', 'list', hash( parent_node_id, $topic.node_id,
                                                               sort_by, array( array( 'published', false() ) ),
                                                               limit, 1 ) )}
            <tr>
              <td>
                {if $topic.object.data_map.sticky.content}<i class="bi bi-pin-angle-fill me-1" title="{'Sticky'|i18n( 'design/bootstrap5/full/forum' )}" aria-hidden="true"></i>{/if}
                <a href={$topic.url_alias|ezurl}>{$topic.object.name|wash}</a>
              </td>
              <td class="text-end">{$topic_reply_count}</td>
              <td>{$topic.object.owner.name|wash}</td>
              <td>
                {foreach $last_reply as $reply}
                  <div class="small">
                    <a href={concat( $reply.parent.url_alias, '#msg', $reply.node_id )|ezurl}>{$reply.object.published|l10n( shortdatetime )}</a>
                    <span class="text-body-secondary d-block">{$reply.object.owner.name|wash}</span>
                  </div>
                {/foreach}
              </td>
            </tr>
            {undef $topic_reply_count $last_reply}
          {/foreach}
        {/if}
        </tbody>
      </table>
    </div>
  </div>

  {include name=navigator
           uri='design:navigator/google.tpl'
           page_uri=concat( '/content/view', '/full/', $node.node_id )
           item_count=$topic_count
           view_parameters=$view_parameters
           item_limit=$page_limit}

</article>
{undef $page_limit $topic_count}
