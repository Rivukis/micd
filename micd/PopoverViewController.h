#import <UIKit/UIKit.h>
@class PopoverViewController;

@protocol PopoverDelegate <NSObject>

- (void)showMailComposer:(PopoverViewController *)popoverViewController;
- (void)finishedPoppingOver:(PopoverViewController *)popoverViewController;

@end

@interface PopoverViewController : UIViewController

@property (nonatomic) BOOL didSayYes;
@property (nonatomic, weak) id<PopoverDelegate> delegate;

@end
