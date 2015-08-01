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

; projects[panopoly_wysiwyg][version] = 1.25
; projects[panopoly_wysiwyg][subdir] = panopoly

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

projects[variable][version] = 2.5
projects[variable][subdir] = contrib

projects[panopoly_seo][version] = 1.0-beta3
projects[panopoly_seo][subdir] = panopoly

; **************** END PANOPOLY ****************
; **********************************************

; Radix

; projects[radix_core][version] = 1.x-dev
; projects[radix_core][subdir] = contrib
; projects[radix_core][download][type] = git
; projects[radix_core][download][branch] = 7.x-3.x
; projects[radix_core][download][revision] = b52ea5d

; Radix Theme

projects[radix][type] = theme
projects[radix][version] = 3.0-rc4

; Radix Modules

; projects[radix_layouts][type] = module
; projects[radix_layouts][download][type] = git
; projects[radix_layouts][version] = 3.4
; projects[radix_layouts][subdir] = contrib

projects[radix_views][version] = 1.0
projects[radix_views][subdir] = contrib


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
projects[features_override][version] = 2.0-rc2
projects[features_override][subdir] = contrib

; advagg
projects[advagg][version] = 2.14
projects[advagg][subdir] = contrib

; blockify
projects[blockify][version] = 1.2
projects[blockify][subdir] = contrib

; cacheflush
projects[cacheflush][version] = 3.0-alpha1
projects[cacheflush][subdir] = contrib

; clean_markup
projects[clean_markup][version] = 2.7
projects[clean_markup][subdir] = contrib

; CKeditor
projects[ckeditor][version] = 1.16
projects[ckeditor][subdir] = contrib

; ds
projects[ds][version] = 2.11
projects[ds][subdir] = contrib

; elements
projects[elements][version] = 1.4
projects[elements][subdir] = contrib

; fences
projects[fences][version] = 1.0
projects[fences][subdir] = contrib

; field_collection
projects[field_collection][version] = 1.0-beta8
projects[field_collection][subdir] = contrib

; google_analytics
projects[google_analytics][version] = 2.1
projects[google_analytics][subdir] = contrib

; hotjar
projects[hotjar][version] = 1.0
projects[hotjar][subdir] = contrib

; html5_tools
projects[html5_tools][version] = 1.2
projects[html5_tools][subdir] = contrib

; mailchimp
projects[mailchimp][version] = 3.4
projects[mailchimp][subdir] = contrib

; mailsystem
projects[mailsystem][version] = 2.34
projects[mailsystem][subdir] = contrib

; mandrill
projects[mandrill][version] = 2.1
projects[mandrill][subdir] = contrib

; picture
projects[picture][version] = 2.11
projects[picture][subdir] = contrib

; profiler_builder
projects[profiler_builder][version] = 1.2
projects[profiler_builder][subdir] = contrib

; responsive_favicons
projects[responsive_favicons][version] = 1.0
projects[responsive_favicons][subdir] = contrib

; semanticviews
projects[semanticviews][version] = 1.0-rc2
projects[semanticviews][subdir] = contrib

; webform
projects[webform][version] = 4.10
projects[webform][subdir] = contrib

; Link Widget Sandbox module
projects[link_widget][type] = module
projects[link_widget][download][type] = "git"
projects[link_widget][download][branch] = "7.x-1.x"
projects[link_widget][download][url] = "http://git.drupal.org/sandbox/droath/1992732.git"
projects[link_widget][subdir] = contrib

; Field Widget Storage API Sandbox module
projects[field_widget_sql_storage][type] = module
projects[field_widget_sql_storage][download][type] = "git"
projects[field_widget_sql_storage][download][branch] = "7.x-1.x"
projects[field_widget_sql_storage][download][url] = "http://git.drupal.org/sandbox/droath/1992692.git"
projects[field_widget_sql_storage][subdir] = contrib

; projects[solkit_wysiwyg][type] = module
; projects[solkit_wysiwyg][download][type] = "git"
; projects[solkit_wysiwyg][download][branch] = "master"
; projects[solkit_wysiwyg][download][url] = "https://github.com/solutiondrop/SolKit-WYSIWYG.git"
; projects[solkit_wysiwyg][subdir] = solkit

; **************** END CONTRIB *****************
; **********************************************
