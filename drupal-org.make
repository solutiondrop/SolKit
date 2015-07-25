api = 2
core = 7.x

; MAKE file for SolKit RELEASE version.  Used by Drupal.org packager
; Drupal.org does not support recursive include[] files so everything is in this file

; ******************** RELEASE *******************

; projects[oa_core][subdir] = contrib
; projects[oa_core][version] = 2.57

; ************************************************
; ************* SolKit Builtin Apps *********

projects[solkit_wysiwyg][type] = "module"
projects[solkit_wysiwyg][subdir] = "solapps"
projects[solkit_wysiwyg][download][url] = "git@github.com:solutiondrop/solkit-wysiwyg.git"
projects[solkit_wysiwyg][download][type] = "git"
projects[solkit_wysiwyg][download][branch] = "master"

; ******** End SolKit Builtin Apps **********
; ************************************************


; ************************************************
; ************* SolKit Core Addon Apps ******
; (Local optional apps that included by default)

; ***************** End Apps *********************
; ************************************************


; ************************************************
; ************** SolKit Themes **************

; Radix
projects[radix_core][version] = 3.x-dev
projects[radix_core][subdir] = contrib

projects[solwrap][type] = theme
projects[solwrap][download][url] = "git@github.com:solutiondrop/solwrap.git"
projects[solwrap][download][type] = "git"
projects[solwrap][download][branch] = "master"

; *********** End SolKit Themes *************
; ************************************************

; ************************************************
; ******************* PANOPOLY *******************

; Note that makefiles are parsed bottom-up, and that in Drush 5 concurrency might
; interfere with recursion.
; Therefore PANOPOLY needs to be listed AT THE BOTTOM of this makefile,
; so we can patch or update certain projects fetched by Panopoly's makefiles.
; NOTE: If you are running Drush 6, this section should be placed at the TOP

; The Panopoly Foundation

projects[panopoly_core][version] = 1.25
projects[panopoly_core][subdir] = panopoly

projects[panopoly_images][version] = 1.25
projects[panopoly_images][subdir] = panopoly

projects[panopoly_theme][version] = 1.25
projects[panopoly_theme][subdir] = panopoly

projects[panopoly_magic][version] = 1.25
projects[panopoly_magic][subdir] = panopoly

projects[panopoly_widgets][version] = 1.25
projects[panopoly_widgets][subdir] = panopoly

projects[panopoly_admin][version] = 1.25
projects[panopoly_admin][subdir] = panopoly

projects[panopoly_users][version] = 1.25
projects[panopoly_users][subdir] = panopoly

; The Panopoly Toolset

projects[panopoly_pages][version] = 1.25
projects[panopoly_pages][subdir] = panopoly

projects[panopoly_wysiwyg][version] = 1.25
projects[panopoly_wysiwyg][subdir] = panopoly

projects[panopoly_search][version] = 1.25
projects[panopoly_search][subdir] = panopoly

; For running the automated tests.

projects[panopoly_test][version] = 1.25
projects[panopoly_test][subdir] = panopoly


; ***************** End Panopoly *****************
; ************************************************

; ************************************************
; ************** SolKit Contrib *************

projects[ckeditor][version] = 1.16
projects[ckeditor][subdir] = contrib

projects[bootstrap_library][version] = 1.4
projects[bootstrap_library][subdir] = contrib


; *********** End SolKit Contrib ************
; ************************************************
