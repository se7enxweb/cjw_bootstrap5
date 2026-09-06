{* Paragraph from an XML field. Applies to every editorial text, so it is
   deliberately minimal: Bootstrap already styles <p> via the reboot.
   $align comes from the XML attribute and is mapped to the Bootstrap
   utility text-start/center/end/justify. *}
{set $classification = cond( and( is_set( $align ), $align ), concat( $classification, ' text-', $align ), $classification )}
<p{if $classification|trim} class="{$classification|wash}"{/if}>
{if eq( $content|trim(), '' )}&nbsp;{else}{$content}{/if}
</p>
