api = 2
core = 7.x

; **********************************************
; ***************** CONTRIB ********************

projects[solkit_wysiwyg][download][type] = git
projects[solkit_wysiwyg][download][branch] = master
projects[solkit_wysiwyg][download][url] = https://github.com/solutiondrop/SolKit-WYSIWYG.git
projects[solkit_wysiwyg][subdir] = apps

; **************** END CONTRIB *****************
; **********************************************

; ************************************************
; ************** SolKit Themes **************

; Radix
; projects[radix_core][version] = 3.x-dev
; projects[radix_core][subdir] = contrib

; Radix Theme
projects[radix][type] = theme
projects[radix][download][type] = git
projects[radix][download][revision] = c854057
projects[radix][download][branch] = 7.x-3.x

projects[solwrap][type] = theme
projects[solwrap][download][type] = git
projects[solwrap][download][branch] = master
projects[solwrap][download][url] = https://github.com/solutiondrop/solwrap.git

; *********** End SolKit Themes *************
; ************************************************

; **********************************************
; ***************** PANOPOLY *******************

; Note that makefiles are parsed bottom-up, and that in Drush concurrency might
; interfere with recursion.
; Therefore PANOPOLY needs to be listed AT THE BOTTOM of this makefile,
; so we can patch or update certain projects fetched by Panopoly's makefiles.

; Someday maybe we can turn this on to just inherit Panopoly
;projects[panopoly][type] = profile
;projects[panopoly][version] = 7.x-1.25
; but, Drupal.org does not support recursive profiles and also does not support
; include[] so we need to copy Panopoly's drupal-org.make file here.


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

; **************** END PANOPOLY ****************
; **********************************************
