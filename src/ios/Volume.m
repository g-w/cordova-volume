#import "Volume.h"

@implementation Volume

- (void) pluginInitialize {
  [super pluginInitialize];
  [[AVAudioSession sharedInstance] setActive:YES error:nil];
}

- (void) getVolume:(CDVInvokedUrlCommand*)command {
  AVAudioSession* audioSession = [AVAudioSession sharedInstance];
  float volume = audioSession.outputVolume;

    CDVPluginResult* result = [CDVPluginResult
                                    resultWithStatus:CDVCommandStatus_OK
                                     messageAsDouble:volume
                               ];
    [self.commandDelegate sendPluginResult: result callbackId:command.callbackId];
}

@end
