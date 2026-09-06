<ul class="nav nav-pills mb-4">
    <li class="nav-item"><span class="nav-link disabled active">1. {"Shopping cart"|i18n("design/bootstrap5/shop/basket")}</span></li>
    <li class="nav-item"><span class="nav-link disabled">2. {"Account information"|i18n("design/bootstrap5/shop/basket")}</span></li>
    <li class="nav-item"><span class="nav-link disabled">3. {"Confirm order"|i18n("design/bootstrap5/shop/basket")}</span></li>
    <li class="nav-item"><span class="nav-link disabled">4. {"Payment"|i18n(
"design/bootstrap5/shop/basket")}</span></li>
    <li class="nav-item"><span class="nav-link disabled">5. {"Order receipt"|i18n(
"design/bootstrap5/shop/basket")}</span></li>
</ul>

<div class="shop-basket">

<form method="post" action={"/shop/cart/"|ezurl}>

<h1 class="mb-4">{"Cart"|i18n("design/bootstrap5/shop/basket")}</h1>

{section show=$removed_items}
<div class="alert alert-warning">
    <h2 class="h5">{"The following items were removed from your basket because the products were changed."|i18n("design/bootstrap5/shop/basket",,)}</h2>
    <ul class="mb-0">
    {section name=RemovedItem loop=$removed_items}
        <li> <a href={concat("/content/view/full/",$RemovedItem:item.contentobject.main_node_id,"/")|ezurl}>{$RemovedItem:item.contentobject.name|wash}</a></li>
    {/section}
    </ul>
</div>
{/section}

{if not( $vat_is_known )}
<div class="alert alert-warning">
<h2 class="h5">{'VAT is unknown'|i18n( 'design/bootstrap5/shop/basket' )}</h2>
{'VAT percentage is not yet known for some of the items being purchased.'|i18n( 'design/bootstrap5/shop/basket' )}<br/>
{'This probably means that some information about you is not yet available and will be obtained during checkout.'|i18n( 'design/bootstrap5/shop/basket' )}
</div>
{/if}

{section show=$error}
<div class="alert alert-danger">
{section show=$error|eq(1)}
<h2 class="h5">{"Attempted to add object without price to basket."|i18n("design/bootstrap5/shop/basket",,)}</h2>
{/section}
</div>
{/section}

{section show=$error}
<div class="alert alert-danger">
{section show=eq($error, "aborted")}
<h2 class="h5">{"Your payment was aborted."|i18n("design/bootstrap5/shop/basket",,)}</h2>
{/section}
</div>
{/section}


    {def $currency = fetch( 'shop', 'currency', hash( 'code', $basket.productcollection.currency_code ) )
         $locale = false()
         $symbol = false()}
    {if $currency}
        {set locale = $currency.locale
             symbol = $currency.symbol}
    {/if}

    {section name=Basket show=$basket.items}

<div class="table-responsive">
<table class="table align-middle">
<thead>
<tr>
    <th>{"Product"|i18n("design/bootstrap5/shop/basket")}</th>
    <th>{"Selected options"|i18n("design/bootstrap5/shop/basket")}</th>
    <th>
    {"Quantity"|i18n("design/bootstrap5/shop/basket")}
    </th>
{*    <th>
    {"VAT"|i18n("design/bootstrap5/shop/basket")}
    </th>
*}
    <th class="text-end">
    {"Price"|i18n("design/bootstrap5/shop/basket")}
    </th>
{*
    <th>
    {"Discount"|i18n("design/bootstrap5/shop/basket")}
    </th>
    <th>
    {"Total price ex. VAT"|i18n("design/bootstrap5/shop/basket")}
    </th>
*}
    <th class="text-end">
    {"Total price"|i18n("design/bootstrap5/shop/basket")}
    </th>
    <th>&nbsp;
    </th>
