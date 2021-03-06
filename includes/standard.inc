<?php

/**
 * @file
 * Tasks for standard installation.
 */

/**
 * Implements hook_install_tasks().
 */
function standard_install_tasks($tasks, $install_state) {
  // Add a task to select features for Solkit.
  $tasks['solkit_select_features'] = array(
    'display_name' => st('Select features'),
    'type' => 'form',
  );

  // Task to install features.
  $tasks['solkit_install_features'] = array(
    'display_name' => st('Install features'),
    'type' => 'batch',
  );

  return $tasks;
}

/**
 * Shows the features form for the Solkit profile.
 */
function solkit_select_features($form, &$form_state, &$install_state) {
  drupal_set_title(st('Select features'));

  $message = '<p class="lead">' . st('Select features for your Solkit site.') . '</p>';

  $form = array();
  $form['configure_message'] = array(
    '#markup' => $message,
    '#weight' => -100,
  );

  $options_features = array(
    // 'restaurant_menu' => st('Menu management'),
    // 'restaurant_blog' => st('Blog functionality'),
    // 'restaurant_event' => st('Events and calendar'),
    // 'restaurant_reservation' => st('Reservation system'),
    // 'restaurant_location' => st('Multiple restaurant locations'),
    // 'restaurant_admin' => st('Enhanced administrative interface'),
    'solkit_seo' => st('SEO, clean urls, metatags...etc'),
  );
  $form['features'] = array(
    '#type' => 'checkboxes',
    '#options' => $options_features,
    '#description' => t('Enable these features for your SolKit site.'),
    '#prefix' => '<h4>' . t('Features') . '</h4>',
    '#default_value' => array_keys($options_features),
  );

  $form['actions'] = array(
    '#type' => 'actions',
  );

  $form['actions']['submit'] = array(
    '#type' => 'submit',
    '#value' => st("Install"),
    '#weight' => 10,
    '#attributes' => array(
      'class' => array('btn', 'btn-lg', 'btn-primary'),
    ),
  );

  return $form;
}

function solkit_select_features_submit($form, &$form_state) {
  variable_set('solkit_features', $form_state['values']['features']);
}

/**
 * Install selected features for SolKit
 */
function solkit_install_features() {
  $modules = array();

  // Install features.
  $features = variable_get('solkit_features', array());
  foreach ($features as $feature) {
    $modules[] = $feature;
  }

  // Resolve the dependencies now, so that module_enable() doesn't need
  // to do it later for each individual module (which kills performance).
  $files = system_rebuild_module_data();
  $modules_sorted = array();
  foreach ($modules as $module) {
    if (isset($files[$module]) && $files[$module]->requires) {
      // Create a list of dependencies that haven't been installed yet.
      $dependencies = array_keys($files[$module]->requires);
      $dependencies = array_filter($dependencies, '_solkit_filter_dependencies');
      // Add them to the module list.
      $modules = array_merge($modules, $dependencies);
    }
  }
  $modules = array_unique($modules);
  foreach ($modules as $module) {
    $modules_sorted[$module] = $files[$module]->sort;
  }
  arsort($modules_sorted);

  $operations = array();
  foreach ($modules_sorted as $module => $weight) {
    $operations[] = array('_solkit_enable_module', array($module, $files[$module]->info['name']));
  }

  $batch = array(
    'title' => st('Installing features'),
    'operations' => $operations,
  );

  return $batch;
}

/**
 * BatchAPI callback.
 *
 * @see solkit_install_features()
 */
function _solkit_enable_module($module, $module_name, &$context) {
  module_enable(array($module), FALSE);
  $context['message'] = st('Installed %module module.', array('%module' => $module_name));
}

