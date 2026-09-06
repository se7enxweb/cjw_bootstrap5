{*
 * assets_foot.tpl
 *
 * Local, CDN-free Bootstrap 5 JS bundle (includes Popper — dropdowns,
 * tooltips, popovers, offcanvas all work without a separate Popper include).
 * Include right before </body>:
 *   {include uri='design:cjw_bootstrap5/assets_foot.tpl'}
 *}
<script src="{ezini( 'AssetSettings', 'LocalBootstrapJs', 'cjw_bootstrap5.ini' )|wash(html)}"></script>
