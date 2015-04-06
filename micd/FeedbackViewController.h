#import <UIKit/UIKit.h>
@class FeedbackViewController;

@protocol FeedbackViewControllerDelegate <NSObject>

- (void)showMailComposer:(FeedbackViewController *)popoverViewController;
- (void)showAppStore:(FeedbackViewController *)popoverViewController;
- (void)nevermind:(FeedbackViewController *)popoverViewController;

@end

@interface FeedbackViewController : UIViewController

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithLovesMicd:(BOOL)lovesMicd delegate:(id<FeedbackViewControllerDelegate>)delegate;

@end
