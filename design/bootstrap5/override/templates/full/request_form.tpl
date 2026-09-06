{* Feedback form - Full view *}

<article class="container py-4">

    <h1 class="mb-3">{$node.name|wash()}</h1>

    {include name=Validation uri='design:content/collectedinfo_validation.tpl'
             class='message-warning'
             validation=$validation collection_attributes=$collection_attributes}

    <p class="lead">
            {attribute_view_gui attribute=$node.data_map.description}
    </p>
    <form method="post" action={"content/action"|ezurl} enctype="multipart/form-data">

    <div class="mb-3">
        <label class="form-label">{$node.data_map.sender_name.contentclass_attribute.name}</label>
        {attribute_view_gui attribute=$node.data_map.sender_name}
    </div>

    <div class="mb-3">
        <label class="form-label">{$node.data_map.email.contentclass_attribute.name}</label>
        {attribute_view_gui attribute=$node.data_map.email}
    </div>

    <div class="mb-3">
        <label class="form-label">{$node.data_map.subject.contentclass_attribute.name}</label>
        {attribute_view_gui attribute=$node.data_map.subject}
    </div>

    <div class="mb-3">
        <label class="form-label">{$node.data_map.message.contentclass_attribute.name}</label>
        {attribute_view_gui attribute=$node.data_map.message}
    </div>

    <div class="mb-3">
        <label class="form-label">{$node.data_map.design_image.contentclass_attribute.name}</label>
        {attribute_view_gui attribute=$node.data_map.design_image}
    </div>

    <div class="mb-3">
        <input type="submit" class="btn btn-primary" name="ActionCollectInformation" value="{"Send form"|i18n("design/bootstrap5/full/feedback_form")}" />
        <input type="hidden" name="ContentNodeID" value="{$node.node_id}" />
        <input type="hidden" name="ContentObjectID" value="{$node.object.id}" />
        <input type="hidden" name="ViewMode" value="full" />
    </div>
    </form>

</article>
