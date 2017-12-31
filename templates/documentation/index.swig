
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="x-ua-compatible" content="ie=edge">

  <title>Documentation</title>
  <meta name="description" content="{{metadata.description}}">
  <meta name="keywords" content="{{metadata.keywords}}">
  <meta name="author" content="{{metadata.author}}">

  <link rel="apple-touch-icon" href="apple-touch-icon.png">
  <!-- Place favicon.ico in the root directory -->

  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <link rel="stylesheet" href="/css/main.css">

  <!-- highlight js -->
  <link rel="stylesheet" href="/js/vendor/highlight-common/styles/atelier-dune-dark.css">
</head>

<body>

  <div class="docs midnight-mode layout-app">

    <div class="highlight-bar"></div>

    <header class="row row-vCentered">

      <!-- HEADER LOGO -->
      <div class="logo">
        <a href="/"><img src="/img/logo/c_core.svg" alt="Core.io" title="Core.io"/></a>
      </div><!-- END HEADER LOGO -->

      <!-- Header Navigation Bar -->
      <nav id="main-nav" class="nav-bar-1">
        <div class="menu-item">
          <a href="/">Features</a>
        </div>
        <div class="menu-item">
          <a href="/quickstart.html">Quickstart</a>
        </div>
        <div class="menu-item">
          <a href="/documentation/about.html">Documentation</a>
        </div>
        <div class="menu-item">
          <a href="/modules.html">Modules</a>
        </div>
      </nav><!-- END Header Navigation Bar -->

    </header><!-- END SECTION HEADER -->

    <div class="content">

      <div class="row row-vCentered">
      <!-- Documentation Navigation Bar -->
      <nav id="docs-nav" class="nav-bar-2">
        <div class="menu-item">
          <a href="/documentation/guide/index.html">Guide</a>
        </div>
        <div class="menu-item">
          <a href="/documentation/api/index.html">API</a>
        </div>
        <div class="menu-item">
          <a href="/documentation/examples/index.html">Examples</a>
        </div>
      </nav><!-- END Documentation Navigation Bar -->

        <div class="label highlight">
          <span>{{metadata.library.version}}</span>
        </div>
      </div>

      <hr class="hr-light">

      <div class="cols">
        <div class="col-2">
          <!-- Documentation Side Menu -->
          <nav id="docs-side-menu" class="side-menu">
            <ul>
            {%- for item in metadata.sidebar.items  %}
                <li>
                    <a href="{{item.link}}">{{item.name}}</a>
                    {%- if item.children.length > 0 %}
                    <ul>
                    {% for child in item.children  %}
                    <li><a href="{{child.link}}">{{child.name}}</a> </li>
                    {% endfor %}
                    </ul>
                    {% endif %}
                </li>
            {% endfor %}
            </ul>
            </nav><!-- END Documentation Side Menu -->
        </div>

        <div class="col-2">
          <div id="guide" class="main-txt">
            <!-- START CONENT BLOCK -->
            {% autoescape false %}
                {{ content }}
            {% endautoescape %}
            <!-- END CONENT BLOCK -->

            <!--div class="link-pagination">
              <a href="#">Next: Application</a>
            </div-->
            
          </div>
        </div>
      </div>

    </div><!-- END CONTENT -->

    <footer>
      <div class="cols cols-centered">

        <div class="col-3">
          <div class="footer-logo">
            <a href="features.html"><img src="/img/logo/mosca.svg" title="Core.io" alt="Core.io"/></a>
          </div>

          <div class="footer-menu">
            <a href="index.html">Features</a>
            <a href="quickstart.html">Quickstart</a>
            <a href="documentation.html">Documentation</a>
            <a href="modules.html">Modules</a>
          </div>
        </div>

        <div class="col-3">
          <div class="footer-releases">
            <p>Latest Release: 0.2.8 (Jun 01, 2017)</p>
            <p>Documentation Generated: {{metadata.date}}</p>
          </div>
        </div>

        <div class="col-3">
          <div class="footer-github">
            <a href="#" class="row row-vCentered">
              <img src="/img/icons/github-icon-2.png" alt="Core.io in Github" title="Github" />Github
            </a>
          </div>
        </div>
      </div>

      <div class="row row-centered copyright">
        <p>Copyright &#169; 2017 goliatone. The contents of this page are licensed MIT license.</p>
      </div>
    </footer>
  </div><!-- END docs midnight-mode layout-app -->


  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script>window.jQuery || document.write('<script src="js/vendor/jquery-3.1.1.min.js"><\/script>')</script>
  <script src="/js/vendor/highlight-common/highlight.pack.js"></script>
  <script>hljs.initHighlightingOnLoad();</script>
  <script src="/js/main.min.js"></script>

</body>

</html>
