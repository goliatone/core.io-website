FOLDER STRUCTURE -----------------------------------------

sass /
      main.sass             ** edit **
      _settings.sass        ** edit **
      _project_style.sass   ** edit ** 
      _skins.css            ** edit **


GLOBAL PROJECT CLASS STRUCTURE ---------------------------

Layout classes:
  * layout-app
  *

Skin classes:
  * midnight-mode



EDITS ----------------------------------------------------

1. In SASS folder -------------------------------


  a) Edit file main.sass:

    LAYOUTS

      Add layout imports, these will go under assigned layout classes.


  b) Edit file _settings.sass:

    GLOBAL 

      Put project Measures, Fonts and Colors here.


    COLOR ASSIGNATIONS

      Put project color assignations here.


    FONT ASSIGNATIONS

      Put project font assignations here.


    CSS

      Put project global css here.


    * These values can be overriden in layouts/ files.

      

  c) Edit file _skins.sass:

    Add skin classes and assignations under corresponding skin class.



  d) Edit file _project_style.sass:

    Add project classes and assignations, as well as project elements.




2. In LAYOUTS folder ----------------------------

  a) Put as many layout_n folders as different layouts exist in project.




3. In LAYOOUT_n folders -------------------------

  a) Put as many page_n folders as pages that use this layout.

    * If several pages use same layout and same settings, they go in  same folder.



  b) Edit file _settings.sass:

    Override top level settings if necessary.  
    Put layout especific assignations.



  c) Edit file _layout.sass:

    LAYOUT
      
      Include layout level styles and elements.


    IMPORTS

      Add page imports.



4. In PAGE_n folder -----------------------------

  







