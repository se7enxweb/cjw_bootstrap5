{* Price with optional discount. *}
{if $attribute.content.has_discount}
  <span class="text-decoration-line-through text-body-secondary">{'Price'|i18n( 'design/bootstrap5/view/ezprice' )}: {$attribute.content.inc_vat_price|l10n( currency )}</span><br>
  <span class="fs-5 fw-semibold">{'Your price'|i18n( 'design/bootstrap5/view/ezprice' )}: {$attribute.content.discount_price_inc_vat|l10n( currency )}</span><br>
  <span class="badge text-bg-success">{'You save'|i18n( 'design/bootstrap5/view/ezprice' )}: {sub( $attribute.content.inc_vat_price, $attribute.content.discount_price_inc_vat )|l10n( currency )} ({$attribute.content.discount_percent} %)</span>
{else}
  <span class="fs-5 fw-semibold">{'Price'|i18n( 'design/bootstrap5/view/ezprice' )} {$attribute.content.inc_vat_price|l10n( currency )}</span><br>
{/if}
