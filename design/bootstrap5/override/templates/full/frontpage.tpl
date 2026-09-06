{* Frontpage — three columns plus billboard and footer area.
   ezwebin controlled the column widths via CSS classes (leftcolumn /
   norightcolumn …) and float; here the Bootstrap grid does that. Which
   columns are occupied is decided by the width of the center column. *}

{set scope=global persistent_variable=hash( 'left_menu',  false(),
                                            'extra_menu', false(),
                                            'show_path',  false() )}

{def $has_left  = $node.object.data_map.left_column.has_content
     $has_right = $node.object.data_map.right_column.has_content
     $center_cols = 12}
{if $has_left}{set $center_cols = sub( $center_cols, 3 )}{/if}
{if $has_right}{set $center_cols = sub( $center_cols, 3 )}{/if}

<div class="content-view-full class-frontpage">

{if $node.object.data_map.billboard.has_content}
  <div class="attribute-billboard mb-4">
    {content_view_gui view=billboard content_object=$node.object.data_map.billboard.content}
  </div>
{/if}

  <div class="row g-4">
    {if $has_left}
      <div class="col-12 col-lg-3 left-column">
        {attribute_view_gui attribute=$node.object.data_map.left_column}
      </div>
    {/if}

    <div class="col-12 col-lg-{$center_cols} center-column">
      {attribute_view_gui attribute=$node.object.data_map.center_column}
    </div>

    {if $has_right}
      <div class="col-12 col-lg-3 right-column">
        {attribute_view_gui attribute=$node.object.data_map.right_column}
      </div>
    {/if}
  </div>

  {if $node.object.data_map.bottom_column.has_content}
    <div class="attribute-bottom-column mt-4">
      {attribute_view_gui attribute=$node.object.data_map.bottom_column}
    </div>
  {/if}

</div>
{undef $has_left $has_right $center_cols}
