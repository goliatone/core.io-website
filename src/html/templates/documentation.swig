{% extends 'layouts/layout-1.html' %}

{% block title %}Documentation{% endblock %}

{% block styles %}
  {% parent %}
  <!-- highlight js -->
  <link rel="stylesheet" href="js/vendor/highlight-common/styles/hybrid.css">
  <script src="js/vendor/highlight-common/highlight.pack.js"></script>
  <script>hljs.initHighlightingOnLoad();</script>
{% endblock %}

{% block page %}docs{% endblock %}

{% block content %}
    <div class="sticky nav">
      <div class="bg-menu"></div>
      <!-- Documentation Navigation Bar -->
      <div class="row row-vCentered">
        <nav id="docs-nav" class="nav-bar-2">
          <ul>
            {% for item in metadata.docs_menu.items -%}
            <li class="menu-item"><a href="{{item.link}}">{{item.txt}}</a></li>
            {% endfor %}
          </ul>
        </nav>
        <span class="label highlight">0.2.8</span>
      </div><!-- END Documentation Navigation Bar -->
      <hr class="sticky hr-light">
    </div>

    <div class="cols">
      <!-- Documentation Side Menu -->
      <nav id="docs-side-menu" class="side-menu">
        <ul>
        {%- for item in metadata.sidebar.items %}
          <li>
            <a href="{{item.link}}">{{item.txt}}</a>
            {% if item.children.length > 0 -%}
            <ul>
              {% for child in item.children -%}
              <li><a href="{{child.link}}">{{child.txt}}</a></li>
              {% endfor -%}
            </ul>
            {% endif -%}
          </li>
        {% endfor -%}
        </ul>
      </nav><!-- END Documentation Side Menu -->

      <div class="col-2">
        <div id="guide" class="main-txt">
          <h3 class="title h-smaller-bold"># core.io documentation</h3>

          <div class="description p-small-light">
            <p><b>core.io</b> provides a structure to quickly prototype Node.js applications of any type, providing a set of guidelines and conventions to ease development.</p>
            <p>In a way <b>core.io</b> aims to be a workflow rather than a framework by providing a common application structure regardless if the application is web, desktop, or data focused.</p>
            <p><b>core.io</b> provides basic building blocks which are useful in any context and help with command tasks like configuration management, logging, dependency management and more basic needs of most applications.</p>
            <p>The heart of <b>core.io</b> is the <a href="#">application context</a>, which you can extend directly with custom logic or indirectly with modules.</p>
            <p><a href="#">Modules</a> are intended to encapsulate code and make it portable. They also serve as glue to integrate libraries like Socket.IO or AMQP into your project.</p>
            <p>Following simple conventions on how files are named and where those files are placed core.io will auto-load, auto-configure, and auto-wire components always leaving you the choice to override defaults or create custom modules to replace core functionality.</p>
          </div>

          <div class="code-block">
            <pre><code>
class MyClass {
constructor(options){
  options = extend({}, MyClass.DEFAULTS, options);
  if(options.autoinitialize) {
      this.init(options);
  }
}

init(options={}) {
  extend(this, options);
}
}

MyClass.DEFAULTS = {
autoinitialize: true;
getName: function() {
  return this.name;
},
name: 'MyClass'
}
            </code></pre>
          </div><!-- END CODE BLOCK -->

          <div class="row link-pagination">
            <a href="#">Previous: Previous</a>
            <a href="#">Next: Application</a>
          </div>
        </div>
      </div>
    </div>
{% endblock %}
