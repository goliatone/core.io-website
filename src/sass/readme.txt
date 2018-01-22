FOLDER STRUCTURE -----------------------------------------

sass /
      main.sass
      elements/
      fonts/
      layouts/
      pages/
      skins/
      utils/

----------------------------------------------------------

main.sass: all imports

    a) Modules:
      utils: mixins
      resets: general resets
      classes: general classes
      elements/all: element mixins (used in skins and elements)

    b) Layouts:
      settings_dim: shared dimension variables
      layout: layout general style

    c) Skins:
      settings_colors: color variables
      skins: all project color definitions (fonts, backgrounds, borders, etc)

    d) Font definitions:
      settings_fonts: font name variables
      font_definitions: all project font definitions (family, size, weight, line-height, etc)

    e) Elements
      elements: all project elements (buttons, navs, searchbars, posts, etc)

    f) Pages
      features: features (index) page style
      modules: modules (plugins) page style
      quickstart: quickstart page style
      docs: documentations page style
