{def $collection = cond( $collection_id, fetch( content, collected_info_collection, hash( collection_id, $collection_id ) ),
                          fetch( content, collected_info_collection, hash( contentobject_id, $node.contentobject_id ) ) )}

{set-block scope=global variable=title}{'Form %formname'|i18n( 'design/bootstrap5/collectedinfo/form', , hash( '%formname', $node.name|wash() ) )}{/set-block}

<div class="card">
<div class="card-body">

<h1 class="card-title">{$object.name|wash}</h1>

<p>{'Thank you for your submission. I will be in touch right away.'|i18n( 'design/bootstrap5/collectedinfo/form' )}</p>

{if $error}

{if $error_existing_data}
<p>{'You have already submitted this form. The data you entered was:'|i18n('design/bootstrap5/collectedinfo/form')}</p>
{/if}

{/if}

{foreach $collection.attributes as $attribute}

<div class="row mb-2">
    <div class="col-sm-4 fw-semibold">{$attribute.contentclass_attribute_name|wash}</div>
    <div class="col-sm-8">{attribute_result_gui view=info attribute=$attribute}</div>
</div>

{/foreach}

<p><a href={$node.parent.url|ezurl}>{'Return to site'|i18n('design/bootstrap5/collectedinfo/form')}</a></p>

</div>
</div>
