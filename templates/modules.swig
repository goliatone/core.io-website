{% extends 'layouts/layout-1.html' %}

{% block title %}Modules{% endblock %}

{% block page %}modules{% endblock %}

{% block content %}
<!-- MESSAGE BOX -->
<div class="message-box row row-centered row-vCentered">
  <span>Wait for it</span>
</div><!-- END MESSAGE BOX -->

{% for post in metadata.posts %}
<!-- POST -->
<div class="row">
  <div class="post cols">
    <div>
      <!-- POST TITLE, VERSION and DESCRIPTION -->
      <div class="row row-vCentered">
        <div class="title h-small">
          <a href="">{{post.title}}</a>
        </div>
        <div class="tag">
          <span>{{post.version}}</span>
        </div>
      </div>
      <div class="row">
        <div class="description p-medium-1">
          <p>{{post.description}}</p>
        </div>
      </div>
    </div>

    <!-- POST LABELS AND ACCES ICON -->
    <div class="row">
      <div class="labels row">
        {% for label in post.labels %}
        <div class="label {{label.tyoe}} uppercase">
          <span>{{label.txt}}</span>
        </div>
        {% endfor %}
      </div>

      <div class="author tag">
        <span><span class="p-smallest">by</span> {{post.author}}</span>
      </div>
    </div>
  </div><!-- END POST -->
  {% endfor %}
</div>
{% endblock %}
