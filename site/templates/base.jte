@import to.etc.sigeto.ContentItem
@import to.etc.sigeto.PageModel

@param PageModel model

<!doctype html>
<html lang="en">
<head>
<title>${model.getTitle()}</title>
<link rel="stylesheet" href='${model.siteURL("css/site.css")}'/>
<link rel="stylesheet" href='${model.siteURL("css/dracula.css")}'/>

<link rel="stylesheet" bhref="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.9.0/styles/default.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.9.0/highlight.min.js"></script>
<script>hljs.highlightAll();</script>
</head>
<body>
<div class="ui-page-top">
    <div class="ui-page-header">
        <img src='${model.siteURL("img/logo-h126.png")}'>
    </div>
    <div class="ui-page-nav">
        <div class="ui-page-bc-cont">
            <div class="ui-page-breadcrumb">
                @for(ContentItem item : model.getBreadcrumbPath())
                    <a class="ui-bc-dir ui-bc-item" href="${model.siteURL(item.getRelativeTargetPath())}"><span>${item.getPageTitle()}</span></a>
                @endfor
                <div class="ui-bc-last ui-bc-item"><span>${model.getItem().getPageTitle()}</span></div>
            </div>
        </div>
        <div class="ui-page-nav-end">
            <a href='${model.siteURL("about.html")}' class="ui-nav-item">
                <span>About</span>
            </a>
        </div>
    </div>
</div>
<div class="ui-page-middle">
    <div class="ui-page-menu">
        <!-- template.menuitem(model, model.getMenuRoot()) -->
    </div>

    <div class="ui-page-content">
        <div class="ui-flex-content">
            $unsafe{model.getContent()}
        </div>
    </div>
</div>
<div class="ui-page-bottom">
    © 2024 by Frits Jalvingh. All information in here can be freely used (MIT License)
</div>

</body>
</html>
