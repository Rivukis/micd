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
    
    NSDate *today = [NSDate date];
    NSDate *yesterday = [NSDate dateWithTimeInterval:-60*60*24 sinceDate:today];
    NSDate *threeDaysAgo = [NSDate dateWithTimeInterval:-60*60*24*3 sinceDate:today];
    NSDate *fourDaysAgo = [NSDate dateWithTimeInterval:-60*60*24*4 sinceDate:today];
    NSDate *sixDaysAgo = [NSDate dateWithTimeInterval:-60*60*24*6 sinceDate:today];
    NSDate *eightDaysAgo = [NSDate dateWithTimeInterval:-60*60*24*8 sinceDate:today];
    NSDate *nineDaysAgo = [NSDate dateWithTimeInterval:-60*60*24*9 sinceDate:today];
    NSDate *lastMonth = [NSDate dateWithTimeInterval:-2628000  sinceDate:today];
    NSDate *twoMonthsAgo = [NSDate dateWithTimeInterval:-2628000*2  sinceDate:today];
    NSDate *fourMonthsAgo = [NSDate dateWithTimeInterval:-2628000*4  sinceDate:today];
    NSInteger variety = 10;
    
    Recording *recording1 = [[Recording alloc] initWithData:nil date:[NSDate dateWithTimeInterval:variety-- sinceDate:today] length:300 name:@"song title 1"];
    Recording *recording2 = [[Recording alloc] initWithData:nil date:[NSDate dateWithTimeInterval:variety-- sinceDate:lastMonth] length:220 name:@"sonetitle2"];
    Recording *recording3 = [[Recording alloc] initWithData:nil date:[NSDate dateWithTimeInterval:variety-- sinceDate:twoMonthsAgo] length:1200 name:@"song TITLE3"];
    Recording *recording4 = [[Recording alloc] initWithData:nil date:[NSDate dateWithTimeInterval:variety-- sinceDate:fourMonthsAgo] length:112 name:@"song TITLE4"];
    Recording *recording5 = [[Recording alloc] initWithData:nil date:[NSDate dateWithTimeInterval:variety-- sinceDate:today] length:5435 name:@"tag_what'sup"];
    Recording *recording6 = [[Recording alloc] initWithData:nil date:[NSDate dateWithTimeInterval:variety-- sinceDate:lastMonth] length:2345 name:@"tag_howyoudointitle"];
    Recording *recording7 = [[Recording alloc] initWithData:nil date:[NSDate dateWithTimeInterval:variety-- sinceDate:twoMonthsAgo] length:234 name:@"tag_song"];
    Recording *recording8 = [[Recording alloc] initWithData:nil date:[NSDate dateWithTimeInterval:variety-- sinceDate:fourMonthsAgo] length:5 name:@"tag_songTiTlE"];
    Recording *recording9 = [[Recording alloc] initWithData:nil date:[NSDate dateWithTimeInterval:variety-- sinceDate:today] length:301 name:@"Confrontation with pops"];
    Recording *recording10 = [[Recording alloc] initWithData:nil date:[NSDate dateWithTimeInterval:variety-- sinceDate:today] length:1205 name:@"My baby's first words"];
    Recording *recording11 = [[Recording alloc] initWithData:nil date:[NSDate dateWithTimeInterval:variety-- sinceDate:today] length:74 name:@"Massive fart"];
    Recording *recording13 = [[Recording alloc] initWithData:nil date:[NSDate dateWithTimeInterval:variety-- sinceDate:today] length:843 name:@"Fetivus of the bestivus"];
    Recording *recording14 = [[Recording alloc] initWithData:nil date:[NSDate dateWithTimeInterval:variety-- sinceDate:today] length:378 name:@"Really long title to see what happens with the wrapping"];
    Recording *recording15 = [[Recording alloc] initWithData:nil date:[NSDate dateWithTimeInterval:variety-- sinceDate:lastMonth] length:301 name:@"Confrontation with pops"];
    Recording *recording16 = [[Recording alloc] initWithData:nil date:[NSDate dateWithTimeInterval:variety-- sinceDate:lastMonth] length:1205 name:@"My baby's first words"];
    Recording *recording17 = [[Recording alloc] initWithData:nil date:[NSDate dateWithTimeInterval:variety-- sinceDate:twoMonthsAgo] length:74 name:@"Massive fart"];
    Recording *recording18 = [[Recording alloc] initWithData:nil date:[NSDate dateWithTimeInterval:variety-- sinceDate:twoMonthsAgo] length:843 name:@"Fetivus of the bestivus"];
    Recording *recording19 = [[Recording alloc] initWithData:nil date:[NSDate dateWithTimeInterval:variety-- sinceDate:fourMonthsAgo] length:378 name:@"Really long title to see what happens with the wrapping"];
    Recording *recording20 = [[Recording alloc] initWithData:nil date:[NSDate dateWithTimeInterval:variety-- sinceDate:twoMonthsAgo] length:1205 name:@"My baby's first words"];
    Recording *recording21 = [[Recording alloc] initWithData:nil date:[NSDate dateWithTimeInterval:variety-- sinceDate:twoMonthsAgo] length:74 name:@"Massive fart"];
    Recording *recording23 = [[Recording alloc] initWithData:nil date:[NSDate dateWithTimeInterval:variety-- sinceDate:twoMonthsAgo] length:843 name:@"Fetivus of the bestivus"];
    Recording *recording24 = [[Recording alloc] initWithData:nil date:[NSDate dateWithTimeInterval:variety-- sinceDate:twoMonthsAgo] length:378 name:@"Really long title to see what happens with the wrapping"];
    Recording *recording25 = [[Recording alloc] initWithData:nil date:[NSDate dateWithTimeInterval:variety-- sinceDate:twoMonthsAgo] length:301 name:@"Confrontation with pops"];
    Recording *recording26 = [[Recording alloc] initWithData:nil date:[NSDate dateWithTimeInterval:variety-- sinceDate:fourMonthsAgo] length:1205 name:@"My baby's first words"];
