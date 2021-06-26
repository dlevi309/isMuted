#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface AVPlayer (Custom)
@property (nonatomic, getter=isMuted) BOOL muted;
@end

/* indicates whether or not audio output of the player is muted. Only affects audio muting for the player instance and not for the device. */

%hook AVPlayer
- (bool)isMuted { return NO; }
- (void)setMuted:(bool)arg1 {
    arg1 = NO;
    %orig;
}
%end

/* Hooks to record continuously￼ even if the device is locked (thank you Muirey03). */

%hook RPRecordingManager
-(void)setUpDeviceLockNotifications {}
-(void)setDeviceLocked:(BOOL)arg1 { %orig(NO); }
-(BOOL)deviceLocked { return NO; }
%end

%hook RPControlCenterModuleViewController
-(void)moduleAuthenticateWithCompletionHandler:(void(^)(BOOL))arg1 { arg1(YES); }
%end