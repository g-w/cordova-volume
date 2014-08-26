#import "Volume.h"

@implementation Volume {
  NSString* changeCallbackId;
}

- (void) pluginInitialize {
  [super pluginInitialize];
  [[AVAudioSession sharedInstance] setActive:YES error:nil];

  [[AVAudioSession sharedInstance] addObserver:self forKeyPath:@"outputVolume" options:NSKeyValueObservingOptionNew context:nil];
}

- (void) getVolume:(CDVInvokedUrlCommand*)command {
  [self sendCurrentVolumeTo:command.callbackId];
}

- (void) setVolumenChangeCallback:(CDVInvokedUrlCommand*) command {
  if (changeCallbackId) {
    NSLog(@"Overwritting volumeChangeCallback: %@!", changeCallbackId);
  }

  changeCallbackId = command.callbackId;
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
  if (changeCallbackId && [keyPath isEqual:@"outputVolume"]) {
    [self sendCurrentVolumeTo:changeCallbackId];
  }
}

- (void) sendCurrentVolumeTo:(NSString*) callbackId {
  CDVPluginResult* result = [self currentVolume];
  [result setKeepCallback:[NSNumber numberWithBool:YES]];
  [self.commandDelegate sendPluginResult: result callbackId:callbackId];
}

- (CDVPluginResult*) currentVolume {
  AVAudioSession* audioSession = [AVAudioSession sharedInstance];
  float volume = audioSession.outputVolume;

  return [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDouble:volume];
}

@end
