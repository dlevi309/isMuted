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