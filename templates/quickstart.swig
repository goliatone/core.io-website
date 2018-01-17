{% extends 'layouts/layout-1.html' %}

{% block title %}Quickstart{% endblock %}

{% block page %}quickstart{% endblock %}

{% block content %} {% set bg = true %}
      <section class="paragraph-1 cols row row-vCentered">
        <div class="col-2">
          <div class="side-img side-svg">
            <img src="/img/images/3_cubes.svg" width="100%" height="100%"/>
          </div>
        </div>

        <div class="col-2">
          <h1 class="h-small uppercase">Getting started</h1>
          <hr class="hr-small"/>
          <p class="subheader p-big-1 light">Create your first core.io application in 4 simple steps.<br/>Even if you are new to Node.js this will be easy.</p>
        </div>
      </section><!-- END SECTION -->

      <section class="instrus">
        <hr class="hr-shade"/>

        <div class="instruction_block">
          <h3 class="title h-small">Installing dependencies</h3>
          <div class="description p-small">
            <p>In order to install core.io, you’ll first need to install Node.js. Node is supported on most major operating systems, including MacOS X, Windows, and many flavors of Linux.</p><p>The website has pre-built installers for plenty of platforms, so you can just hop on over to the downloads section of nodejs.org and choose the one that’ll work for you.</p>
          </div>

          <div class="button-wrapper">
            <a href="https://nodejs.org/en/download/" class="button medium-btn blue-btn fade" target="_blank">Node.js</a>
          </div>
        </div><!-- END INSTRUCTION BLOCK -->

        <div class="instruction_block">
          <h3 class="title h-small">Install core.io</h3>
          <div class="description p-small">
            <p>Use npm to install core.io:</p><code class="code-line">$ npm install -g core.io-cli</code><p>This will install core.io-cli and make the core command available in your terminal. To verify it was installed correctly, if you type “core” in your terminal you should see a similar help output:</p>
          </div>

          <div class="code-wrapper">
            <div class="code-block  code-block-2" >
              <pre>$ core —-help</pre>
              <pre>  core.io CLI tool</pre>
              <pre class="code-tight ">  Usage:</pre>
              <pre class="code-tight">    core help                             Show this message</pre>
              <pre class="code-tight">    core --version                        Print out the latest released version of core</pre>
              <pre class="code-tight">    core install [template]               Download and install a [template] from github.</pre>
              <pre>    core new [project-name]               Create a new project</pre>
              <pre class="code-tight">  Example:</pre>
              <pre>    core new myProject                    Create a new project</pre>
              <pre class="code-tight">  version:</pre>
              <pre>    1.0.0</pre>
            </div>
          </div>
        </div><!-- END INSTRUCTION BLOCK -->

        <div class="instruction_block">
          <h3 class="title h-small">Create new project</h3>
          <div class="description p-small">
            <p>To generate a new app, just cd into the directory where you want it to be, and type:</p>
            <code class="code-line">$ core new myProject</code>
            <p class="last">The generator will create a new folder for your application in your current directory, set up an empty project and download all the necessary dependencies.</p>
          </div>
        </div><!-- END INSTRUCTION BLOCK -->

        <div class="instruction_block">
          <h3 class="title h-small">Run</h3>
          <div class="description p-small">
            <p>Run your project by typing:</p>
            <code class="code-line">$ cd ./myProject && npm run</code>
            <p class="last">The generator will create a new folder for your application in your current directory, set up an empty project and download all the necessary dependencies.</p>
          </div>
        </div><!-- END INSTRUCTION BLOCK -->

        <hr class="hr-shade"/>
      </section><!-- END SECTION -->

      <section class="paragraph-2 ">
        <h2 class="h-small">What next?</h2>
        <div class="subheader p-small">
          <p>Here are a few resources that will help get you acquainted with developing on core.io:</p>
          <ul>
            <li><a href="/quickstart.html" title="Use the project generator to create a custom template.">Use the project generator to create a custom template.</a></li>
            <li><a href="/quickstart.html" title="Make a simple blog application.">Make a simple blog application.</a></li>
          </ul>
        </div>
      </section><!-- END SECTION -->
{% endblock %}
