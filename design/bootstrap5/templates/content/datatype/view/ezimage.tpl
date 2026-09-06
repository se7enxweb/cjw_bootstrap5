{*
Input:
 image_class - Which image alias to show, default is large
 css_class     - Optional css class to wrap around the <img> tag, the
                 class will be placed in a <div> tag.
 alignment     - How to align the image, use 'left', 'right', 'center' or false().
 link_to_image - boolean, if true the url_alias will be fetched and
                 used as link.
 href          - Optional string, if set it will create a <a> tag
                 around the image with href as the link.
 border_size   - Size of border around image, default is 0
*}
{default image_class=original
         css_class=false()
         alignment=false()
         alignment_class=''
         link_to_image=false()
         href=false()
         target=false()
         hspace=false()
         border_size=0}

{if and( is_set( $lightbox_class ) , $lightbox_class|ne( '' ) , $attribute.content[$lightbox_class].is_valid )}
   {def $href=$attribute.content[$lightbox_class].url|ezroot}
{/if}
{let image_content=$attribute.content}

{section show=$image_content.is_valid}

    {let image=$image_content[$image_class]}

    {section show=$link_to_image}
        {let image_original=$image_content['original']}
        {set href=$image_original.url|ezroot}
        {/let}
    {/section}

    {switch match=$alignment}
    {case match='left'}
        {set alignment_class='float-start'}
    {/case}
    {case match='right'}
        {set alignment_class='float-end'}
    {/case}
    {case match='center'}
        {set alignment_class='mx-auto d-block'}
    {/case}
    {case/}
    {/switch}

    {section show=$css_class}
        <div class="{$css_class|wash}">
    {/section}

    {section show=$href}<a href={$href}{section show=and( is_set( $link_class ), $link_class )} class="{$link_class}"{/section}{section show=and( is_set( $link_id ), $link_id )} id="{$link_id}"{/section}{section show=$target} target="{$target}"{/section}{section show=$lightbox_class} rel="lightbox"{/section}>{/section}
    {section show=and( is_set( $image ), $image )}
        <img src={$image.url|ezroot} width="{$image.width}" height="{$image.height}" {section show=$hspace}hspace="{$hspace}"{/section} style="border: {$border_size}px;" class="img-fluid {$alignment_class}" alt="{$image.text|wash(xhtml)}" title="{$image.text|wash(xhtml)}">{section show=$href}</a>{/section}
    {/section}

    {section show=$css_class}
        </div>
    {/section}

    {/let}

{/section}

{/let}

{/default}
{undef $href $ccs_class $alignment $image $link_class $lightbox_class}
