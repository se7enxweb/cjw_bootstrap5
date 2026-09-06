# CJW Bootstrap 5

Base frontend extension for **Exponential 6** (eZ Publish legacy fork) that
ships [Bootstrap 5](https://getbootstrap.com/docs/5.2/getting-started/introduction/)
and [Bootstrap Icons](https://icons.getbootstrap.com/) — fully local, with no
CDN dependency. Contains pure, unmodified Bootstrap; it is not tied to any
specific customer, theme or corporate design.

## Included

- Bootstrap CSS/JS `v5.3.8` (`bootstrap.min.css`, `bootstrap.bundle.min.js` — incl. Popper)
- Bootstrap Icons `v1.13.1` (`bootstrap-icons.css` + `.woff`/`.woff2`)
- The complete Bootstrap 5 and Bootstrap Icons **SCSS sources** under `scss/`
  (92 Bootstrap partials + `bootstrap-icons.scss`), for your own rebuilds with
  custom variables — see "Recompiling SCSS" below.
- A complete Bootstrap 5 theme (design name `bootstrap5`) under
  `design/bootstrap5/`: pagelayout, navbar/dropdown menu, footer, breadcrumb,
  plus Bootstrap markup for the standard eZ content classes (article, blog,
  folder, gallery, image, product, forms, shop basket/checkout,
  login/error pages). Pure Bootstrap default colors, no custom color
  variables. The favicons are the official Bootstrap "B" icon set from
  getbootstrap.com, and the navbar logo is the Exponential CMS brand (see
  "Favicons & logo" below) — no reference to any specific customer or
  corporate design.

The Bootstrap files themselves are unmodified vendor downloads from
[getbootstrap.com](https://getbootstrap.com/) and
[icons.getbootstrap.com](https://icons.getbootstrap.com/) and are covered by the
[MIT license](https://github.com/twbs/bootstrap/blob/main/LICENSE) of the
Bootstrap authors. The glue templates of this extension are GPLv2.

## Installation

1. Activate the extension in `ActiveExtensions[]` (e.g.
   `settings/siteaccess/<siteaccess>/site.ini.append.php` or
   `settings/override/site.ini.append.php`):

   ```ini
   [ExtensionSettings]
   ActiveExtensions[]=cjw_bootstrap5
   ```

2. Regenerate autoloads and clear the cache:

   ```bash
   php bin/php/ezpgenerateautoloads.php -e
   php bin/php/ezcache.php --clear-all
   ```

The extension registers itself via
`settings/design.ini.append.php` (`DesignExtensions[]=cjw_bootstrap5`) in the
universal fallback design `standard` — so it works regardless of which design
(`SiteDesign`) the siteaccess uses, and does not need to be copied into your
own theme.

## Including it in your own template

Include it in the `pagelayout.tpl` of your design:

```
<head>
    ...
    {include uri='design:cjw_bootstrap5/assets_head.tpl'}
</head>
<body>
    ...
    {include uri='design:cjw_bootstrap5/assets_foot.tpl'}
</body>
```

`assets_head.tpl` provides the two `<link>` tags (Bootstrap CSS +
Bootstrap Icons CSS), `assets_foot.tpl` provides the JS bundle just before
`</body>`.

## Configuration

All paths live in `settings/cjw_bootstrap5.ini.append.php`
(`[AssetSettings]`) and can be overridden per siteaccess
(`settings/siteaccess/<name>/cjw_bootstrap5.ini.append.php`). There is
deliberately **no** CDN option — all assets are loaded only from the
`design/standard/` directory of this extension.

## Activating the full theme (`design/bootstrap5`)

If you want to use not only the plain assets but the whole bundled
Bootstrap 5 theme as the site design, set this in the siteaccess:

```ini
[ExtensionSettings]
ActiveAccessExtensions[]=cjw_bootstrap5

[DesignSettings]
SiteDesign=bootstrap5
AdditionalSiteDesignList[]=standard
AdditionalSiteDesignList[]=base
```

Important: use `ActiveAccessExtensions[]` (not `ActiveExtensions[]`) when the
activation should apply to a specific siteaccess only —
`ActiveExtensions[]` is evaluated before siteaccess matching, so a purely
siteaccess-specific activation does not take effect there.

**Content class templates are example code, not auto-wiring:** The
`design/bootstrap5/override/templates/{full,line,embed,view}/*.tpl` files are
Bootstrap implementations for the content classes that existed in the
reference project (`article`, `blog`, `blog_post`, `folder`, `gallery`,
`image`, `product`, `feedback_form`, `comment` — plus a few reference
templates for classes that have since been removed, such as
`show`/`episode`/`audio`/`resume`/`folder_portfolio`/`request_form`). For them
to apply to *your* content classes you need your own
`override.ini.append.php` rules following eZ Publish convention, e.g.:

```ini
[full_article]
Source=node/view/full.tpl
MatchFile=full/article.tpl
Subdir=templates
Match[class_identifier]=article
```

If your class identifiers already match the bundled templates (or you have
your own matching override.ini rules), it works without further changes —
otherwise the templates are a starting point to copy and adapt.

**Menu exclusion instead of a hardcoded node ID:** `menu/dropdown.tpl` hides
the child items of certain top-level nodes (e.g. when a menu item has too
many subpages to list sensibly in a dropdown) — configurable via
`[ThemeSettings] TopLevelExcludeItems[]` in
`cjw_bootstrap5.ini.append.php`, default empty.

## Upgrading to a newer Bootstrap version

1. Download the new vendor files from <https://getbootstrap.com/> or
   <https://icons.getbootstrap.com/> (e.g. via `npm install bootstrap
   bootstrap-icons`, then take them from `node_modules/.../dist/`).
2. Replace `design/standard/stylesheets/bootstrap.min.css`,
   `design/standard/javascript/bootstrap.bundle.min.js`,
   `design/standard/stylesheets/bootstrap-icons.css` and
   `design/standard/stylesheets/fonts/bootstrap-icons.{woff,woff2}`
   (keep the relative path structure between `bootstrap-icons.css` and the
   `fonts/` subfolder — the icon font is referenced relatively).
3. Adjust `BootstrapVersion` / `BootstrapIconsVersion` in
   `settings/cjw_bootstrap5.ini.append.php`.
4. Clear the cache.

## Recompiling SCSS (custom colors/variables)

`scss/theme.scss` imports Bootstrap without any variable overrides — the
neutral reference state with pure Bootstrap default colors. That is exactly
what is currently compiled into
`design/standard/stylesheets/bootstrap.min.css`.

**Custom customer colors do not belong in this extension** — put them in your
own project extension (`site_<project>`) which imports the Bootstrap partials
from `extension/cjw_bootstrap5/scss/`, sets your own `$primary`/
`$theme-colors` etc. **before** the respective partial imports, compiles the
result into its own `design/standard/stylesheets/bootstrap.min.css`, and
points the path to itself per siteaccess:

```ini
; settings/siteaccess/<siteaccess>/cjw_bootstrap5.ini.append.php
[AssetSettings]
LocalBootstrapCss=/extension/site_<project>/design/standard/stylesheets/bootstrap.min.css
```

`extension/site_lernapp/scss/theme.scss` and
`extension/site_exponential/scss/theme.scss` are working examples of exactly
this pattern (including the compile command in each file header).

(Node/`sass` CLI required, not part of this extension.)

## Favicons & logo

`design/bootstrap5/images/` contains the **official Bootstrap 5 favicon set**
taken 1:1 from <https://getbootstrap.com/docs/5.3/examples/> (`favicon.ico`,
`apple-touch-icon.png`, `favicon-32x32.png`, `favicon-16x16.png`,
`safari-pinned-tab.svg`, `android-chrome-{192,512}x192.png`,
`manifest.json`) — the same "B" icon set that the official Bootstrap example
pages ship, under the MIT license. `manifest.json` deliberately carries
placeholders (`"name": "Your Site Name"`) instead of "Bootstrap" — adjust it
for your own use. `link.tpl` includes everything, including
`<link rel="manifest">`, `<link rel="mask-icon">` and `theme-color`, exactly
as in the Bootstrap reference example.

The navbar **logo** (`images/logo.png`, included in `page_header.tpl`) is the
Exponential CMS brand itself (`design/standard/images/setup/2/Exponential-logo-title.png`
in the kernel, adopted here as a project-neutral default logo) — not a
customer or project logo. Next to it the current `SiteName` is shown as text.

Both file groups are resolved through the `ezdesign()` operator, which walks
the normal eZ SiteDesign fallback chain. To use your own favicons/logo, do
not touch any templates — instead, in your own `site_<project>` extension:

1. Create `design/<yourname>/images/` with the desired files
   (only the ones you want to override — the rest falls back to
   `design/bootstrap5/images/`).
2. In `settings/design.ini.append.php` of that extension:
   `[ExtensionSettings] DesignExtensions[]=site_<project>`
3. In the siteaccess configuration set `SiteDesign=<yourname>` **before**
   `AdditionalSiteDesignList[]=bootstrap5` (pagelayout/templates still fall
   back to `bootstrap5`; only the image files are found in your own design
   first).

`extension/site_lernapp/design/lernapp/images/` and
`extension/site_exponential/design/exponential/images/` are working examples
of exactly this pattern (they currently hold custom logo and favicon files
that override the Bootstrap defaults from this extension).
