api = 2
core = 7.x

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

; Panopoly Recommended

projects[devel][version] = 1.5
projects[devel][subdir] = contrib

; Panopoly Other

projects[panopoly_config][version] = 1.x-dev
projects[panopoly_config][subdir] = panopoly
projects[panopoly_config][download][type] = git
projects[panopoly_config][download][branch] = 7.x-1.x

projects[panopoly_seo][version] = 1.0-beta3
projects[panopoly_seo][subdir] = panopoly

; **************** END PANOPOLY ****************
; **********************************************

; Radix

projects[radix_core][version] = 1.x-dev
projects[radix_core][subdir] = contrib
projects[radix_core][download][type] = git
projects[radix_core][download][branch] = 7.x-3.x
projects[radix_core][download][revision] = b52ea5d

; Radix Theme
; projects[radix][type] = theme
; projects[radix][download][type] = git
; projects[radix][download][revision] = c854057
; projects[radix][download][branch] = 7.x-3.x

; ************************************************
; ************** SolKit Themes **************

projects[solwrap][type] = theme
projects[solwrap][download][type] = git
projects[solwrap][download][branch] = master
projects[solwrap][download][url] = https://github.com/solutiondrop/solwrap.git

; *********** End SolKit Themes *************
; ************************************************

; **********************************************
; ***************** CONTRIB ********************

; Features Override
projects[features_override][type] = module
projects[features_override][download][type] = git
projects[features_override][download][branch] = 7.x-2.x
projects[features_override][subdir] = contrib

; CKeditor
projects[ckeditor][version] = 1.16
projects[ckeditor][subdir] = contrib

projects[solkit_wysiwyg][type] = module
projects[solkit_wysiwyg][download][type] = "git"
projects[solkit_wysiwyg][download][branch] = "master"
projects[solkit_wysiwyg][download][url] = "https://github.com/solutiondrop/SolKit-WYSIWYG.git"
projects[solkit_wysiwyg][subdir] = solkit

; **************** END CONTRIB *****************
; **********************************************
