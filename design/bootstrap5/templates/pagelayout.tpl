<!DOCTYPE html>
<html lang="{$site.http_equiv.Content-language|wash}">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
{def $basket = fetch( shop, basket )
     $basket_qty        = 0
     $basket_is_empty   = cond( $current_user.is_logged_in, fetch( shop, basket ).is_empty, 1 )
     $user_hash         = concat( $current_user.role_id_list|implode( ',' ), ',', $current_user.limited_assignment_value_list|implode( ',' ) )
     $path_array        = array()
     $path_normalized   = ''
     $indexpage         = ezini( 'NodeSettings', 'RootNode', 'content.ini' )
     $pagerootdepth    = ezini( 'SiteSettings', 'RootNodeDepth', 'site.ini' )
}
{foreach $basket.items as $cart_item}{set $basket_qty = $basket_qty|sum( $cart_item.item_count )}{/foreach}
{include uri='design:page_head_displaystyles.tpl'}

{if is_set( $extra_cache_key )|not}
    {def $extra_cache_key = ''}
{/if}

{cache-block keys=array( $module_result.uri, $basket_is_empty, $current_user.contentobject_id, $extra_cache_key )}
{def $pagedata         = ezpagedata()
     $pagestyle        = $pagedata.css_classes
     $locales          = fetch( 'content', 'translation_list' )
     $pagedesign       = $pagedata.template_look
     $pagedesign_class = fetch( 'content', 'class', hash( 'class_id', 'template_look' ) )
     $current_node_id  = $pagedata.node_id}
{if $pagedesign_class.object_count|eq( 0 )|not}{set $pagedesign = $pagedesign_class.object_list[1]}{/if}{if is_set( $module_result.content_info )}{set $content_info = $module_result.content_info}{/if}

    {include uri='design:page_head.tpl'}
    {include uri='design:page_head_style.tpl'}
    {include uri='design:cjw_bootstrap5/assets_head.tpl'}
    <link rel="stylesheet" href={"stylesheets/theme.css"|ezdesign()}>
    {include uri='design:page_head_script.tpl'}
</head>
{* To simplify IE css targeting. IE9 conforms, so threat as rest *}
<!--[if lt IE 7 ]><body class="ie6"><![endif]-->
<!--[if IE 7 ]>   <body class="ie7"><![endif]-->
<!--[if IE 8 ]>   <body class="ie8"><![endif]-->
<!--[if (gt IE 8)|!(IE)]><!--><body><!--<![endif]-->

  <!-- Header area: START -->
    {include uri='design:page_header.tpl'}
  <!-- Header area: END -->

    <!-- main starts -->
  <main>

  {if and( is_set( $pagedata.persistent_variable.extra_template_list ),
             $pagedata.persistent_variable.extra_template_list|count() )}
    {foreach $pagedata.persistent_variable.extra_template_list as $extra_template}
      {include uri=concat('design:extra/', $extra_template)}
    {/foreach}
  {/if}

{* The website toolbar from ezwebin is deliberately not included: it was the
   last reason this design still fell back to the ezwebin design
   (page_toolbar.tpl does not exist here). Editing happens via kp_admin. *}

{/cache-block}

    <div class="container py-3">
    {foreach $module_result.path as $index => $path}
        {if $index|ge($pagerootdepth)}
            {set $path_array = $path_array|append($path)}
        {/if}
        {if is_set($path.node_id)}
            {set $path_normalized = $path_normalized|append( concat('subtree_level_', $index, '_node_id_', $path.node_id, ' ' ))}
        {/if}
    {/foreach}

        <!-- Path area: START -->
        <div id="path" class="mb-3">
    {include uri='design:parts/path.tpl'}
        </div>
        <!-- Path area: END -->
    <!-- Main area: START -->
          <!-- Main area content: START -->
          {$module_result.content}
    </div>
    <!-- Main area content: END -->
    <!-- Main area: END -->
  </main>
    <!-- main ends -->
{cache-block keys=array( $module_result.uri, $user_hash, $access_type.name, $extra_cache_key )}

  <!-- Footer area: START -->
   {include uri='design:page_footer.tpl'}

    <!-- scroll to top starts -->
    <button type="button" class="btn btn-primary btn-sm position-fixed bottom-0 end-0 m-3 rounded-circle" id="scroll-to-top" style="width:2.5rem;height:2.5rem;display:none;" aria-label="{'Scroll to top'|i18n('design/bootstrap5/pagelayout')}">
      <i class="bi bi-arrow-up"></i>
    </button>
    <!-- scroll to top ends -->

  <!-- Footer area: END -->
{/cache-block}
    {* This comment will be replaced with actual debug report (if debug is on). *}
    <!--DEBUG_REPORT-->
    {include uri='design:cjw_bootstrap5/assets_foot.tpl'}
    <script src={"javascript/theme.js"|ezdesign()}></script>
  </body>
</html>
