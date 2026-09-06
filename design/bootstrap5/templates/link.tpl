{default enable_print=true()}

<link rel="Home" href={"/"|ezurl} title="{'%sitetitle front page'|i18n('design/bootstrap5/link',,hash('%sitetitle',$site.title))}">
<link rel="Index" href={"/"|ezurl}>
<link rel="Top"  href={"/"|ezurl} title="{$site_title}">
<link rel="Search" href={"content/advancedsearch"|ezurl} title="{'Search %sitetitle'|i18n('design/bootstrap5/link',,hash('%sitetitle',$site.title))}">

<link rel="icon" href={"images/favicon.ico"|ezdesign(no)}>
<link rel="shortcut icon" href={"images/favicon.ico"|ezdesign(no)}>
<link rel="icon" type="image/png" sizes="32x32" href={"images/favicon-32x32.png"|ezdesign(no)}>
<link rel="icon" type="image/png" sizes="16x16" href={"images/favicon-16x16.png"|ezdesign(no)}>
<link rel="apple-touch-icon" sizes="180x180" href={"images/apple-touch-icon.png"|ezdesign(no)}>
<link rel="manifest" href={"images/manifest.json"|ezdesign(no)}>
<link rel="mask-icon" href={"images/safari-pinned-tab.svg"|ezdesign(no)} color="#7952b3">
<meta name="theme-color" content="#7952b3">

<link rel="Copyright" href={"/ezinfo/copyright"|ezurl}>
<link rel="Author" href={"/ezinfo/about"|ezurl}>

{if and( is_set($pagedesign), $pagedesign.data_map.rss_feed.has_content )}
<link rel="Alternate" type="application/rss+xml" title="RSS" href="{$pagedesign.data_map.rss_feed.data_text|ezurl(no)}">
{/if}

{if $enable_print}
<link rel="Alternate" href={concat("layout/set/print/", $site.uri.original_uri)|ezurl} media="print" title="{'Printable version'|i18n('design/bootstrap5/link')}">
{/if}

{/default}
