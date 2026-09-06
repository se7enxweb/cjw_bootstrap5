{* Product - Line view *}

<div class="d-flex align-items-start border-bottom py-2">

    <div class="flex-shrink-0 me-3" style="width:80px;height:80px;overflow:hidden;">
        {if $node.data_map.image.content.relation_list}
          {def $related_image_object = fetch( content, object, hash( object_id, $node.data_map.image.content.relation_list.0.contentobject_id ) )}
          {attribute_view_gui image_class=large attribute=$related_image_object.data_map.image}
          {undef $related_image_object}
        {/if}
        {if $node.data_map.caption.has_content}
        <div class="small text-body-secondary">
            {attribute_view_gui attribute=$node.data_map.caption}
        </div>
        {/if}
    </div>

    <div class="flex-grow-1">
        <h6 class="mb-1"><a href={$node.url_alias|ezurl}>{$node.name|wash()}</a></h6>

        {if $node.data_map.rating.has_content}
        <div class="mb-1">
           {attribute_view_gui attribute=$node.object.data_map.rating}
        </div>
        {/if}

        <p class="mb-1 text-body-secondary small">
           {attribute_view_gui attribute=$node.object.data_map.short_description}
        </p>

        {if $node.data_map.product_size.has_content}
        <p class="mb-1 small">
          Size: {attribute_view_gui attribute=$node.object.data_map.product_size}
        </p>
        {/if}

        <p class="mb-2 fw-semibold">
           {attribute_view_gui attribute=$node.object.data_map.price}
{*          <span class="ex-vat">(price ex. vat {$node.object.data_map.price.content.ex_vat_price})</span> *}
        </p>

        <form method="post" action={"content/action"|ezurl}>
            {if and( is_set( $node.data_map.product_inventory_count ), $node.data_map.product_inventory_count.content|le(0) )}<span class="badge text-bg-warning mb-2">Out of stock!</span>{/if}
            <input {if and( is_set( $node.data_map.product_inventory_count ), $node.data_map.product_inventory_count.content|le(0) )}disabled{/if} type="submit" class="btn btn-primary btn-sm" name="ActionAddToBasket" value="{"Add to basket"|i18n("design/bootstrap5/full/product")}">
{*            <input class="btn btn-secondary btn-sm" type="submit" name="ActionAddToWishList" value="{"Add to wish list"|i18n("design/bootstrap5/full/product")}">*}
            <input type="hidden" name="ContentNodeID" value="{$node.node_id}">
            <input type="hidden" name="ContentObjectID" value="{$node.object.id}">
            <input type="hidden" name="ViewMode" value="full">
        </form>
    </div>

</div>
