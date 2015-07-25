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

; projects[oa_admin][version] = 2.1
; projects[oa_admin][subdir] = apps

; ***************** End Apps *********************
; ************************************************


; ************************************************
; ************** SolKit Themes **************

; Radix
projects[radix_core][version] = 3.x-dev
projects[radix_core][subdir] = contrib

projects[solwrap][type] = theme
projects[solwrap][download][type] = "git"
projects[solwrap][download][url] = "https://github.com/solutiondrop/solwrap.git"

; *********** End SolKit Themes *************
; ************************************************

; ************************************************
; ******************* PANOPOLY *******************

; Note that makefiles are parsed bottom-up, and that in Drush 5 concurrency might
; interfere with recursion.
; Therefore PANOPOLY needs to be listed AT THE BOTTOM of this makefile,
; so we can patch or update certain projects fetched by Panopoly's makefiles.
; NOTE: If you are running Drush 6, this section should be placed at the TOP

projects[panopoly_core][version] = 1.25
projects[panopoly_core][subdir] = panopoly
; Update to latest Panelizer
projects[panopoly_core][patch][2429549] = https://www.drupal.org/files/issues/2429549-panopoly_core-panelizer-32.patch
; projects[panopoly_core][patch][2477347] = https://www.drupal.org/files/issues/2477347-panopoly_core-views-2.patch
; projects[panopoly_core][patch][2477363] = https://www.drupal.org/files/issues/2477363-panopoly_core-ctools-10.patch
; projects[panopoly_core][patch][2477369] = https://www.drupal.org/files/issues/2477369-panopoly_core-entity-1.patch
; projects[panopoly_core][patch][2477375] = https://www.drupal.org/files/issues/2477375-panopoly_core-entityreference-1.patch
; projects[panopoly_core][patch][2477379] = https://www.drupal.org/files/issues/2477379-panopoly_core-token-1.patch
; Update Apps to 1.0
projects[panopoly_core][patch][2510944] = https://www.drupal.org/files/issues/2510944-panopoly_core-apps-1.patch

projects[panopoly_images][version] = 1.25
projects[panopoly_images][subdir] = panopoly
; Manualcrop is showing for videos
projects[panopoly_images][patch][2521968] = https://www.drupal.org/files/issues/panopoly_images-manualcrop_is_showing_for_videos-2521968-1.patch

projects[panopoly_theme][version] = 1.25
projects[panopoly_theme][subdir] = panopoly

projects[panopoly_magic][version] = 1.25
projects[panopoly_magic][subdir] = panopoly

projects[panopoly_widgets][version] = 1.25
projects[panopoly_widgets][subdir] = panopoly
; Clicking images in My Library and My Files doesn't select them
projects[panopoly_widgets][patch][2473495] = https://www.drupal.org/files/issues/clicking_images_in_my-2473495-7.patch
; projects[panopoly_widgets][patch][2477397] = https://www.drupal.org/files/issues/2477397-panopoly_widgets-file_entity-2.patch

projects[panopoly_admin][version] = 1.25
projects[panopoly_admin][subdir] = panopoly

projects[panopoly_users][version] = 1.25
projects[panopoly_users][subdir] = panopoly

projects[panopoly_pages][version] = 1.25
projects[panopoly_pages][subdir] = panopoly

projects[panopoly_wysiwyg][version] = 1.25
projects[panopoly_wysiwyg][subdir] = panopoly

projects[panopoly_search][version] = 1.25
projects[panopoly_search][subdir] = panopoly
projects[panopoly_search][patch][2469005] = https://www.drupal.org/files/issues/2469005-panopoly_search-search_api-1.patch

; ***************** End Panopoly *****************
; ************************************************

; ************************************************
; ************** SolKit Contrib *************

; projects[bootstrap_tour][version] = 2.4
; projects[bootstrap_tour][subdir] = contrib

projects[ckeditor][version] = 1.16
projects[ckeditor][subdir] = contrib

projects[bootstrap_library][version] = 1.4
projects[bootstrap_library][subdir] = contrib


; *********** End SolKit Contrib ************
; ************************************************
