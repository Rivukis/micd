//
//  FakesForProject.m
//  Recorder
//
//  Created by Brian Radebaugh on 2/4/15.
//  Copyright (c) 2015 CleverKnot. All rights reserved.
//

#import "FakesForProject.h"
#import "Recording.h"

@implementation FakesForProject

+ (NSArray *)fakeArrayOfSearchItems {
    
    Recording *recording1 = [[Recording alloc] initWithData:nil date:nil length:NSNotFound name:@"song title 1"];
    Recording *recording2 = [[Recording alloc] initWithData:nil date:nil length:NSNotFound name:@"sonetitle2"];
    Recording *recording3 = [[Recording alloc] initWithData:nil date:nil length:NSNotFound name:@"song TITLE3"];
    Recording *recording4 = [[Recording alloc] initWithData:nil date:nil length:NSNotFound name:@"song TITLE4"];
    Recording *recording5 = [[Recording alloc] initWithData:nil date:nil length:NSNotFound name:@"tag_what'sup"];
    Recording *recording6 = [[Recording alloc] initWithData:nil date:nil length:NSNotFound name:@"tag_howyoudointitle"];
    Recording *recording7 = [[Recording alloc] initWithData:nil date:nil length:NSNotFound name:@"tag_song"];
    Recording *recording8 = [[Recording alloc] initWithData:nil date:nil length:NSNotFound name:@"tag_songTiTlE"];
    
    [recording1 addTag:@"tag"];
    [recording2 addTag:@"title"];
    [recording2 addTag:@"song"];
    [recording8 addTag:@"kitty"];
    
    return @[recording1, recording2, recording3, recording4, recording5, recording6, recording7, recording8];
}

@end
