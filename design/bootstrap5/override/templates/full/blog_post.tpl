{* Blog post - Full view *}
{set scope=global persistent_variable=hash('left_menu', false(),
                                           'extra_menu', false())}

<div class="container py-4">
    <div class="row g-4">
        <div class="col-lg-8">

            <article>

                <h1 class="mb-3">{$node.data_map.title.content|wash}</h1>

                <div class="mb-3">
                    <p class="text-body-secondary small mb-1">{$node.data_map.publication_date.content.timestamp|l10n(shortdatetime)}</p>
                    <p class="text-body-secondary small mb-1">{$node.object.owner.name}</p>
                    <p class="mb-0"> {"Tags:"|i18n("design/bootstrap5/full/blog_post")}
                         {foreach $node.data_map.tags.content.keywords as $keyword}
                             <a href={concat( $node.parent.url_alias, "/(id)/", $node.parent.node_id, "/(tag)/", $keyword|rawurlencode )|ezurl} title="{$keyword}" class="badge text-bg-secondary text-decoration-none me-1">{$keyword}</a>
                             {delimiter}
                             {/delimiter}
                         {/foreach}
                    </p>
                </div>

                <div class="content-body">
                    {attribute_view_gui attribute=$node.data_map.body}
                </div>

                {if $node.data_map.enable_comments.data_int}
                <div class="mt-4">
                    <a id="comments"></a>
                    <h2 class="h4">{"Comments"|i18n("design/bootstrap5/full/blog_post")}</h2>
                    <div class="mb-3">
                        {foreach fetch_alias( comments, hash( parent_node_id, $node.node_id ) ) as $comment}
                            <div class="border-bottom py-2">
                                {node_view_gui view='line' content_node=$comment}
                            </div>
                        {/foreach}
                    </div>

                   {if fetch( 'content', 'access', hash( 'access', 'create', 'contentobject', $node, contentclass_id, 'comment' ) )}
                   <form method="post" action={"content/action"|ezurl}>
                       <input type="hidden" name="ClassIdentifier" value="comment" />
                       <input type="hidden" name="NodeID" value="{$node.object.main_node.node_id}" />
                       <input type="hidden" name="ContentLanguageCode" value="{ezini( 'RegionalSettings', 'ContentObjectLocale', 'site.ini')}" />
                       <input class="btn btn-primary" type="submit" name="NewButton" value="{'New comment'|i18n( 'design/bootstrap5/full/article' )}" />
                   </form>
                   {else}
                       {if ezmodule( 'user/register' )}
                           <p>{'%login_link_startLog in%login_link_end or %create_link_startcreate a user account%create_link_end to comment.'|i18n( 'design/bootstrap5/full/blog_post', , hash( '%login_link_start', concat( '<a href="', '/user/login'|ezurl(no), '">' ), '%login_link_end', '</a>', '%create_link_start', concat( '<a href="', "/user/register"|ezurl(no), '">' ), '%create_link_end', '</a>' ) )}</p>
                       {else}
                           <p>{'%login_link_startLog in%login_link_end to comment.'|i18n( 'design/bootstrap5/article/comments', , hash( '%login_link_start', concat( '<a href="', '/user/login'|ezurl(no), '">' ), '%login_link_end', '</a>' ) )}</p>
                       {/if}
                   {/if}
                </div>
                {/if}
            </article>

            {include uri='design:parts/related_content.tpl'}
        </div>

        <div class="col-lg-4">
            {include uri='design:parts/blog/extra_info.tpl' used_node=$node.parent}
        </div>
    </div>
</div>