//    variety += 86400;
    Recording *recording27 = [[Recording alloc] initWithData:nil date:[NSDate dateWithTimeInterval:variety-- sinceDate:fourMonthsAgo] length:74 name:@"Massive fart"];
    Recording *recording28 = [[Recording alloc] initWithData:nil date:[NSDate dateWithTimeInterval:variety-- sinceDate:fourMonthsAgo] length:843 name:@"Fetivus of the bestivus"];
    Recording *recording29 = [[Recording alloc] initWithData:nil date:[NSDate dateWithTimeInterval:variety-- sinceDate:fourMonthsAgo] length:378 name:@"Really long title to see what happens with the wrapping"];
    Recording *recording30 = [[Recording alloc] initWithData:nil date:[NSDate dateWithTimeInterval:variety-- sinceDate:yesterday] length:301 name:@"yesterday title"];
    Recording *recording31 = [[Recording alloc] initWithData:nil date:[NSDate dateWithTimeInterval:variety-- sinceDate:threeDaysAgo] length:1205 name:@"three days ago title - wed"];
    Recording *recording32 = [[Recording alloc] initWithData:nil date:[NSDate dateWithTimeInterval:variety-- sinceDate:threeDaysAgo] length:74 name:@"three days ago title 2 - wed"];
    Recording *recording33 = [[Recording alloc] initWithData:nil date:[NSDate dateWithTimeInterval:variety-- sinceDate:fourDaysAgo] length:843 name:@"four days ago title - tue"];
    Recording *recording34 = [[Recording alloc] initWithData:nil date:[NSDate dateWithTimeInterval:variety-- sinceDate:sixDaysAgo] length:378 name:@"six days ago - sun"];
    Recording *recording35 = [[Recording alloc] initWithData:nil date:[NSDate dateWithTimeInterval:variety-- sinceDate:eightDaysAgo] length:74 name:@"eight days ago"];
    Recording *recording36 = [[Recording alloc] initWithData:nil date:[NSDate dateWithTimeInterval:variety-- sinceDate:eightDaysAgo] length:843 name:@"eight days ago again"];
    Recording *recording37 = [[Recording alloc] initWithData:nil date:[NSDate dateWithTimeInterval:variety-- sinceDate:nineDaysAgo] length:378 name:@"nine days ago"];
    
    [recording1 addTag:@"tag"];
    [recording2 addTag:@"title"];
    [recording2 addTag:@"song"];
    [recording8 addTag:@"kitty"];
    
    return @[recording1, recording2, recording3, recording4, recording5, recording6, recording7, recording8, recording9, recording10, recording11, recording13, recording14, recording15, recording16, recording17, recording18, recording19, recording20, recording21, recording23, recording24, recording25, recording26, recording27, recording28, recording29, recording30, recording31, recording32, recording33, recording34, recording35, recording36, recording37];
}

@end
