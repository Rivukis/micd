//
//  FakesForProject.m
//  Recorder
//
//  Created by Brian Radebaugh on 2/4/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import "FakesForProject.h"
#import "CKRecording.h"

@implementation FakesForProject

+ (NSArray *)fakeArrayOfSearchItems {
    
    CKRecording *recording1 = [[CKRecording alloc] initWithData:nil date:nil length:NSNotFound name:@"song title 1"];
    CKRecording *recording2 = [[CKRecording alloc] initWithData:nil date:nil length:NSNotFound name:@"sonetitle2"];
    CKRecording *recording3 = [[CKRecording alloc] initWithData:nil date:nil length:NSNotFound name:@"song TITLE3"];
    CKRecording *recording4 = [[CKRecording alloc] initWithData:nil date:nil length:NSNotFound name:@"song TITLE4"];
    CKRecording *recording5 = [[CKRecording alloc] initWithData:nil date:nil length:NSNotFound name:@"tag_what'sup"];
    CKRecording *recording6 = [[CKRecording alloc] initWithData:nil date:nil length:NSNotFound name:@"tag_howyoudointitle"];
    CKRecording *recording7 = [[CKRecording alloc] initWithData:nil date:nil length:NSNotFound name:@"tag_song"];
    CKRecording *recording8 = [[CKRecording alloc] initWithData:nil date:nil length:NSNotFound name:@"tag_songTiTlE"];
    
    [recording1 addTag:@"tag"];
    [recording2 addTag:@"title"];
    [recording2 addTag:@"song"];
    [recording8 addTag:@"kitty"];
    
    return @[recording1, recording2, recording3, recording4, recording5, recording6, recording7, recording8];
}

@end
