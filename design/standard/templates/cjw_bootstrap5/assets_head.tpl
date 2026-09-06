{*
 * assets_head.tpl
 *
 * Local, CDN-free Bootstrap 5 + Bootstrap Icons stylesheets.
 * Include inside <head>:
 *   {include uri='design:cjw_bootstrap5/assets_head.tpl'}
 *
 * Paths come from settings/cjw_bootstrap5.ini.append.php [AssetSettings] —
 * override per siteaccess there if you move the extension or change versions.
 *}
<link rel="stylesheet" href="{ezini( 'AssetSettings', 'LocalBootstrapCss', 'cjw_bootstrap5.ini' )|wash(html)}">
<link rel="stylesheet" href="{ezini( 'AssetSettings', 'LocalBootstrapIconsCss', 'cjw_bootstrap5.ini' )|wash(html)}">