</tr>
</thead>
<tbody>
{section name=ProductItem loop=$basket.items sequence=array(bgdark, bglight)}
<tr>
    <td>
    <input type="hidden" name="ProductItemIDList[]" value="{$Basket:ProductItem:item.id}" />
    {*{$Basket:ProductItem:item.id}-*}
    <a href={concat("/content/view/full/",$Basket:ProductItem:item.node_id,"/")|ezurl}>{$Basket:ProductItem:item.object_name}</a>
    </td>
    <td>
    {section show=$Basket:ProductItem:item.item_object.option_list}
    <ul class="list-unstyled small text-body-secondary mb-0">
     {section name=Options loop=$Basket:ProductItem:item.item_object.option_list sequence=array(bglight, bgdark)}
      <li>{$Basket:ProductItem:Options:item.name}: {$Basket:ProductItem:Options:item.value} ({$Basket:ProductItem:Options:item.price|l10n( 'currency', $locale, $symbol )})</li>
    {/section}
    </ul>
    {/section}
    </td>
    <td>
    <input type="text" class="form-control form-control-sm" style="width:5rem" name="ProductItemCountList[]" value="{$Basket:ProductItem:item.item_count}" size="5" />
    </td>
{*    <td>
    {if ne( $Basket:ProductItem:item.vat_value, -1 )}
        {$Basket:ProductItem:item.vat_value} %
    {else}
        {'Unknown'|i18n( 'design/bootstrap5/shop/basket' )}
    {/if}
    </td>
*}
    <td class="text-end">
    {$Basket:ProductItem:item.price_inc_vat|l10n( 'currency', $locale, $symbol )}
    </td>
{*
    <td>
    {$Basket:ProductItem:item.discount_percent}%
    </td>
    <td>
    {$Basket:ProductItem:item.total_price_ex_vat|l10n( 'currency', $locale, $symbol )}
    </td>
*}
    <td class="text-end">
    {$Basket:ProductItem:item.total_price_inc_vat|l10n( 'currency', $locale, $symbol )}
    </td>
    <td>
    <div class="d-flex flex-column gap-1">
    <button class="btn btn-sm btn-outline-secondary" type="submit" name="StoreChangesButton" value="{'Update'|i18n('design/bootstrap5/shop/basket')}">{'Update'|i18n('design/bootstrap5/shop/basket')}</button>
    <div class="form-check">
    <input class="form-check-input" type="checkbox" name="RemoveProductItemDeleteList[]" value="{$Basket:ProductItem:item.id}" id="remove-{$Basket:ProductItem:item.id}" />
    <label class="form-check-label small" for="remove-{$Basket:ProductItem:item.id}">{'Remove'|i18n('design/bootstrap5/shop/basket')}</label>
    </div>
    <button class="btn btn-sm btn-outline-danger" type="submit" name="RemoveProductItemButton" value="{'Remove'|i18n('design/bootstrap5/shop/basket')}"><i class="bi bi-trash"></i> {'Remove'|i18n('design/bootstrap5/shop/basket')}</button>
    </div>
    </td>
</tr>
{/section}
</tbody>
<tfoot class="table-group-divider fw-semibold">
<tr>
     <td colspan="4">
     {"Subtotal"|i18n("design/bootstrap5/shop/basket")}
     </td>
{*     <td>
     <strong>{"Subtotal ex. VAT"|i18n("design/bootstrap5/shop/basket")}</strong>:
     </td>
     <td>
     </td>
*}
     <td class="text-end">{$basket.total_inc_vat|l10n( 'currency', $locale, $symbol )}</td>
     <td></td>
</tr>
{if is_set( $shipping_info )}
{* Show shipping type/cost. *}
<tr>
     <td colspan="4">
     <a href={$shipping_info.management_link|ezurl}>{'Shipping'|i18n( 'design/bootstrap5/shop/basket' )}{if $shipping_info.description} ({$shipping_info.description}){/if}</a>
     </td>
{*
     <td>
     {$shipping_info.cost|l10n( 'currency', $locale, $symbol )}:
     </td>
*}
   <td class="text-end">
     {$shipping_info.cost|l10n( 'currency', $locale, $symbol )}
     </td>
   <td></td>
</tr>
{* Show order total *}
<tr>
     <td colspan="4">
     {'Order total'|i18n( 'design/bootstrap5/shop/basket' )}
     </td>
{*
     <td>
     <strong>{$total_inc_shipping_ex_vat|l10n( 'currency', $locale, $symbol )}</strong>
     </td>
*}
     <td class="text-end">
     {$total_inc_shipping_inc_vat|l10n( 'currency', $locale, $symbol )}
     </td>
   <td></td>
</tr>
{/if}
</tfoot>
</table>
</div>

<div class="d-flex gap-2 mt-3">
<button class="btn btn-primary" type="submit" name="CheckoutButton" value="{'Checkout'|i18n('design/bootstrap5/shop/basket')}">{'Checkout'|i18n('design/bootstrap5/shop/basket')}</button>
<button class="btn btn-outline-secondary" type="submit" name="ContinueShoppingButton" value="{'Continue shopping'|i18n('design/bootstrap5/shop/basket')}">{'Continue shopping'|i18n('design/bootstrap5/shop/basket')}</button>
</div>

{undef $currency $locale $symbol}

{section-else}

<div class="text-center py-5">
<i class="bi bi-cart-x display-1 text-body-secondary"></i>
<h3 class="mt-3">{"You have no products in your cart."|i18n("design/bootstrap5/shop/basket")}</h3>
<p><a href="/store" title="Shop now!">{"Add a product from our"|i18n("design/bootstrap5/shop/basket")} store's selection of products</a></p>
</div>

{/section}

</form>

</div>
