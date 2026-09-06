{* Image output of a banner — shared by full/, line/, embed/ and
   billboard/banner.tpl. In ezwebin this block appeared almost verbatim
   in four files; here it exists once.

   Expects:
     $banner  the banner content object (not the node)
     $size    image variation, e.g. 'billboard' or 'original'

   width/height stay set so the browser knows the space before loading;
   .img-fluid still lets the image scale. *}
{def $alt_text = $banner.data_map.name.content}
{if is_set( $banner.data_map.image.content[$size].alternative_text )}
  {set $alt_text = $banner.data_map.image.content[$size].alternative_text}
{/if}

{if eq( $banner.data_map.image_map.content, true() )}
  <img class="img-fluid" usemap="#banner_map" src={$banner.data_map.image.content[$size].full_path|ezroot} alt="{$alt_text|wash}" width="{$banner.data_map.image.content[$size].width}" height="{$banner.data_map.image.content[$size].height}">
  {$banner.data_map.image_map.content}
{elseif $banner.data_map.url.content}
  <a href={$banner.data_map.url.content|ezurl}>
    <img class="img-fluid" src={$banner.data_map.image.content[$size].full_path|ezroot} alt="{$alt_text|wash}" width="{$banner.data_map.image.content[$size].width}" height="{$banner.data_map.image.content[$size].height}">
  </a>
{else}
  <img class="img-fluid" src={$banner.data_map.image.content[$size].full_path|ezroot} alt="{$alt_text|wash}" width="{$banner.data_map.image.content[$size].width}" height="{$banner.data_map.image.content[$size].height}">
{/if}
{undef $alt_text}
