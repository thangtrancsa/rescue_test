<nav class="navbar navbar-default">
    <div class="navbar-header vertical-center">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                data-target="#navbar-collapse" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="{base_url()}">
            <img src="{template_rp_url()}img/header/logo.png"
                 srcset="{template_rp_url()}img/header/logo@2x.png 2x, img/header/logo@3x.png 3x"/></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="navbar-collapse">
        <ul class="nav mr-auto navbar-nav navbar-right vcenter-unknown-height-sm">
            <li class="nav-item">
                <a class="nav-link" href="{base_url()}">
                    <div class="nav-item-image-container green-badge">
                        <span class="nav-item-title">{lang("Dashboard")}</span>
                    </div>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="{base_url()}project/rfqs">
                    <div class="nav-item-image-container green-badge" {if 1==2}data-badge="3"{/if}>
                        <i class="fa fa-2x fa-file-o fa-fw" aria-hidden="true"></i>
                        <span class="nav-item-title">{lang("RFQs")}</span>
                    </div>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="{base_url()}quote/lists">
                    <div class="nav-item-image-container green-badge" {if 1==2}data-badge="4"{/if}>
                        <i class="fa fa-2x fa-file-excel-o fa-fw" aria-hidden="true"></i>
                        <span class="nav-item-title">{lang("Quote")}</span>
                    </div>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="{base_url()}order/lists">
                    <div class="nav-item-image-container green-badge">
                        <i class="fa fa-2x fa-shopping-cart fa-fw" aria-hidden="true"></i>
                        <span class="nav-item-title">{lang("Order")}</span>
                    </div>
                </a>
            </li>
            {if $this->session->userdata("user_id")}
                <li class="nav-item dropdown user-info">
                    <a href="#" class="nav-link" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">
                        <div class="nav-item-image-container green-badge">
                            <i class="fa fa-2x fa-user-circle-o fa-fw" aria-hidden="true"></i>
                            <span class="nav-item-title">{$this->session->userdata("user_fullname")}</span>
                            <i class="fa fa-chevron-down fa-down" aria-hidden="true"></i>
                        </div>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="nav-link" href="{base_url()}profile">{lang("Profile")}</a></li>
                        <li><a class="nav-link" href="{base_url()}logout">{lang("Logout")}</a></li>
                    </ul>
                </li>
            {else}
                <li class="nav-item"><a class="nav-link" href="{base_url()}login">{lang("login")}</a></li>
            {/if}
        </ul>
    </div>
</nav>