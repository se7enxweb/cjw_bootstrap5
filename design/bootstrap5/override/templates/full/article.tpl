{* Article - Full view *}
{*def    $image_variation=ezini( 'LightboxSettings' , 'FullImageSize' , 'lightbox.ini' )*}

<article class="container py-4">

    <h1 class="mb-3">{$node.data_map.title.content|wash()}</h1>

    {* <div class="attribute-byline">
    {if $node.data_map.author.content.is_empty|not()}
    <p class="author">
         {attribute_view_gui attribute=$node.data_map.author}
    </p>
    {/if}
    <p class="date">
         {$node.object.published|l10n(shortdatetime)}
    </p>
    </div> *}

    {if eq( ezini( 'article', 'ImageInFullView', 'content.ini' ), 'enabled' )}
        {if $node.data_map.image.has_content}
            <div class="mb-3">
                {attribute_view_gui attribute=$node.data_map.image image_class=large href=$node.object.data_map.image.content[original].full_path|ezurl lightbox_class="large"}

                {if $node.data_map.caption.has_content}
                <div class="text-body-secondary small mt-2">
                    {attribute_view_gui attribute=$node.data_map.caption}
                </div>
                {/if}
            </div>
        {/if}
    {/if}

    {*if eq( ezini( 'article', 'SummaryInFullView', 'content.ini' ), 'enabled' )}
        {if $node.data_map.intro.content.is_empty|not}
            <div class="attribute-short">
                {attribute_view_gui attribute=$node.data_map.intro}
            </div>
        {/if}
    {/if*}

    {if $node.data_map.body.content.is_empty|not}
        <div class="content-body">
            {attribute_view_gui attribute=$node.data_map.body}
        </div>
    {/if}

    {if is_unset( $versionview_mode )}
    {if $node.data_map.enable_comments.data_int}
    <div class="mt-4">
        <h2 class="h4">{"Comments"|i18n("design/bootstrap5/full/article")}</h2>
            <div class="mb-3">
                {foreach fetch_alias( comments, hash( parent_node_id, $node.node_id ) ) as $comment}
                    <div class="border-bottom py-2">
                        {node_view_gui view='line' content_node=$comment}
                    </div>
                {/foreach}
            </div>

            {if fetch( 'content', 'access', hash( 'access', 'create',
                                                  'contentobject', $node,
                                                  'contentclass_id', 'comment' ) )}
                <form method="post" action={"content/action"|ezurl}>
                <input type="hidden" name="ClassIdentifier" value="comment" />
                <input type="hidden" name="NodeID" value="{$node.object.main_node.node_id}" />
                <input type="hidden" name="ContentLanguageCode" value="{ezini( 'RegionalSettings', 'Locale', 'site.ini')}" />
                <input class="btn btn-primary" type="submit" name="NewButton" value="{'New comment'|i18n( 'design/bootstrap5/full/article' )}" />
                </form>
            {else}
                <p>{'%login_link_startLog in%login_link_end or %create_link_startcreate a user account%create_link_end to comment.'|i18n( 'design/bootstrap5/full/article', , hash( '%login_link_start', concat( '<a href="', '/user/login'|ezurl(no), '">' ), '%login_link_end', '</a>', '%create_link_start', concat( '<a href="', "/user/register"|ezurl(no), '">' ), '%create_link_end', '</a>' ) )}</p>
            {/if}
    </div>
    {/if}
    {/if}

</article>
