<?php
/**
 * @file solkit.profile
 */

/**
 * Implements hook_install_tasks().
 *
 * Note, these tasks run after the "Configure site" step (where the admin
 * password is set).
 */
function solkit_install_tasks($install_state) {
  // Attempt to increase memory limit to 196M.
  if (ini_get('memory_limit') != '-1' && ini_get('memory_limit') <= '196M' && ini_get('memory_limit') >= '128M') {
    ini_set('memory_limit', '196M');
  }

  // Add custom tasks to the tasks array.
  $tasks = array();

  return $tasks;
}

/**
 * Implements hook_install_tasks_alter()
 */
function solkit_install_tasks_alter(&$tasks, $install_state) {
  // Magically go one level deeper in solving years of dependency problems.
  //
  // Panopoly improves the dependency checking of the core installer which helps
  // simplify sub-profiles. In order to get both of these working in your
  // install profile, you need to include the following code to your profile's
  // hook_install_tasks_alter().
  require_once(drupal_get_path('module', 'panopoly_core') . '/panopoly_core.profile.inc');
  $tasks['install_load_profile']['function'] = 'panopoly_core_install_load_profile';

  // If we only offer one language, define a callback to set this
  require_once(drupal_get_path('module', 'panopoly_core') . '/panopoly_core.profile.inc');
  if (!(count(install_find_locales($install_state['parameters']['profile'])) > 1)) {
    $tasks['install_select_locale']['function'] = 'panopoly_core_install_locale_selection';
  }
}

/**
 * Implements hook_form_FORM_ID_alter()
 */
function solkit_form_install_configure_form_alter(&$form, $form_state) {
  // No changes for drush.
  if (drupal_is_cli()) {
    return;
  }

  // Hide some messages from various modules that are just too chatty.
  drupal_get_messages('status');
  drupal_get_messages('warning');

  // Set reasonable defaults for site configuration form
 
  // Add a default site name.
  if (empty($form['site_information']['site_name']['#default_value'])) {
    $form['site_information']['site_name']['#default_value'] = t('SolKit ');
  }
  $form['admin_account']['account']['name']['#default_value'] = 'admin';
  $form['server_settings']['site_default_country']['#default_value'] = 'US';
  $form['server_settings']['date_default_timezone']['#default_value'] = 'America/Chicago';

  // Define a default email address if we can guess a valid one
  if (valid_email_address('admin@' . $_SERVER['HTTP_HOST'])) {
    $form['site_information']['site_mail']['#default_value'] = 'admin@' . $_SERVER['HTTP_HOST'];
    $form['admin_account']['account']['mail']['#default_value'] = 'admin@' . $_SERVER['HTTP_HOST'];
  }

  // Do not enable the update manager module by default during installation.
  // This module probably shouldn't be enabled on productions sites where
  // performance is critical.
  $form['update_notifications']['update_status_module']['#default_value'] = array(0, 0);

  // Hide Server Settings.
  $form['server_settings']['#access'] = FALSE;

  // Hide Update Notifications.
  $form['update_notifications']['#access'] = FALSE;

}
