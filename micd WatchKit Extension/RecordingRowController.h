#import <Foundation/Foundation.h>
#import <WatchKit/WatchKit.h>

@interface RecordingRowController : NSObject

@property (weak, nonatomic) IBOutlet WKInterfaceGroup *backgroundGroup;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *recordingTitleLabel;

@end
