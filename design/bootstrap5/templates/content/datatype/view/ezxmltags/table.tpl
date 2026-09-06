{* Table from an XML field.
   Adds the Bootstrap classes to the standard design: the zebra stripes
   that ezwebin used to set per row via bglight/bgdark are done here by
   .table-striped — that is why tr.tpl needs no classes of its own.
   .table-responsive keeps wide tables from stretching the page.

   The row content is in $rows, NOT in $content — the XML renderer
   collects the <tr> there. Outputting $content here gives you the cells
   without their rows, i.e. invalid markup. *}
{set $classification = cond( and( is_set( $align ), $align ), concat( $classification, ' object-', $align ), $classification )}
<div class="table-responsive">
<table class="table table-striped table-bordered align-middle{if $classification} {$classification|wash}{/if}"
{if ne( $width|trim, '' )} style="width: {$width}"{/if}
{if and( is_set( $summary ), $summary )} summary="{$summary|wash}"{/if}
{if and( is_set( $title ), $title )} title="{$title|wash}"{/if}>
{if and( is_set( $caption ), $caption )}<caption>{$caption|wash}</caption>{/if}
{$rows}
</table>
</div>
