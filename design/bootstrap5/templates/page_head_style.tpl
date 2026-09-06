{* Optional site-specific stylesheets on top of Bootstrap 5 (cjw_bootstrap5/assets_head.tpl).
   Add your own via [StylesheetSettings] FrontendCSSFileList[] in design.ini.
   Deliberately NOT loading the plain CSSFileList[] key here: it's a single
   flat array shared by every active extension's OWN design.ini.append.php
   (e.g. other themes' main.css) regardless of which design is actually
   rendering — pulling it in here would silently reintroduce whatever other
   themes are still active for other siteaccesses. *}
{ezcss_load( ezini( 'StylesheetSettings', 'FrontendCSSFileList', 'design.ini' ) )}
