{* File attachment (eZBinaryFile). Covers the file and handbuchepub objects.
   Instead of the mimetype_icon image from ezwebin a Bootstrap icon is used
   here; the $icon parameter is kept for compatibility but only decides
   whether the icon is shown. *}
{if is_unset( $icon )}{def $icon = 'no'}{/if}
{if $attribute.has_content}
  {if $attribute.content}
    {def $download_url = concat( 'content/download/', $attribute.contentobject_id, '/', $attribute.id, '/file/', $attribute.content.original_filename )}
    <a class="d-inline-flex align-items-center gap-2" href={$download_url|ezurl} title="{$attribute.content.mime_type|wash}">
      {if ne( $icon, 'no' )}<i class="bi bi-file-earmark-arrow-down fs-5" aria-hidden="true"></i>{/if}
      <span>{$attribute.content.original_filename|wash( xhtml )}</span>
    </a>
    <small class="text-body-secondary ms-1">{$attribute.content.filesize|si( byte )}</small>
    {undef $download_url}
  {else}
    <div class="alert alert-warning" role="alert">{'The file could not be found.'|i18n( 'design/bootstrap5/view/ezbinaryfile' )}</div>
  {/if}
{/if}
