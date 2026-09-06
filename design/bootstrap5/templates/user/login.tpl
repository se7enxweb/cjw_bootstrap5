<div class="row justify-content-center">
<div class="col-md-5">
<div class="card">
<div class="card-body">

<form method="post" action={"/user/login/"|ezurl} name="loginform">

<h1 class="card-title h3 mb-4">{"Login"|i18n("design/bootstrap5/user/login")}</h1>

{if $User:warning.bad_login}
<div class="alert alert-danger">
<h2 class="h5">{"Could not login"|i18n("design/bootstrap5/user/login")}</h2>
<p class="mb-0">{"A valid username and password is required to login."|i18n("design/bootstrap5/user/login")}</p>
</div>
{else}

{* if $site_access.allowed|not}
<div class="alert alert-danger">
<h2 class="h5">{"Access not allowed"|i18n("design/bootstrap5/user/login")}</h2>
<p class="mb-0">{"You are not allowed to access %1."|i18n("design/bootstrap5/user/login",,array($site_access.name))}</p>
</div>
{/if *}

{/if}

<div class="mb-3">
<label class="form-label" for="id1">{"Username"|i18n("design/bootstrap5/user/login",'User name')}</label>
<input class="form-control" type="text" size="10" name="Login" id="id1" value="{$User:login|wash}" tabindex="1" />
</div>

<div class="mb-3">
<label class="form-label" for="id2">{"Password"|i18n("design/bootstrap5/user/login")}</label>
<input class="form-control" type="password" size="10" name="Password" id="id2" value="" tabindex="1" />
</div>
{*if ezini( 'SiteSettings', 'AdditionalLoginFormActionURL' )}
    <div class="button-right">
    <a href="{ezini( 'SiteSettings', 'AdditionalLoginFormActionURL' )}">{"Log in to the Exponential Administration Interface"|i18n("design/bootstrap5/user/login")}</a>
    </div>
{/if*}
{if ezini( 'Session', 'RememberMeTimeout' )}
<div class="mb-3 form-check">
<input class="form-check-input" type="checkbox" tabindex="1" name="Cookie" id="id4" /><label class="form-check-label" for="id4">{"Remember me"|i18n("design/bootstrap5/user/login")}</label>
</div>
{/if}

<div class="mb-3">
<button class="btn btn-primary w-100" type="submit" name="LoginButton" value="{'Login'|i18n('design/bootstrap5/user/login','Button')}" tabindex="1">{'Login'|i18n('design/bootstrap5/user/login','Button')}</button>
{* if ezmodule( 'user/register' ) *}
{*    <input class="button" type="submit" name="RegisterButton" id="RegisterButton" value="{'Sign up'|i18n('design/bootstrap5/user/login','Button')}" tabindex="1" /> *}
{* /if *}
</div>

{if ezini( 'SiteSettings', 'LoginPage' )|eq( 'custom' )}
    <p class="text-center"><a href={'/user/forgotpassword'|ezurl}>{'Forgot your password?'|i18n( 'design/bootstrap5/user/login' )}</a></p>
{/if}

<input type="hidden" name="RedirectURI" value="{$User:redirect_uri|wash}" />

{if and( is_set( $User:post_data ), is_array( $User:post_data ) )}
  {foreach $User:post_data as $key => $postData}
      <input name="Last_{$key|wash}" value="{$postData|wash}" type="hidden" />
  {/foreach}
{/if}

</form>

</div>
</div>
</div>
</div>
