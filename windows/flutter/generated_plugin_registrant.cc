//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <bitsdojo_window_windows/bitsdojo_window_plugin.h>
#include <contextual_menu/contextual_menu_plugin.h>
#include <encrypt_decrypt_plus/encrypt_decrypt_plus_plugin_c_api.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  BitsdojoWindowPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("BitsdojoWindowPlugin"));
  ContextualMenuPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("ContextualMenuPlugin"));
  EncryptDecryptPlusPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("EncryptDecryptPlusPluginCApi"));
}
