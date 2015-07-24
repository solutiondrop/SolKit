api = 2
core = 7.x

; ************************************************
; ************** SolKit Themes **************

projects[radix][type] = theme
projects[radix][version] = 7.x-3.0-rc3

projects[solwrap][type] = theme
projects[solwrap][download][type] = "git"
projects[solwrap][download][url] = "https://github.com/solutiondrop/solwrap.git"

; *********** End SolKit Themes *************
; ************************************************

; **********************************************
; ***************** CONTRIB ********************

; You can even specify patches to be applied to external library code,
; so long as the patches themselves live on Drupal.org.

libraries[ckeditor][download][type] = get
libraries[ckeditor][download][url] = "http://download.cksource.com/CKEditor/CKEditor/CKEditor%204.5.1/ckeditor_4.5.1_standard.tar.gz"
libraries[ckeditor][destination] = libraries
libraries[ckeditor][directory_name] = ckeditor

; **************** END CONTRIB *****************
; **********************************************

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

projects[panopoly_core][version] = 1.25
projects[panopoly_core][subdir] = panopoly
; Update to latest Panelizer
projects[panopoly_core][patch][2429549] = https://www.drupal.org/files/issues/2429549-panopoly_core-panelizer-32.patch

; Open Atrium patches - probably delete
;projects[panopoly_core][patch][2477347] = https://www.drupal.org/files/issues/2477347-panopoly_core-views-2.patch
;projects[panopoly_core][patch][2477363] = https://www.drupal.org/files/issues/2477363-panopoly_core-ctools-10.patch
;projects[panopoly_core][patch][2477369] = https://www.drupal.org/files/issues/2477369-panopoly_core-entity-1.patch
;projects[panopoly_core][patch][2477375] = https://www.drupal.org/files/issues/2477375-panopoly_core-entityreference-1.patch
;projects[panopoly_core][patch][2477379] = https://www.drupal.org/files/issues/2477379-panopoly_core-token-1.patch

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


; ************************************************
; ************** SolKit Contrib *************

projects[solkit_wysiwyg][download][type] = "git"
projects[solkit_wysiwyg][download][url] = "https://github.com/solutiondrop/SolKit-WYSIWYG.git"
projects[solkit_wysiwyg][subdir] = contrib


; *********** End SolKit Contrib ************
; ************************************************
