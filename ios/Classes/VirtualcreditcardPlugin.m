#import "VirtualcreditcardPlugin.h"
#if __has_include(<virtualcreditcard/virtualcreditcard-Swift.h>)
#import <virtualcreditcard/virtualcreditcard-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "virtualcreditcard-Swift.h"
#endif

@implementation VirtualcreditcardPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftVirtualcreditcardPlugin registerWithRegistrar:registrar];
}
@end
