<!DOCTYPE html>
<head>
    {include file='layouts/_head.inc.tpl'}
</head>

<body>
{$MainContent}
<!--------------------CORE FOOTER - NO DELETE----------------------------------------->
{if is_access('admin_users', 'r')}
    <div style="display:inline-block;position:fixed;right:5px;bottom:0;padding:5px 10px;background:#333333;font-weight:700;z-index:9999">
        <a href="{base_url('users/admin_users/dashboard')}" style="">{lang('Admin')}</a> |
        <a href="{base_url('users/logout')}" style="">{lang('Logout')}</a>
    </div>
{/if}

{if $alert}{$alert}{else}{get_global_alert()}{/if}
<!--------------------END CORE FOOTER - NO DELETE----------------------------------------->

{include file='layouts/_modal.inc.tpl'}
</body>
</html>