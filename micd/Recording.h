#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class AVAsset;

struct Length {
    NSInteger hours;
    NSInteger minutes;
    NSInteger seconds;
    NSInteger centiseconds;
};

@interface Recording : NSObject <UIActivityItemSource>

@property (nonatomic, strong, readonly) NSUUID *uuid;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong, readonly) NSArray *tags;
@property (nonatomic, assign) NSTimeInterval currentPlaybackPosistion;

@property (nonatomic, copy, readonly) NSData *data;
@property (nonatomic, weak, readonly) AVAsset *avAsset;

@property (nonatomic, strong, readonly) NSDate *date;
@property (nonatomic, strong, readonly) NSDateComponents *dateComponents;
@property (nonatomic, strong) NSString *dateAsFullString;
@property (nonatomic, strong) NSString *dateAsString;

@property (nonatomic, assign, readonly) NSTimeInterval lengthAsTimeInterval;
@property (nonatomic, assign, readonly) struct Length length;
@property (nonatomic, weak, readonly) NSString *lengthToDiplay;

@property (nonatomic, weak, readonly) NSString *urlString;

- (instancetype)initWithData:(NSData *)data date:(NSDate *)startDate length:(NSTimeInterval)length title:(NSString *)title;
- (instancetype)initWithData:(NSData *)data date:(NSDate *)startDate length:(NSTimeInterval)length;

//TODO: make init method for keyedunarchiver and pass in all archived data (including UUID)

- (BOOL)addTag:(NSString *)tag;
- (BOOL)removeTag:(NSString *)tag;
- (NSURL *)url;

@end
