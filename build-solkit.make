; Drush Make file
;
; Use this file to build a full distribution including Drupal core and the
; "solkit" distribution using the following command...
;
; drush --no-patch-txt make build-solkit.make <target directory>

api = 2
core = 7.x

; Include the definition for how to build Drupal core directly, including patches:
includes[] = drupal-org-core.make

; Download the SolKit install profile and recursively build all its dependencies:
projects[solkit][type] = profile
projects[solkit][download][type] = git
projects[solkit][download][url] = https://github.com/solutiondrop/solkit.git