<div class="shop-orderview">

<ul class="nav nav-pills mb-4">
<li class="nav-item"><span class="nav-link disabled">1. {"Shopping cart"|i18n("design/bootstrap5/shop/confirmorder")}</span></li>
<li class="nav-item"><span class="nav-link disabled">2. {"Account information"|i18n("design/bootstrap5/shop/confirmorder")}</span></li>
<li class="nav-item"><span class="nav-link disabled">3. {"Confirm order"|i18n("design/bootstrap5/shop/confirmorder")}</span></li>
<li class="nav-item"><span class="nav-link disabled">4. {"Payment"|i18n(
"design/bootstrap5/shop/basket")}</span></li>
<li class="nav-item"><span class="nav-link disabled active">5. {"Order receipt"|i18n(
"design/bootstrap5/shop/basket")}</span></li>
</ul>

<div class="mb-4">
  <h1 class="mb-2">{'Order %order_id [%order_status]'|i18n( 'design/bootstrap5/shop/orderview',,
       hash( '%order_id', $order.order_nr,
             '%order_status', $order.status_name ) )}</h1>
<p class="text-body-secondary">Please bookmark this page for your records.</p>
</div>

{shop_account_view_gui view=html order=$order}

{def $currency = fetch( 'shop', 'currency', hash( 'code', $order.productcollection.currency_code ) )
         $locale = false()
         $symbol = false()}

{if $currency}
    {set locale = $currency.locale
         symbol = $currency.symbol}
{/if}

<h3 class="mt-4">{'Product items'|i18n( 'design/bootstrap5/shop/orderview' )}</h3>
<div class="table-responsive">
<table class="table align-middle">
<thead>
<tr>
    <th>
    {'Product'|i18n( 'design/bootstrap5/shop/orderview' )}
    </th>
    <th>
    {'Count'|i18n( 'design/bootstrap5/shop/orderview' )}
    </th>
{*    <th>
    {'VAT'|i18n( 'design/bootstrap5/shop/orderview' )}
    </th>
    <th>
    {'Price inc. VAT'|i18n( 'design/bootstrap5/shop/orderview' )}
    </th>
    <th>
    {'Discount'|i18n( 'design/bootstrap5/shop/orderview' )}
    </th>
    <th>
    {'Total price ex. VAT'|i18n( 'design/bootstrap5/shop/orderview' )}
    </th>
 *}   <th class="text-end">
    {'Total price'|i18n( 'design/bootstrap5/shop/orderview' )}
    </th>
</tr>
</thead>
<tbody>
{if $order.product_items|count()}
{foreach $order.product_items as $product_item sequence array( 'bglight', 'bgdark' ) as $style}
<tr>
    <td>
    <a href={concat( "/content/view/full/", $product_item.node_id )|ezurl}>{$product_item.object_name}</a>
    </td>
    <td>
    {$product_item.item_count}
    </td>
   {* <td>
    {$product_item.vat_value} %
    </td>
    <td>
    {$product_item.price_inc_vat|l10n( 'currency', $locale, $symbol )}
    </td>
    <td>
    {$product_item.discount_percent}%
    </td>
    <td>
    {$product_item.total_price_ex_vat|l10n( 'currency', $locale, $symbol )}
    </td>
*}
    <td class="text-end">
    {$product_item.total_price_inc_vat|l10n( 'currency', $locale, $symbol )}
    </td>
</tr>
{/foreach}
{/if}
</tbody>
</table>
</div>

<h3 class="mt-4">{'Order summary'|i18n( 'design/bootstrap5/shop/orderview' )}</h3>
<div class="table-responsive">
<table class="table align-middle">
<thead>
<tr>
    <th>
    {'Summary'|i18n( 'design/bootstrap5/shop/orderview' )}
    </th>{*
    <th>
    {'Total price ex. VAT'|i18n( 'design/bootstrap5/shop/orderview' )}
    </th>*}
    <th class="text-end">
    {'Total price'|i18n( 'design/bootstrap5/shop/orderview' )}
    </th>
</tr>
</thead>
<tbody>
<tr>
    <td>
    {'Subtotal of items'|i18n( 'design/bootstrap5/shop/orderview' )}
    </td>
{*    <td>
    {$order.product_total_ex_vat|l10n( 'currency', $locale, $symbol )}
    </td>
  *}
  <td class="text-end">
    {$order.product_total_inc_vat|l10n( 'currency', $locale, $symbol )}
    </td>
</tr>
{if $order.order_items|count()}
{foreach $order.order_items as $order_item sequence array( 'bglight', 'bgdark' ) as $style}
<tr>
    <td>
    {$order_item.description}
    </td>
{*    <td>
    {$order_item.price_ex_vat|l10n( 'currency', $locale, $symbol )}
    </td> *}
    <td class="text-end">
    {$order_item.price_inc_vat|l10n( 'currency', $locale, $symbol )}
    </td>
</tr>
{/foreach}
{/if}
</tbody>
<tfoot class="table-group-divider fw-semibold">
<tr>
    <td>
        {'Order total'|i18n( 'design/bootstrap5/shop/orderview' )}
    </td>
{*    <td>
        {$order.total_ex_vat|l10n( 'currency', $locale, $symbol )}
    </td>
  *}
  <td class="text-end">
        {$order.total_inc_vat|l10n( 'currency', $locale, $symbol )}
    </td>
</tr>
</tfoot>
</table>
</div>

<h3 class="mt-4">{'Order history'|i18n( 'design/bootstrap5/shop/orderview' )}</h3>
{def $order_status_history=fetch( 'shop', 'order_status_history', hash( 'order_id', $order.order_nr ) )}
{if $order_status_history|count()}
<ul class="list-group">
{foreach $order_status_history as $history sequence array( 'bglight', 'bgdark' ) as $style}
<li class="list-group-item d-flex justify-content-between align-items-center">
    <span>{$history.modified|l10n( 'shortdatetime' )}</span>
    <span class="badge text-bg-secondary">{$history.status_name|wash}</span>
</li>
{/foreach}
</ul>
{/if}

</div>
