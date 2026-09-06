<ul class="nav nav-pills mb-4">
     <li class="nav-item"><span class="nav-link disabled">1. {"Shopping cart"|i18n("design/bootstrap5/shop/userregister")}</span></li>
     <li class="nav-item"><span class="nav-link disabled active">2. {"Account information"|i18n("design/bootstrap5/shop/userregister")}</span></li>
     <li class="nav-item"><span class="nav-link disabled">3. {"Confirm order"|i18n("design/bootstrap5/shop/userregister")}</span></li>
<li class="nav-item"><span class="nav-link disabled">4. {"Payment"|i18n(
"design/bootstrap5/shop/basket")}</span></li>
<li class="nav-item"><span class="nav-link disabled">5. {"Order receipt"|i18n(
"design/bootstrap5/shop/basket")}</span></li>
</ul>

<div class="shop-userregister">

<h1 class="mb-4">{"Your account information"|i18n("design/bootstrap5/shop/userregister")}</h1>

{section show=$input_error}
<div class="alert alert-danger">
{"Input did not validate. All fields marked with * must be filled in."|i18n("design/bootstrap5/shop/userregister")}
</div>

{/section}
<form method="post" action={"/shop/userregister/"|ezurl}>

<div class="row">
  <div class="col-md-6 mb-3">
    <label class="form-label" for="FirstName">{"First name"|i18n("design/bootstrap5/shop/userregister")}:*</label>
    <input class="form-control" type="text" id="FirstName" name="FirstName" value="{$first_name|wash}" />
  </div>
  <div class="col-md-6 mb-3">
    <label class="form-label" for="LastName">{"Last name"|i18n("design/bootstrap5/shop/userregister")}:*</label>
    <input class="form-control" type="text" id="LastName" name="LastName" value="{$last_name|wash}" />
  </div>
</div>

<div class="mb-3">
<label class="form-label" for="EMail">{"Email"|i18n("design/bootstrap5/shop/userregister")}:*</label>
<input class="form-control" type="text" id="EMail" name="EMail" value="{$email|wash}" />
</div>

<div class="mb-3">
<label class="form-label" for="Phone">{"Phone"|i18n("design/bootstrap5/shop/userregister")}:*</label>
<input class="form-control" type="text" id="Phone" name="Phone" value="{$phone|wash}" />
</div>

<div class="mb-3">
<label class="form-label" for="Street1">{"Company"|i18n("design/bootstrap5/shop/userregister")}:</label>
<input class="form-control" type="text" id="Street1" name="Street1" value="{$street1|wash}" />
</div>

<div class="mb-3">
<label class="form-label" for="Street2">{"Street"|i18n("design/bootstrap5/shop/userregister")}:*</label>
<input class="form-control" type="text" id="Street2" name="Street2" value="{$street2|wash}" />
</div>

<div class="row">
  <div class="col-md-4 mb-3">
    <label class="form-label" for="Zip">{"Zip"|i18n("design/bootstrap5/shop/userregister")}:*</label>
    <input class="form-control" type="text" id="Zip" name="Zip" value="{$zip|wash}" />
  </div>
  <div class="col-md-8 mb-3">
    <label class="form-label" for="City">{"City"|i18n("design/bootstrap5/shop/userregister")}:*</label>
    <input class="form-control" type="text" id="City" name="City" value="{$city|wash}" />
  </div>
</div>

<div class="mb-3">
<label class="form-label" for="State">{"State"|i18n("design/bootstrap5/shop/userregister")}:</label>
<input class="form-control" type="text" id="State" name="State" value="{$state|wash}" />
</div>

<div class="mb-3">
<label class="form-label" for="Country">{"Country"|i18n("design/bootstrap5/shop/userregister")}:*</label>{$country}
{include uri='design:shop/country/edit.tpl' select_name='Country' select_size=5 current_val=$country}
</div>


<div class="mb-3">
<label class="form-label" for="Comment">{"Comment"|i18n("design/bootstrap5/shop/userregister")}:</label>
<textarea class="form-control" id="Comment" name="Comment" rows="5">{$comment|wash}</textarea>
</div>


<div class="d-flex gap-2 mt-3">
    <button class="btn btn-primary" type="submit" name="StoreButton" value="{"Continue"|i18n( 'design/bootstrap5/shop/userregister')}">{"Continue"|i18n( 'design/bootstrap5/shop/userregister')}</button>
    <button class="btn btn-outline-secondary" type="submit" name="CancelButton" value="{"Cancel"|i18n('design/bootstrap5/shop/userregister')}">{"Cancel"|i18n('design/bootstrap5/shop/userregister')}</button>
</div>

</form>

<p class="text-body-secondary small mt-3">
{"All fields marked with * must be filled in."|i18n("design/bootstrap5/shop/userregister")}
</p>

</div>
