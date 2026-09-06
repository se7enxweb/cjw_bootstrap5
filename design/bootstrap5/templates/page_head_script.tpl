{* Optional site-specific scripts on top of Bootstrap 5 (cjw_bootstrap5/assets_foot.tpl).
   Add your own via [JavaScriptSettings] FrontendJavaScriptList[] in design.ini.
   Deliberately NOT loading the plain JavaScriptList[] key — same reasoning
   as page_head_style.tpl: it's shared with every other active theme
   extension's own scripts (e.g. jQuery + a different theme's main.js). *}
{ezscript_load( ezini( 'JavaScriptSettings', 'FrontendJavaScriptList', 'design.ini' ) )}
