<div class="row">
<div class="col-md-6">
<p class="fw-bold mb-1">{"Customer"|i18n("design/bootstrap5/shop/accounthandlers/html/ez")}</p>
<p>
{'Name'|i18n('design/bootstrap5/shop/accounthandlers/html/ez')}: {$order.account_information.first_name|wash} {$order.account_information.last_name|wash}<br />
{'Email'|i18n('design/bootstrap5/shop/accounthandlers/html/ez')}: {$order.account_information.email|wash}<br />
{'Phone'|i18n('design/bootstrap5/shop/accounthandlers/html/ez')}: {$order.account_information.phone|wash}<br />
</p>
</div>
<div class="col-md-6">
<p class="fw-bold mb-1">{"Address"|i18n("design/bootstrap5/shop/accounthandlers/html/ez")}</p>
<p>
{'Company'|i18n('design/bootstrap5/shop/accounthandlers/html/ez')}: {$order.account_information.street1|wash}<br />
{'Street'|i18n('design/bootstrap5/shop/accounthandlers/html/ez')}: {$order.account_information.street2|wash}<br />
{'Zip'|i18n('design/bootstrap5/shop/accounthandlers/html/ez')}: {$order.account_information.zip|wash}<br />
{'City'|i18n('design/bootstrap5/shop/accounthandlers/html/ez')}: {$order.account_information.city|wash}<br />
{'State'|i18n('design/bootstrap5/shop/accounthandlers/html/ez')}: {$order.account_information.state|wash}<br />
{'Country/region'|i18n('design/bootstrap5/shop/accounthandlers/html/ez')}: {$order.account_information.country|wash}<br />
</p>
</div>
</div>

{if $order.account_information.comment}
<p class="fw-bold mb-1">{'Comment'|i18n( 'design/bootstrap5/shop/accounthandlers/html/ez' )}</p>
<p>
{$order.account_information.comment|wash|nl2br}
</p>
{/if}
