//
//  ShareExtentionController.m
//  micd
//
//  Created by Brian Radebaugh on 4/27/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import "ShareExtensionController.h"
#import <AVFoundation/AVFoundation.h>
#import "Constants.h"
#import "Recording.h"
#import "WireTapStyleKit.h"

@implementation ShareExtensionController

+ (void)presentShareExtensionForRecording:(Recording *)recording fileType:(ShareExtensionControllerFileType)fileType presenter:(UIViewController *)presenter completion:(void (^)())completionBlock {
    if (fileType == ShareExtensionControllerFileTypeMovie) {
        [ShareExtensionController presentMovieInShareExtensionForRecording:recording presenter:presenter completion:completionBlock];
    } else if (fileType == ShareExtensionControllerFileTypeAudio) {
        [ShareExtensionController presentAudioOnlyInShareExtensionForRecording:recording presenter:presenter completion:completionBlock];
    }
}

+ (void)presentMovieInShareExtensionForRecording:(Recording *)recording presenter:(UIViewController *)presenter completion:(void(^)())completionBlock {
    
    NSString *videoPath = [NSString stringWithFormat:@"%@/video_only.mov", [Constants documentsDirectory]];
    UIImage *videoImage = [WireTapStyleKit imageOfSplashScreenForVideoShare];
    CGSize videoSize = CGSizeMake(512, 512);
    NSTimeInterval videoDuration = MAX(ceil(recording.lengthAsTimeInterval), 2.0);
    
    NSString *recordingTitle = [ShareExtensionController fileTitleForRecording:recording];
    NSString *moviePath = [NSString stringWithFormat:@"%@/%@.mov", [Constants documentsDirectory], recordingTitle];
    
    [ShareExtensionController writeImageAsMovie:videoImage toPath:videoPath size:videoSize duration:videoDuration];
    
    [self makeMovieWithAudioFilePath:recording.urlString videoFilePath:videoPath outputMoviePath:moviePath completionHandler:^{
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            NSURL *movieURL = [NSURL fileURLWithPath:moviePath];
            UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[movieURL] applicationActivities:@[]];
            
            activityViewController.completionWithItemsHandler = ^(NSString *activityType, BOOL completed, NSArray *returnedItems, NSError *activityError) {
                [[NSFileManager defaultManager] removeItemAtPath:videoPath error:nil];
                [[NSFileManager defaultManager] removeItemAtPath:moviePath error:nil];
                if (completionBlock) {
                    completionBlock();
                }
            };
            
            [presenter presentViewController:activityViewController animated:YES completion:nil];
        }];
    }];
}

+ (void)presentAudioOnlyInShareExtensionForRecording:(Recording *)recording presenter:(UIViewController *)presenter completion:(void(^)())completionBlock {
    NSString *recordingTitle = [ShareExtensionController fileTitleForRecording:recording];
    NSString *audioPath = [NSString stringWithFormat:@"%@/%@.m4a", [Constants documentsDirectory], recordingTitle];
    [[NSFileManager defaultManager] moveItemAtPath:recording.urlString toPath:audioPath error:nil];

    NSURL *audioURL = [NSURL fileURLWithPath:audioPath];

    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[audioURL] applicationActivities:@[]];
    
    //    [activityViewController setValue:recordingTitle forKey:@"subject"];
    
    activityViewController.excludedActivityTypes = @[UIActivityTypePostToWeibo,
                                                     UIActivityTypePostToFacebook,
                                                     UIActivityTypeSaveToCameraRoll,
                                                     UIActivityTypeAddToReadingList,
                                                     UIActivityTypePrint,
                                                     UIActivityTypePostToTencentWeibo,
                                                     UIActivityTypePostToTwitter];

    activityViewController.completionWithItemsHandler = ^(NSString *activityType, BOOL completed, NSArray *returnedItems, NSError *activityError) {
        [[NSFileManager defaultManager] moveItemAtPath:audioPath toPath:recording.urlString error:nil];
        if (completionBlock) {
            completionBlock();
        }
    };
    
    [presenter presentViewController:activityViewController animated:YES completion:nil];
}

