#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

#import <Cordova/CDVPlugin.h>

@interface Volume : CDVPlugin {}
- (void) getVolume:(CDVInvokedUrlCommand*)command;
@end
