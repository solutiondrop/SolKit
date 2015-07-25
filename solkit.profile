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

  // Add the Panopoly App Server to the Installation Process (OPTIONAL)
  //
  // Panopoly leverages the Apps module to enable the many apps that create
  // magic with Panopoly. In order to get this working in your install profile,
  // you need to include the following code to your profile's
  // hook_install_tasks().
  //$panopoly_server = array(
  //  'machine name' => 'panopoly',
  //  'default apps' => array('panopoly_demo'),
  //  'default content callback' => 'panopoly_default_content',
  //);
  //require_once(drupal_get_path('module', 'apps') . '/apps.profile.inc');
  //$tasks = $tasks + apps_profile_install_tasks($install_state, $panopoly_server);

  // Add the Panopoly theme selection to the installation process
  //require_once(drupal_get_path('module', 'panopoly_theme') . '/panopoly_theme.profile.inc');
  //$tasks = $tasks + panopoly_theme_profile_theme_selection_install_task($install_state);

  // Insert additional tasks here.

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

  // Hide some messages from various modules that are just too chatty.
  drupal_get_messages('status');
  drupal_get_messages('warning');

  // Set reasonable defaults for site configuration form
  $form['site_information']['site_name']['#default_value'] = 'SolKit';
  $form['admin_account']['account']['name']['#default_value'] = 'admin';
  $form['server_settings']['site_default_country']['#default_value'] = 'US';
  $form['server_settings']['date_default_timezone']['#default_value'] = 'America/Los_Angeles'; // West coast, best coast

  // Define a default email address if we can guess a valid one
  if (valid_email_address('admin@' . $_SERVER['HTTP_HOST'])) {
    $form['site_information']['site_mail']['#default_value'] = 'admin@' . $_SERVER['HTTP_HOST'];
    $form['admin_account']['account']['mail']['#default_value'] = 'admin@' . $_SERVER['HTTP_HOST'];
  }

  // Do not enable the update manager module by default during installation.
  // This module probably shouldn't be enabled on productions sites where
  // performance is critical.
  $form['update_notifications']['update_status_module']['#default_value'] = array(0, 0);
}

///**
// * Implements hook_form_FORM_ID_alter()
// */
//function panopoly_form_apps_profile_apps_select_form_alter(&$form, $form_state) {
//
//  // For some things there are no need
//  $form['apps_message']['#access'] = FALSE;
//  $form['apps_fieldset']['apps']['#title'] = NULL;
//
//  // Improve style of apps selection form
//  if (isset($form['apps_fieldset'])) {
//    $manifest = apps_manifest(apps_servers('panopoly'));
//    foreach ($manifest['apps'] as $name => $app) {
//      if ($name != '#theme') {
//        $form['apps_fieldset']['apps']['#options'][$name] = '<strong>' . $app['name'] . '</strong><p><div class="admin-options"><div class="form-item">' . theme('image', array('path' => $app['logo']['path'], 'height' => '32', 'width' => '32')) . '</div>' . $app['description'] . '</div></p>';
//      }
//    }
//  }
//}
