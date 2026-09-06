  <!-- Path content: START -->
  {if $path_array|count|ge(2)}
  <nav aria-label="breadcrumb">
    <ol class="breadcrumb mb-0">
    {def $path_last_key = $path_array|count|dec}
    {foreach $path_array as $path_key => $path}
      {if and( $path.url, $path_key|ne( $path_last_key ) )}
        <li class="breadcrumb-item"><a href={cond( is_set( $path.url_alias ), $path.url_alias, $path.url )|ezurl}>{$path.text|wash}</a></li>
      {else}
        <li class="breadcrumb-item active" aria-current="page">{$path.text|wash}</li>
      {/if}
    {/foreach}
    </ol>
  </nav>
  {/if}
  <!-- Path content: END -->
