#import "ActivityItemProvider.h"
#import "Recording.h"

@interface ActivityItemProvider ()

@property (nonatomic, strong) NSString *placeholderString;
@property (nonatomic, strong) Recording *recording;

@end

@implementation ActivityItemProvider

-(instancetype)initWithPlaceholderString:(NSString *)placeholderString andRecording:(Recording *)recording {
    self = [super initWithPlaceholderItem:placeholderString];
    if (self) {
        _placeholderString = placeholderString;
        _recording = recording;
    }
    return self;
}

- (id)item
{
    self.recording.title = @"better title";
    return self.recording.url;
}

@end
