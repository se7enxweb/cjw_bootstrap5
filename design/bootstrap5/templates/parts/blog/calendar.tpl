{* Monthly calendar for a blog. Days with posts are linked.

   The calculation logic is deliberately the same as in the ezwebin
   template (month boundaries, weekday offset, collecting the month's
   posts) — only the markup is new: instead of the nested
   calendar-tl/tr/bl/br divs and the hand-set left/right/bottom classes
   on every cell, there is a plain Bootstrap table here. The edge classes
   only served the rounded-corner graphics and have no meaning without
   them.

   Expects $used_node (the blog node). *}

{def $blog_node    = $used_node
     $blog_node_id = $used_node.node_id

     $curr_ts    = currentdate()
     $curr_today = $curr_ts|datetime( custom, '%j' )
     $curr_month = $curr_ts|datetime( custom, '%n' )

     $temp_ts = cond( and( ne( $view_parameters.month, '' ), ne( $view_parameters.year, '' ) ),
                      makedate( $view_parameters.month,
                                cond( ne( $view_parameters.day, '' ), $view_parameters.day,
                                      eq( $curr_month, $view_parameters.month ), $curr_today,
                                      1 ),
                                $view_parameters.year ),
                      currentdate() )}

{def $temp_month = $temp_ts|datetime( custom, '%n' )
     $temp_year  = $temp_ts|datetime( custom, '%Y' )
     $temp_today = $temp_ts|datetime( custom, '%j' )
     $days       = $temp_ts|datetime( custom, '%t' )}

{def $first_ts = makedate( $temp_month, 1, $temp_year )
     $last_ts  = makedate( $temp_month, $days, $temp_year )}

{* Weekday of the first of the month: %w returns 0 = Sunday. The table
   starts on Monday, so Sunday counts as the seventh day. *}
{def $dayone  = $first_ts|datetime( custom, '%w' )
     $span1   = 0
     $day_array = ' '}
{set $span1 = cond( eq( $dayone, 0 ), 6, sub( $dayone, 1 ) )}

{* The upper bound for the post fetch is the first of the next month. *}
{if ne( $temp_month, 12 )}
  {set $last_ts = makedate( $temp_month|sum( 1 ), 1, $temp_year )}
{else}
  {set $last_ts = makedate( 1, 1, $temp_year|sum( 1 ) )}
{/if}

{def $blog_items = fetch( 'content', 'list', hash(
        'parent_node_id', $blog_node_id,
        'sort_by', array( 'attribute', true(), 'blog_post/publication_date' ),
        'class_filter_type', 'include',
        'class_filter_array', array( 'blog_post' ),
        'main_node_only', true(),
        'attribute_filter', array( array( 'blog_post/publication_date', 'between',
                                          array( sum( $first_ts, 1 ), sub( $last_ts, 1 ) ) ) ) ) )

     $url_back    = concat( $blog_node.url_alias, '/(month)/', sub( $temp_month, 1 ), '/(year)/', $temp_year )
     $url_forward = concat( $blog_node.url_alias, '/(month)/', sum( $temp_month, 1 ), '/(year)/', $temp_year )}

{if eq( $temp_month, 1 )}
  {set $url_back = concat( $blog_node.url_alias, '/(month)/12/(year)/', sub( $temp_year, 1 ) )}
{elseif eq( $temp_month, 12 )}
  {set $url_forward = concat( $blog_node.url_alias, '/(month)/1/(year)/', sum( $temp_year, 1 ) )}
{/if}

{* Remember the days with posts. A post can span several days via
   to_time; the comma list is queried below with contains(). *}
{foreach $blog_items as $blog}
  {def $from_day = 1
       $to_day   = $days}
  {if eq( $temp_month|int(), $blog.data_map.publication_date.content.month|int() )}
    {set $from_day = $blog.data_map.publication_date.content.day}
    {set $to_day = cond( $blog.data_map.to_time.content.is_valid, $blog.data_map.publication_date.content.day, $from_day )}
  {/if}
  {for $from_day|int() to $to_day|int() as $counter}
    {set $day_array = concat( $day_array, $counter, ', ' )}
  {/for}
  {undef $from_day $to_day}
{/foreach}

<div class="calendar card mb-4">
  <div class="card-header d-flex align-items-center justify-content-between">
    <a class="btn btn-sm btn-outline-secondary" href={$url_back|ezurl} title="{'Previous month'|i18n( 'design/bootstrap5/blog/calendar' )}">
      <i class="bi bi-chevron-left" aria-hidden="true"></i>
      <span class="visually-hidden">{'Previous month'|i18n( 'design/bootstrap5/blog/calendar' )}</span>
    </a>
    <h2 class="h6 mb-0">{$temp_ts|datetime( custom, '%F' )|upfirst()}&nbsp;{$temp_year}</h2>
    <a class="btn btn-sm btn-outline-secondary" href={$url_forward|ezurl} title="{'Next month'|i18n( 'design/bootstrap5/blog/calendar' )}">
      <span class="visually-hidden">{'Next month'|i18n( 'design/bootstrap5/blog/calendar' )}</span>
      <i class="bi bi-chevron-right" aria-hidden="true"></i>
    </a>
  </div>

  <table class="table table-sm table-bordered text-center mb-0 calendar-table">
    <caption class="visually-hidden">{'Calendar'|i18n( 'design/bootstrap5/blog/calendar' )}</caption>
    <thead>
      <tr>
        <th scope="col">{'Mon'|i18n( 'design/bootstrap5/blog/calendar' )}</th>
        <th scope="col">{'Tue'|i18n( 'design/bootstrap5/blog/calendar' )}</th>
        <th scope="col">{'Wed'|i18n( 'design/bootstrap5/blog/calendar' )}</th>
        <th scope="col">{'Thu'|i18n( 'design/bootstrap5/blog/calendar' )}</th>
        <th scope="col">{'Fri'|i18n( 'design/bootstrap5/blog/calendar' )}</th>
        <th scope="col">{'Sat'|i18n( 'design/bootstrap5/blog/calendar' )}</th>
        <th scope="col">{'Sun'|i18n( 'design/bootstrap5/blog/calendar' )}</th>
      </tr>
    </thead>
    <tbody>
      <tr>
      {* Empty cells before the first of the month *}
      {for 1 to $span1 as $pad}
        <td class="text-body-secondary"></td>
      {/for}

      {def $counter = 1 $dayofweek = 0}
      {while le( $counter, $days )}
        {set $dayofweek = makedate( $temp_month, $counter, $temp_year )|datetime( custom, '%w' )}
        <td class="{if and( eq( $counter, $curr_today ), eq( $curr_month, $temp_month ) )}table-active fw-bold{/if}">
          {if $day_array|contains( concat( ' ', $counter, ',' ) )}
            <a href={concat( $blog_node.url_alias, '/(day)/', $counter, '/(month)/', $temp_month, '/(year)/', $temp_year )|ezurl}>{$counter}</a>
          {else}
            <span class="text-body-secondary">{$counter}</span>
          {/if}
        </td>
        {* Close the row after Sunday (and at the end of the month) *}
        {if and( eq( $dayofweek, 0 ), ne( $counter, $days ) )}
          </tr><tr>
        {/if}
        {set $counter = inc( $counter )}
      {/while}

      {* Empty cells after the last day of the month *}
      {if ne( $dayofweek, 0 )}
        {for $dayofweek to 6 as $pad}
          <td class="text-body-secondary"></td>
        {/for}
      {/if}
      </tr>
    </tbody>
  </table>
</div>

{undef}
