
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

  <!-- build:css /css/main.min.css -->
  <link rel="stylesheet" href="/css/main.css">
  <!-- /build -->

  <!-- highlight js -->
  <link rel="stylesheet" href="/js/vendor/highlight-common/styles/atelier-dune-dark.css">
</head>

<body class="docs">

  <div class="highlight-bar"></div>

  <header class="main-header row row-vCentered">

    <a href="/"><img src="/img/logo/c_core.svg" alt="Core.io" title="Core.io"/></a>

    <nav id="main-nav" class="nav-bar-1">
      <ul>
        <li class="menu-item"><a href="/">Features</a></li>
        <li class="menu-item"><a href="/quickstart.html">Quickstart</a></li>
        <li class="menu-item"><a href="/documentation/about.html">Documentation</a></li>
        <li class="menu-item"><a href="/modules.html">Modules</a></li>
      </ul>
    </nav>

  </header>

  <main class="guide content">

    <div class="sticky nav">
      <div class="bg-menu"></div>
      <div class="row row-vCentered">
        <nav id="docs-nav" class="nav-bar-2">
          <ul>
            <li class="menu-item"><a href="/documentation/guide/index.html">Guide</a></li>
            <li class="menu-item"><a href="/documentation/api/index.html">API</a></li>
            <li class="menu-item"><a href="/documentation/examples/index.html">Examples</a></li>

          </ul>
        </nav>
        <span class="label highlight">{{metadata.library.version}}</span>
      </div>
      <hr class="sticky hr-light">
    </div>

    <div class="row">
      <nav id="docs-side-menu" class="side-menu">
        <ul>
        {%- for item in metadata.sidebar.items %}
          <li class="menu-item">
            <a href="{{item.link}}">{{item.name}}</a>
            {% if item.children.length > 0 -%}
            <ul class="submenu">
              {% for child in item.children -%}
              <li class="menu-item-submenu"><a href="{{child.link}}">{{child.name}}</a></li>
              {% endfor -%}
            </ul>
            {% endif -%}
          </li>
        {% endfor -%}
        </ul>
      </nav>

      <main id="guide" class="main-txt">
        <!-- START CONTENT BLOCK -->
        {% autoescape false %}
          {{ content }}
        {% endautoescape %}
        <!-- END CONTENT BLOCK -->

        <!-- <div class="row link-pagination">
          <a href="#">Previous: Previous</a>
          <a href="#">Next: Application</a>
        </div> -->

      </main>
    </div>
  </main>

  <footer>
    <div class="content cols">
      <div class="row row-centered">
        <div>
          <a class="footer-logo" href="/"><img src="/img/logo/mosca.svg" title="Core.io" alt="Core.io"/></a>

          <nav class="footer-menu">
            <ul>
              <li class="menu-item"><a href="/">Features</a></li>
              <li class="menu-item"><a href="/quickstart.html">Quickstart</a></li>
              <li class="menu-item"><a href="/documentation/about.html">Documentation</a></li>
              <li class="menu-item"><a href="/modules.html">Modules</a></li>
            </ul>
          </nav>
        </div>

        <div class="footer-releases">
          <p>Latest Release: 0.2.8 (Jun 01, 2017)</p>
          <p>Documentation Generated: {{metadata.date}}</p>
        </div>

        <div class="footer-github">
          <a href="#" class="row row-vCentered">
            <img src="/img/icons/github-icon-2.png" alt="Core.io in Github" title="Github" />Github
          </a>
        </div>
      </div>

      <p class="row row-centered copyright">Copyright &#169; 2017 goliatone. The contents of this page are licensed MIT license.</p>
    </div>
  </footer>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script>window.jQuery || document.write('<script src="js/vendor/jquery-3.1.1.min.js"><\/script>')</script>
  <script src="../js/vendor/highlight-common/highlight.pack.js"></script>
  <script>hljs.initHighlightingOnLoad();</script>
  <!-- build:js /js/main.min.js -->
  <script src="/js/main.js"></script>
  <!-- /build -->

</body>

</html>
