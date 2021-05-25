//
//  Generated file. Do not edit.
//

#include "generated_plugin_registrant.h"

#include <virtualcreditcard/virtualcreditcard_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) virtualcreditcard_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "VirtualcreditcardPlugin");
  virtualcreditcard_plugin_register_with_registrar(virtualcreditcard_registrar);
}
