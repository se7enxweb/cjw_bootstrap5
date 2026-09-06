<ul class="nav nav-pills mb-4">
    <li class="nav-item"><span class="nav-link disabled">1. {"Shopping cart"|i18n("design/bootstrap5/shop/confirmorder")}</span></li>
    <li class="nav-item"><span class="nav-link disabled">2. {"Account information"|i18n("design/bootstrap5/shop/confirmorder")}</span></li>
    <li class="nav-item"><span class="nav-link disabled active">3. {"Confirm order"|i18n("design/bootstrap5/shop/confirmorder")}</span></li>
<li class="nav-item"><span class="nav-link disabled">4. {"Payment"|i18n(
"design/bootstrap5/shop/basket")}</span></li>
<li class="nav-item"><span class="nav-link disabled">5. {"Order receipt"|i18n(
"design/bootstrap5/shop/basket")}</span></li>
</ul>

<div class="shop-confirmorder">

<form method="post" action={"/shop/confirmorder/"|ezurl}>

<h1 class="mb-4">{"Confirm order"|i18n("design/bootstrap5/shop/confirmorder")}</h1>

{shop_account_view_gui view=html order=$order}

{def $currency = fetch( 'shop', 'currency', hash( 'code', $order.productcollection.currency_code ) )
     $locale = false()
     $symbol = false()}

{if $currency}
    {set locale = $currency.locale
         symbol = $currency.symbol}
{/if}


<h3 class="mt-4">{"Product items"|i18n("design/bootstrap5/shop/confirmorder")}</h3>
<div class="table-responsive">
<table class="table align-middle">
<thead>
<tr>
    <th>
    {"Product"|i18n("design/bootstrap5/shop/confirmorder")}
    </th>
    <th>
    {"Selected options"|i18n("design/bootstrap5/shop/confirmorder")}
    </th>
    <th>
    {"Count"|i18n("design/bootstrap5/shop/confirmorder")}
    </th>
    {*
    <th>
    {"VAT"|i18n("design/bootstrap5/shop/confirmorder")}
    </th>
    <th>
    {"Price inc. VAT"|i18n("design/bootstrap5/shop/confirmorder")}
    </th>
    <th>
    {"Discount"|i18n("design/bootstrap5/shop/confirmorder")}
    </th>
    <th>
    {"Total price ex. VAT"|i18n("design/bootstrap5/shop/confirmorder")}
    </th>
*}
    <th class="text-end">
    {"Total price"|i18n("design/bootstrap5/shop/confirmorder")}
    </th>
</tr>
</thead>
<tbody>
{section name=ProductItem loop=$order.product_items show=$order.product_items sequence=array(bglight,bgdark)}
<tr>
    <td>
    <input type="hidden" name="ProductItemIDList[]" value="{$ProductItem:item.id}" />
    <a href={concat("/content/view/full/",$ProductItem:item.node_id,"/")|ezurl}>{$ProductItem:item.object_name}</a>
    </td>
    <td>
    {section show=$ProductItem:item.item_object.option_list}
    <ul class="list-unstyled small text-body-secondary mb-0">
     {section name=Options loop=$ProductItem:item.item_object.option_list}
      <li>{$ProductItem:Options:item.name}: {$ProductItem:Options:item.value} ({$ProductItem:Options:item.price|l10n( 'currency', $locale, $symbol )})</li>
    {/section}
    </ul>
    {/section}
    </td>
    <td>
    {$ProductItem:item.item_count}
    </td>
{*
    <td>
    {$ProductItem:item.vat_value} %
    </td>
    <td>
    {$ProductItem:item.price_inc_vat|l10n( 'currency', $locale, $symbol )}
    </td>
    <td>
    {$ProductItem:item.discount_percent}%
    </td>
    <td>
    {$ProductItem:item.total_price_ex_vat|l10n( 'currency', $locale, $symbol )}
    </td>
    *}
    <td class="text-end">
    {$ProductItem:item.total_price_inc_vat|l10n( 'currency', $locale, $symbol )}
    </td>
</tr>
{/section}
</tbody>
</table>
</div>

<h3 class="mt-4">{"Order summary"|i18n("design/bootstrap5/shop/confirmorder")}</h3>
<div class="table-responsive">
<table class="table align-middle">
<thead>
<tr>
    <th>{"Summary"|i18n("design/bootstrap5/shop/confirmorder")}</th>
{*    <th>{"Total ex. VAT"|i18n("design/bootstrap5/shop/confirmorder")}</th> *}
    <th class="text-end">{"Total"|i18n("design/bootstrap5/shop/confirmorder")}</th>
</tr>
</thead>
<tbody>
<tr>
    <td>
    {"Subtotal of items"|i18n("design/bootstrap5/shop/confirmorder")}
    </td>
{*
    <td>
    {$order.product_total_ex_vat|l10n( 'currency', $locale, $symbol )}
    </td>
*}
    <td class="text-end">
    {$order.product_total_inc_vat|l10n( 'currency', $locale, $symbol )}
    </td>
</tr>

{section name=OrderItem loop=$order.order_items show=$order.order_items sequence=array(bgdark,bglight)}
<tr>
    <td>
    {$OrderItem:item.description}
    </td>
    {*
    <td>
    {$OrderItem:item.price_ex_vat|l10n( 'currency', $locale, $symbol )}
    </td>
    *}
    <td class="text-end">
    {$OrderItem:item.price_inc_vat|l10n( 'currency', $locale, $symbol )}
    </td>
</tr>
{/section}
</tbody>
<tfoot class="table-group-divider fw-semibold">
<tr>
    <td>
    {"Order total"|i18n("design/bootstrap5/shop/confirmorder")}
    </td>
    {*
    <td>
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

<div class="d-flex gap-2 mt-3">
<button class="btn btn-primary" type="submit" name="ConfirmOrderButton" value="{'Confirm'|i18n('design/bootstrap5/shop/confirmorder')}">{'Confirm'|i18n('design/bootstrap5/shop/confirmorder')}</button>
{*<input class="button" type="submit" name="CancelButton" value="{'Cancel'|i18n('design/bootstrap5/shop/confirmorder')}" /> &nbsp;*}
</div>

</form>

</div>
