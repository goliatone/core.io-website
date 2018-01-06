{% extends 'layouts/layout-1.html' %}

{% block title %}Modules{% endblock %}

{% block page %}modules{% endblock %}

{% block content %}
      <!-- SEARCH BAR -->
      <div class="row row-centered">
        <div class="search-bar-1">
          <input id="search-modules" name="search-modules" placeholder="Search modules" maxlength="150">
          <span class="icon icon-search"><img src="/img/icons/search-icon.png" alt="Search" title="Search"/></span>
        </div>
      </div><!-- END SEARCH BAR -->

      <!-- MODULES -->
      <div class="posts">
        <!-- MESSAGE BOX -->
        <div class="message-box row row-centered row-vCentered">
          <span>Wait for it</span>
        </div><!-- END MESSAGE BOX -->

        {% for post in metadata.posts %}
        <!-- POST -->
        <div class="row">
          <div class="post cols">
            <!-- POST TITLE, VERSION and DESCRIPTION -->
            <div>
              <div class="row row-vCentered">
                <a  class="title h-small" href="">{{post.title}}</a>
                <span class="tag">{{post.version}}</span>
              </div>
              <p class="row description p-medium-1">{{post.description}}</p>
            </div>

            <!-- POST LABELS AND ACCES ICON -->
            <div class="row">
              <div class="labels row">
                {% for label in post.labels -%}
                <span class="label {{label.type}} uppercase">{{label.txt}}</span>
                {% endfor %}
              </div>
              <span class="author tag"><span class="p-smallest">by</span> {{post.author}}</span>
            </div>
          </div>
        </div><!-- END POST -->
        {% endfor %}
      </div>
    {%- endblock %}
