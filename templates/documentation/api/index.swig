<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>Documentation | application-core {{metadata.library.version}}</title>

    <meta name="description" content="{{metadata.description}}">
    <meta name="keywords" content="{{metadata.keywords}}">
    <meta name="author" content="{{metadata.author}}">

    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" href="/documentation/api/assets/css/main.css">
    <link rel="stylesheet" href="/documentation/api/assets/css/style.css">

</head>

<body>

    <div class="docs midnight-mode layout-app">
        <div class="highlight-bar"></div>

        <header class="row row-vCentered">

            <!-- HEADER LOGO -->
            <div class="logo">
                <a href="/">
                    <img src="/documentation/api/assets/img/logo/c_core.svg" alt="Core.io" title="Core.io">
                </a>
            </div>
            <!-- END HEADER LOGO -->

            <!-- Header Navigation Bar -->
            <nav id="main-nav" class="nav-bar-1">
                <div class="menu-item">
                    <a href="/">Features</a>
                </div>
                <div class="menu-item">
                    <a href="/quickstart">Quickstart</a>
                </div>
                <div class="menu-item">
                    <a class="selected" href="/documentation">Documentation</a>
                </div>
                <div class="menu-item">
                    <a href="/modules">Modules</a>
                </div>
            </nav>
            <!-- END Header Navigation Bar -->
        </header>
        <!-- END SECTION HEADER -->

        <div class="content api">
            <div class="sticky nav">
                <div class="bg-menu"></div>
                <div class="row row-vCentered">
                    <!-- Documentation Navigation Bar -->
                    <nav id="docs-nav" class="nav-bar-2">
                        <div class="menu-item">
                            <a href="/documentation/about">Guide</a>
                        </div>
                        <div class="menu-item">
                            <a class="selected" href="#">API</a>
                        </div>
                        <div class="menu-item">
                            <a href="/examples">Examples</a>
                        </div>
                    </nav>
                    <!-- END Documentation Navigation Bar -->

                    <div class="label highlight">
                        <span>0.8.1</span>
                    </div>
                </div>

                <hr class="sticky hr-light">
            </div>

            <!-- START CONENT BLOCK -->
            <div class="cols">
            {% autoescape false %} {{ content }} {% endautoescape %}
            <!-- END CONENT BLOCK -->
            </div>
        </div>
    </div>
    </div>

    <footer>
        <div class="cols cols-centered">

            <div class="col-3">
                <div class="footer-logo">
                    <a href="/">
                        <img src="/documentation/api/assets/img/logo/mosca.svg" title="Core.io" alt="Core.io">
                    </a>
                </div>

                <div class="footer-menu">
                    <a href="/">Features</a>
                    <a href="/quickstart">Quickstart</a>
                    <a href="/documentation">Documentation</a>
                    <a href="/modules">Modules</a>
                </div>
            </div>

            <div class="col-3">
                <div class="footer-releases">
                    <p>Latest Release: 0.2.8 (Jun 01, 2017)</p>
                </div>
            </div>

            <div class="col-3">
                <div class="footer-github">
                    <a href="#" class="row row-vCentered">
                        <img src="/documentation/api/assets/img/icons/github-icon-2.png" alt="Core.io in Github" title="Github" />Github
                    </a>
                </div>
            </div>
        </div>

        <div class="row row-centered copyright">
            <p>Copyright &#xA9; 2017 goliatone. The contents of this page are licensed MIT license.</p>
        </div>
    </footer>
    </div>

    <script src="/documentation/api/assets/anchor.js"></script>
    <!-- <script src='assets/split.js'></script> -->
    <script src="/documentation/api/assets/site.js"></script>
    <!-- <script src='assets/nav.js'></script> -->


</body>

</html>