#pragma mark - Movie Methods

+ (void)writeImageAsMovie:(UIImage*)image toPath:(NSString*)path size:(CGSize)size duration:(NSTimeInterval)duration {
    NSURL *outputURL = [NSURL fileURLWithPath:path];
    AVAssetWriter *movieWriter = [[AVAssetWriter alloc] initWithURL:outputURL fileType:AVFileTypeQuickTimeMovie error:nil];
    NSParameterAssert(movieWriter);
    
    NSDictionary *videoSettings = [NSDictionary dictionaryWithObjectsAndKeys:
                                   AVVideoCodecH264, AVVideoCodecKey,
                                   [NSNumber numberWithInt:size.width], AVVideoWidthKey,
                                   [NSNumber numberWithInt:size.height], AVVideoHeightKey,
                                   nil];
    AVAssetWriterInput* videoInput = [AVAssetWriterInput assetWriterInputWithMediaType:AVMediaTypeVideo
                                                                        outputSettings:videoSettings];
    
    AVAssetWriterInputPixelBufferAdaptor *adaptor = [AVAssetWriterInputPixelBufferAdaptor
                                                     assetWriterInputPixelBufferAdaptorWithAssetWriterInput:videoInput
                                                     sourcePixelBufferAttributes:nil];
    NSParameterAssert(videoInput);
    NSParameterAssert([movieWriter canAddInput:videoInput]);
    [movieWriter addInput:videoInput];
    
    //Start a session:
    [movieWriter startWriting];
    [movieWriter startSessionAtSourceTime:kCMTimeZero];
    
    //Write samples:
    CVPixelBufferRef buffer = [ShareExtensionController pixelBufferFromCGImage:image.CGImage size:size];
    [adaptor appendPixelBuffer:buffer withPresentationTime:kCMTimeZero];
    [adaptor appendPixelBuffer:buffer withPresentationTime:CMTimeMake(duration-1, 1)];
    
    //Finish the session:
    [videoInput markAsFinished];
    [movieWriter endSessionAtSourceTime:CMTimeMake(duration, 1)];
    [movieWriter finishWritingWithCompletionHandler:^{
        CVPixelBufferRelease(buffer);
    }];
}

+ (CVPixelBufferRef)pixelBufferFromCGImage:(CGImageRef)image size:(CGSize)size {
    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
                             [NSNumber numberWithBool:YES], kCVPixelBufferCGImageCompatibilityKey,
                             [NSNumber numberWithBool:YES], kCVPixelBufferCGBitmapContextCompatibilityKey,
                             nil];
    CVPixelBufferRef pxbuffer = NULL;
    CVReturn status = CVPixelBufferCreate(kCFAllocatorDefault, size.width,
                                          size.height, kCVPixelFormatType_32ARGB, (__bridge CFDictionaryRef) options,
                                          &pxbuffer);
    status=status;//Added to make the stupid compiler not show a stupid warning.
    NSParameterAssert(status == kCVReturnSuccess && pxbuffer != NULL);
    
    CVPixelBufferLockBaseAddress(pxbuffer, 0);
    void *pxdata = CVPixelBufferGetBaseAddress(pxbuffer);
    NSParameterAssert(pxdata != NULL);
    
    CGColorSpaceRef rgbColorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(pxdata, size.width,
                                                 size.height, 8, 4*size.width, rgbColorSpace,
                                                 (CGBitmapInfo)kCGImageAlphaNoneSkipFirst);
    NSParameterAssert(context);
    
    //CGContextTranslateCTM(context, 0, CGImageGetHeight(image));
    //CGContextScaleCTM(context, 1.0, -1.0);//Flip vertically to account for different origin
    
    CGContextDrawImage(context, CGRectMake(0, 0, CGImageGetWidth(image),
                                           CGImageGetHeight(image)), image);
    CGColorSpaceRelease(rgbColorSpace);
    CGContextRelease(context);
    
    CVPixelBufferUnlockBaseAddress(pxbuffer, 0);
    
    return pxbuffer;
}

