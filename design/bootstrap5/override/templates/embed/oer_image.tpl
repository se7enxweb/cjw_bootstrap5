{* OER image - Embed view (inline in richtext) *}
<figure class="figure my-3">
    <div class="figure-img mb-0">
        {if is_set( $link_parameters.href )}
        {attribute_view_gui attribute=$object.data_map.image image_class=$object_parameters.size href=$link_parameters.href|ezurl target=$link_parameters.target link_class=first_set( $link_parameters.class, '' ) link_id=first_set( $link_parameters['xhtml:id'], '' ) link_title=first_set( $link_parameters['xhtml:title'], '' )}
        {else}
        {attribute_view_gui attribute=$object.data_map.image}
        {/if}
    </div>
    <figcaption class="figure-caption">
        {attribute_view_gui attribute=$object.data_map.author}
        &middot;
        {if $object.data_map.source_url.has_content}
        <a href="{$object.data_map.source_url.content|wash}" target="_blank" rel="noopener noreferrer">{attribute_view_gui attribute=$object.data_map.license}</a>
        {else}
        {attribute_view_gui attribute=$object.data_map.license}
        {/if}
    </figcaption>
</figure>
