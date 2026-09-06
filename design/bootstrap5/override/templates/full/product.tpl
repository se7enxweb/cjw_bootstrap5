{* Product - Full view *}

<article class="container py-4">

<form method="post" action={"content/action"|ezurl}>

    <h1 class="mb-3">{$node.name|wash()}</h1>

    {if $node.data_map.image.content.relation_list}
    <div class="row row-cols-1 row-cols-md-3 g-3 mb-3">
        {foreach $node.data_map.image.content.relation_list as $item}
          {def $related_image_object = fetch( content, object, hash( object_id, $item.contentobject_id ) )}
          <div class="col">
              {attribute_view_gui attribute=$related_image_object.data_map.image}
          </div>
          {undef $related_image_object}
        {/foreach}
    </div>
        {if $node.data_map.caption.has_content}
        <div class="text-body-secondary small mb-3">
            {attribute_view_gui attribute=$node.data_map.caption}
        </div>
        {/if}
    {/if}

    {if true()}
    <div class="mb-3">
       {attribute_view_gui attribute=$node.object.data_map.rating}
    </div>
    {/if}

    <p class="lead">
       {attribute_view_gui attribute=$node.object.data_map.short_description}
    </p>

    <div class="content-body mb-3">
       {attribute_view_gui attribute=$node.object.data_map.description}
    </div>

    {if $node.data_map.product_number.has_content}
    <p class="text-body-secondary small">
       Product Number: {attribute_view_gui attribute=$node.object.data_map.product_number}
    </p>
    {/if}

    {if $node.data_map.product_size.has_content}
    <p class="text-body-secondary small">
       Package Size: {attribute_view_gui attribute=$node.object.data_map.product_size}
    </p>
    {/if}
    <p class="fs-4 fw-bold">
       {attribute_view_gui attribute=$node.object.data_map.price}
    </p>

    <div class="mb-3">
       {attribute_view_gui attribute=$node.object.data_map.additional_options}
    </div>

    {* Category. *}
    {def $product_category_attribute=ezini( 'VATSettings', 'ProductCategoryAttribute', 'shop.ini' )}
    {if and( $product_category_attribute, is_set( $node.data_map.$product_category_attribute ) )}
    <p class="text-body-secondary small">Category:&nbsp;{attribute_view_gui attribute=$node.data_map.$product_category_attribute}</p>
    {/if}
    {undef $product_category_attribute}

    <div class="mb-3">
        <input type="submit" class="btn btn-primary" name="ActionAddToBasket" value="{"Add to basket"|i18n("design/bootstrap5/full/product")}">
{*
        <input class="button" type="submit" name="ActionAddToWishList" value="{"Add to wish list"|i18n("design/bootstrap5/full/product")}">
*}
        <input type="hidden" name="ContentNodeID" value="{$node.node_id}">
        <input type="hidden" name="ContentObjectID" value="{$node.object.id}">
        <input type="hidden" name="ViewMode" value="full">
    </div>

   {* Related products. *}
   {def $related_purchase=fetch( 'shop', 'related_purchase', hash( 'contentobject_id', $node.object.id, 'limit', 10 ) )}
   {if $related_purchase}
    <div class="mt-4">
        <h2 class="h4">{'People who bought this also bought'|i18n( 'design/bootstrap5/full/product' )}</h2>

        <div class="row row-cols-1 row-cols-md-3 g-3">
        {foreach $related_purchase as $product}
            <div class="col">{content_view_gui view=text_linked content_object=$product}</div>
        {/foreach}
        </div>
    </div>
   {/if}
   {undef $related_purchase}

</form>

</article>