+ (void)makeMovieWithAudioFilePath:(NSString *)audioPath videoFilePath:(NSString *)videoPath outputMoviePath:(NSString *)moviePath completionHandler:(void(^)())completionblock {
    AVMutableComposition* mixComposition = [AVMutableComposition composition];
    
    NSURL *audioPathURL = [NSURL fileURLWithPath:audioPath];
    NSURL *videoPathURL = [NSURL fileURLWithPath:videoPath];
    NSURL *outputFileUrl = [NSURL fileURLWithPath:moviePath];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:moviePath]) {
        [[NSFileManager defaultManager] removeItemAtPath:moviePath error:nil];
    }
    
    CMTime nextClipStartTime = kCMTimeZero;
    
    AVURLAsset* videoAsset = [[AVURLAsset alloc]initWithURL:videoPathURL options:nil];
    CMTimeRange video_timeRange = CMTimeRangeMake(kCMTimeZero,videoAsset.duration);
    AVMutableCompositionTrack *a_compositionVideoTrack = [mixComposition addMutableTrackWithMediaType:AVMediaTypeVideo preferredTrackID:kCMPersistentTrackID_Invalid];
    [a_compositionVideoTrack insertTimeRange:video_timeRange ofTrack:[[videoAsset tracksWithMediaType:AVMediaTypeVideo] objectAtIndex:0] atTime:nextClipStartTime error:nil];
    
    //nextClipStartTime = CMTimeAdd(nextClipStartTime, a_timeRange.duration);
    
    AVURLAsset* audioAsset = [[AVURLAsset alloc]initWithURL:audioPathURL options:nil];
    CMTimeRange audio_timeRange = CMTimeRangeMake(kCMTimeZero, audioAsset.duration);
    AVMutableCompositionTrack *b_compositionAudioTrack = [mixComposition addMutableTrackWithMediaType:AVMediaTypeAudio preferredTrackID:kCMPersistentTrackID_Invalid];
    [b_compositionAudioTrack insertTimeRange:audio_timeRange ofTrack:[[audioAsset tracksWithMediaType:AVMediaTypeAudio] objectAtIndex:0] atTime:nextClipStartTime error:nil];
    
    AVAssetExportSession* _assetExport = [[AVAssetExportSession alloc] initWithAsset:mixComposition presetName:AVAssetExportPresetHighestQuality];
    _assetExport.outputFileType = AVFileTypeQuickTimeMovie;
    _assetExport.outputURL = outputFileUrl;
    
    [_assetExport exportAsynchronouslyWithCompletionHandler:completionblock];
}

#pragma mark - Helper Methods

+ (NSString *)fileTitleForRecording:(Recording *)recording {
    NSString *recordingTitle = (recording.title.length == 0) ? recording.dateAsString : recording.title;
    recordingTitle = [@"Micd - " stringByAppendingString:recordingTitle];
    recordingTitle = [[recordingTitle componentsSeparatedByCharactersInSet:[[self fileNameLegalCharacterSet] invertedSet]] componentsJoinedByString:@" "];
    
    return recordingTitle;
}

+ (NSCharacterSet *)fileNameLegalCharacterSet {
    NSMutableCharacterSet *legalCharacters = [[NSMutableCharacterSet alloc] init];
    [legalCharacters formUnionWithCharacterSet:[NSCharacterSet lowercaseLetterCharacterSet]];
    [legalCharacters formUnionWithCharacterSet:[NSCharacterSet uppercaseLetterCharacterSet]];
    [legalCharacters formUnionWithCharacterSet:[NSCharacterSet decimalDigitCharacterSet]];
    [legalCharacters formUnionWithCharacterSet:[NSCharacterSet whitespaceCharacterSet]];
    [legalCharacters formUnionWithCharacterSet:[NSCharacterSet characterSetWithCharactersInString:@"-"]];
    
    return [legalCharacters copy];
}

@end
