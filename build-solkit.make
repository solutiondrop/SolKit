; Drush Make file
;
; Use this file to build a full distribution including Drupal core and the
; "solkit" distribution using the following command...
;
; drush --no-patch-txt make build-solkit.make <target directory>

api = 2
core = 7.x

; Include the definition for how to build Drupal core directly, including
; patches.

includes[] = drupal-org-core.make

; Download the solkit and recursively build all
; of its dependencies.

projects[solkit][type] = profile
; The following two lines allow for pulling the distribution from the drupal
; git repository;
projects[solkit][download][type] = git
projects[solkit][download][branch] = 7.x-1.x
; You can optionally build from a local directory using the make_local drush
; module found at http://drupal.org/project/make_local.
;projects[solkit][download][type] = local
;projects[solkit][download][source] = /Users/scottblackburn/.drush/solkit
