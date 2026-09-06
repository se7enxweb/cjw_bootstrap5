{* Show - Full view *}

<article class="container py-4">

    <h1 class="mb-3"><a href="{$node.url_alias|ezurl("no")}" class="text-decoration-none">{attribute_view_gui attribute=$node.data_map.name}</a></h1>

    {if eq( ezini( 'folder', 'SummaryInFullView', 'content.ini' ), 'enabled' )}
        {if $node.object.data_map.short_description.has_content}
            <p class="lead">
                {attribute_view_gui attribute=$node.data_map.short_description}
            </p>
        {/if}
    {/if}

    {if $node.object.data_map.description.has_content}
        <div class="content-body mb-3">
            {attribute_view_gui attribute=$node.data_map.description}
        </div>
    {/if}

    {if $node.object.data_map.show_children.data_int}
        {def $page_limit = 10
             $classes = array( 'infobox' )
             $children = array()
             $children_count = ''}

        {if le( $node.depth, '3')}
            {set $classes=array( 'infobox' )}
        {/if}

        {set $children=fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,
                                                      'offset', $view_parameters.offset,
                                                      'sort_by', $node.sort_array,
                                                      'class_filter_type', 'include',
                                                      'class_filter_array', array( 'episode' ),
                                                      'limit', $page_limit ) )
             $children_count=fetch_alias( 'children_count', hash( 'parent_node_id', $node.node_id,
                                                                  'class_filter_type', 'exclude',
                                                                  'class_filter_array', $classes ) )}
        <h2 class="h4 mt-4">Episodes</h2>
        <div class="row row-cols-1 row-cols-md-3 g-4">
            {foreach $children as $child }
                <div class="col">
                    {node_view_gui view='line' content_node=$child}
                </div>
            {/foreach}
        </div>

        {include name=navigator
                 uri='design:navigator/google.tpl'
                 page_uri=$node.url_alias
                 item_count=$children_count
                 view_parameters=$view_parameters
                 item_limit=$page_limit}

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

    {/if}
</article>
