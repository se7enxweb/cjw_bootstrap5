{* Product options (eZMultiOption) as Bootstrap form fields. *}
<div class="mb-2 fw-semibold">{$attribute.content.name|wash}</div>

{foreach $attribute.content.multioption_list as $multioptions}
  <div class="mb-3">
    <label class="form-label" for="eZOption_{$attribute.id}_{$multioptions.id}">{$multioptions.name|wash}</label>
    <select class="form-select" id="eZOption_{$attribute.id}_{$multioptions.id}" name="eZOption[{$attribute.id}][]">
      {foreach $multioptions.optionlist as $index => $option}
        <option value="{$option.option_id}"{if eq( sum( $index, 1 ), $multioptions.default_option_id )} selected="selected"{/if}>{$option.value|wash}{if ne( $option.additional_price, '' )} – {$option.additional_price|l10n( currency )}{/if}</option>
      {/foreach}
    </select>
  </div>
{/foreach}
