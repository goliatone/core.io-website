{% extends 'layouts/layout-1.html' %}

{% block title %}core.io | The No Framework for rapid prototyping{% endblock %}

{% block page %}features{% endblock %}

{% block content %}
      <section class="paragraph-1 cols">
        <div class="col-2">
          <h1 class="highlight h-biggest">The no framework<br/>for rapid prototyping.</h1>
          <hr class="hr-small"/>
          <div class="subheader p-big-2 shade">
            <p>core.io is a federation of Node.js modules that<br/>focus on development speed.</p>
          </div>

          <button class="button big-btn black-btn fade download"><span>Download</span></button>

          <a href="/quickstart.html" class="button big-btn gray-btn fade">Getting Started</a>

          <div class="p-smallest">
            <p>Latest Release: 0.2.8 (Jun 01, 2017)</p>
          </div>
        </div>

        <div class="col-2">
          <div class="side-img side-svg">
            <img src="/img/images/computer_01.svg" width="100%" height="100%"/>
          </div>
        </div>
      </section><!-- END SECTION -->

      <section class="paragraph-2 cols row row-reverse">
        <div class="col-2">
          <h2 class="h-big">Get a quick start with<br/>project generators.</h2>
          <hr class="hr-small"/>
          <div class="subheader p-medium-2 light">
            <p>Quickly create new project using dynamic project templates.<br/>Creating templates for new projects is fast and easy.</p>
          </div>
        </div>

        <div class="col-2">
          <div class="code-wrapper">
            <div id="code-output" class="code-block bash code-block-1">
              <div class="header">
                <div class="window-controls">
                  <button class="close">Close</button>
                  <button class="minimize">Minimize</button>
                  <button class="maximize">Maximize</button>
                </div>
                <span class="title">bash</span>
              </div>
              <pre>$ npm install -g core.io</pre>
              <pre>$ core new myApp</pre>
              <pre><span class="highlight">created</span> ./myapp</pre>
              <pre class="tab-1">├── ./myapp/modules</pre>
              <pre class="tab-1">└── ./myapp/models</pre>
            </div>
          </div>
        </div>
      </section><!-- END SECTION -->

      <section class="paragraph-3 cols row">
        <div class="col-2">
          <h2 class="h-big">Read the documentation<br/>to get started.</h2>
          <hr class="hr-small"/>
          <div class="subheader p-medium-2 light">
            <p>Next to the documentation, follow tutorials to get started.</p>
          </div>

          <a href="/documentation/about.html" class="button big-btn gray-btn fade">Documentation</a>
        </div>

        <div class="col-2">
          <div class="side-img">
            <img src="/img/images/code_editor.svg" alt="" title="Features"/>
          </div>
        </div>
      </section><!-- END SECTION -->
{% endblock %}
