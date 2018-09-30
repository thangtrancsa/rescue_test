<title>Pokemon</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="keywords" content="{$MainKeyword}"/>
<meta name="description" content="{$MainDescription}"/>
<meta name="robots" content="index, follow"/>
<meta name="revisit-after" content="7 days"/>
<meta name="author" content="VPSolution"/>
<meta name="copyright" content="2015 VPSolution"/>
<meta property="og:title" content="{$MainTitle}"/>
<meta property="og:description" content="{$MainDescription}"/>
<meta property="og:image" content="{image_url()}{$MainImage}"/>

<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="shortcut icon" href="{base_url()}static/default/images/favicon.ico" type="image/x-icon"/>
<!-- Place favicon.ico in the root directory -->

<link rel="stylesheet" href="{base_url()}static/default/css/bootstrap.min.css">
<link rel="stylesheet" href="{base_url()}static/default/css/font-awesome.min.css">

<script src="{base_url()}static/default/js/jquery-3.2.1.min.js"></script>
<script src="{base_url()}static/default/js/bootstrap.min.js"></script>
<script src="{base_url()}static/default/js/jquery.debounce.min.js"></script>

<script>
    $(function(){
        $("#search").on("keyup", function() {
            var value = $(this).val().toLowerCase();
            $("#myTable tr").filter(function() {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });
    });
</script>

<style>
    table {
        font-family: arial, sans-serif;
        border-collapse: collapse;
        width: 100%;
    }

    td, th {
        border: 1px solid #dddddd;
        text-align: left;
        padding: 8px;
    }

    tr:nth-child(even) {
        background-color: #dddddd;
    }
</style>