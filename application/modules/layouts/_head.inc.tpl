<title>{$MainTitle}</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="keywords" content="{$MainKeyword}"/>
<meta name="description" content="{$MainDescription}"/>
<meta name="robots" content="index, follow"/>
<meta name="revisit-after" content="7 days"/>
<meta name="author" content="VPSolution"/>
<meta name="copyright" content="2018 Rescue"/>
<meta property="og:title" content="{$MainTitle}"/>
<meta property="og:description" content="{$MainDescription}"/>
<meta property="og:image" content="{$MainImage}"/>

<!--CORE CSS JS-->
<link rel="shortcut icon" href="{static_frontend_cache()}images/favicon.ico" type="image/x-icon"/>
<link href="{static_base_cache()}css/jquery.alerts.css" rel="stylesheet" type="text/css"/>
{if $pgRel}{$pgRel}{/if}
<script type="text/javascript">{script_global()}</script>
{*<script type="text/javascript" src="{static_base()}js/jquery-1.6.4.js"></script>*}
<script type="text/javascript" src="{static_base_cache()}js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="{static_base_cache()}js/jquery-ui.min.js"></script>
<script type="text/javascript" src="{static_base_cache()}js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="{static_base_cache()}js/jquery.livequery.js"></script>
<script type="text/javascript" src="{static_base_cache()}js/jquery.alerts.js"></script>
<script type="text/javascript" src="{static_base_cache()}js/function.js"></script>
<link rel="stylesheet" href="{static_base_cache()}js/jpaging/paging_style.css" type="text/css" media="screen"/>
<script type="text/javascript" src="{static_base_cache()}js/jpaging/jquery.paginate.js"></script>
<script type="text/javascript" src="{static_base_cache()}js/jpaging/script_basic_load_data_using_jpaging.js"/>