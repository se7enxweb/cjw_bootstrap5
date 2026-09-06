{*                        <div class="attribute-description">
                            {attribute_view_gui attribute=$used_node.object.data_map.description}
                        </div>
*}
                        <div class="mb-3">
                        <p>
                            {eztagcloud( hash( 'class_identifier', 'blog_post',
                                               'parent_node_id', $used_node.node_id ) )}
                        </p>
                        </div>

                        <div class="mb-3">
                            <h2 class="h5">{"Tags"|i18n("design/bootstrap5/blog/extra_info")}</h2>
                            <p>
                            {foreach ezkeywordlist( 'blog_post', $used_node.node_id ) as $keyword}
                                <span class="badge text-bg-secondary me-1"><a class="link-light text-decoration-none" href={concat( $used_node.url_alias, "/(tag)/", $keyword.keyword|rawurlencode )|ezurl} title="{$keyword.keyword}">{$keyword.keyword} ({fetch( 'content', 'keyword_count', hash( 'alphabet', $keyword.keyword, 'classid', 'blog_post','parent_node_id', $used_node.node_id ) )})</a></span>
                            {/foreach}
                            </p>
                        </div>

                        <div class="mb-3">
                            <h2 class="h5">{"Archive"|i18n("design/bootstrap5/blog/extra_info")}</h2>
                            <ul class="list-unstyled">
                            {foreach ezarchive( 'blog_post', $used_node.node_id ) as $archive}
                                <li><a href={concat( $used_node.url_alias, "/(month)/", $archive.month, "/(year)/", $archive.year )|ezurl} title="">{$archive.timestamp|datetime( 'custom', '%F %Y' )}</a></li>
                            {/foreach}
                            </ul>
                        </div>

                        {include uri='design:parts/blog/calendar.tpl'}
