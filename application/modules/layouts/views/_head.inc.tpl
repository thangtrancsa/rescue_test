<title>{$MainTitle}</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="keywords" content="{$MainKeyword}"/>
<meta name="description" content="{$MainDescription}"/>
<meta name="robots" content="index, follow"/>
<meta name="revisit-after" content="7 days"/>
<meta name="author" content="VNG"/>
<meta name="copyright" content="2012 VNG"/>
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
<script type="text/javascript" src="{static_base_cache()}js/language/english.js"></script>
<script type="text/javascript" src="{static_base_cache()}js/function.js"></script>
<script type="text/javascript" src="{static_base_cache()}js/ajaxupload.js"></script>
{*<link rel="stylesheet" href="{static_base_cache()}js/fancybox/jquery.fancybox-1.3.4.css" type="text/css" media="screen" />*}
{*<script type="text/javascript" src="{static_base_cache()}js/fancybox/jquery.fancybox-1.3.4.js"></script>*}
{*<script type="text/javascript" src="{static_base_cache()}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>*}
<link rel="stylesheet" href="{static_base_cache()}js/jpaging/paging_style.css" type="text/css" media="screen"/>
<script type="text/javascript" src="{static_base_cache()}js/jpaging/jquery.paginate.js"></script>
<script type="text/javascript" src="{static_base_cache()}js/jpaging/script_basic_load_data_using_jpaging.js"/>

<style type="text/css">
    #back_to_top {
        display: none;
        width: 50px;
        height: 51px;
        position: fixed;
        bottom: 50px;
        right: 20px;
        text-indent: -99999px;
        cursor: pointer;
        background: url('{static_url()}static/basic_view/images/back_to_top.png') no-repeat 0 0;
    }
</style>
<script type="text/javascript">
    $(document).ready(function () {
        $('body').append('<div id="back_to_top">Back to Top</div>');
        $(window).scroll(function () {
            if ($(window).scrollTop() != 0) {
                $('#back_to_top').fadeIn();
            } else {
                $('#back_to_top').fadeOut();
            }
        });
        $('#back_to_top').click(function () {
            $('html, body').animate({scrollTop: 0}, 2000);
        });
    });
</script>
<!--END CORE CSS JS-->

