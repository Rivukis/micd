#import <Foundation/Foundation.h>

@interface FakesForProject : NSObject

+ (NSArray *)fakeArrayOfSearchItems;

+ (void)clearDebugger;
+ (void)addMessageToDebugger:(NSString *)message;
+ (NSArray *)debugMessages;

@end
