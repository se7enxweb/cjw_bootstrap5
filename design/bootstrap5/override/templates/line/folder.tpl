{* Folder - Line view *}

<div class="d-flex align-items-start border-bottom py-2">
    <div class="flex-grow-1">

        <h6 class="mb-1"><a href={$node.url_alias|ezurl}>{$node.name|wash()}</a></h6>

       {section show=$node.data_map.short_description.content.is_empty|not}
        <p class="mb-0 text-body-secondary small">
        {attribute_view_gui attribute=$node.data_map.short_description}
        </p>
       {/section}
{*
        <div class="attribute-link">
            <p><a href={$node.url_alias|ezurl}>{"View list"|i18n("design/base")}</a></p>
        </div>
*}
    </div>
</div>
