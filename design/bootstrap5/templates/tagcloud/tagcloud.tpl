{* Tag cloud. The font size comes as a percentage from the module. *}
<div class="d-flex flex-wrap gap-2 align-items-baseline">
{foreach $tag_cloud as $tag}
  <a href={concat( '/content/keyword/', $tag['tag']|rawurlencode )|ezurl()}
     class="link-body-emphasis text-decoration-none"
     style="font-size: {$tag['font_size']}%"
     title="{$tag['count']|wash} × {$tag['tag']|wash()}">{$tag['tag']|wash()}</a>
{/foreach}
</div>
