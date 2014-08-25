#import "Volume.h"

@implementation Volume

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
