//
//  CKTwoViewController.m
//  Recorder
//
//  Created by Brian Radebaugh on 12/6/14.
//  Copyright (c) 2014 CleverKnot. All rights reserved.
//

#import "CKRecordingViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "CKRecorderController.h"
#import "CKPlayerController.h"
#import "CKRecording.h"
#import "CKConstants.h"

#import "CKRecordingDetailsViewController.h"
#import "CKSearchViewController.h"

@interface CKRecordingViewController () <AVAudioPlayerDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UIButton *recordPauseButton;
@property (nonatomic, weak) IBOutlet UIButton *saveButton;

@property (nonatomic, strong) CKRecorderController *recorderController;
@property (nonatomic, strong) CKPlayerController *playerController;
@property (nonatomic, assign) BOOL isRecording;

@property (nonatomic, strong) NSMutableArray *recordings; // of CKRecording
@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (nonatomic, strong) AVAudioSession *audioSession;
//@property (nonatomic, strong) AVAudioPlayer *player;

@end

@implementation CKRecordingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Clever Knot Recorder";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Search" style:UIBarButtonItemStylePlain target:self action:@selector(pushToSearchController)];
    
    self.recordings = [NSMutableArray array];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.audioSession = [AVAudioSession sharedInstance];
    NSError *sessionError;
    [self.audioSession setCategory:AVAudioSessionCategoryPlayAndRecord error:&sessionError];
    if (sessionError) {
        // TODO: handle error
        NSLog(@"error setting up audio session: %@", sessionError.localizedDescription);
    }
    
    sessionError = nil;
    [self.audioSession setActive:YES error:&sessionError];
    if (sessionError) {
        // TODO: handle error
        NSLog(@"error setting session to active: %@", sessionError.localizedDescription);
    }
    
    self.recorderController = [[CKRecorderController alloc] initWithAudioSession:self.audioSession];
    self.playerController = [[CKPlayerController alloc] initWithAudioSession:self.audioSession];
    
    self.isRecording = NO;
    [self configureRecordPauseButton];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.tableView reloadData];
}

#pragma mark - Recorder Controller Actions

- (void)configureRecordPauseButton {
    if (self.recorderController.recordingState == CKRecorderControllerStateRecording) {
        [self.recordPauseButton setTitle:@"Pause" forState:UIControlStateNormal];
        self.recordPauseButton.backgroundColor = [UIColor yellowColor];
    } else {
        [self.recordPauseButton setTitle:@"Record" forState:UIControlStateNormal];
        self.recordPauseButton.backgroundColor = [UIColor redColor];
    }
}

- (IBAction)recordPauseButtonPressed:(UIButton *)sender {
    if (self.isRecording) {
        [self pausePressed];
    } else {
        [self recordPressed];
    }
}

- (void)recordPressed {
    [self.recorderController startRecording];
    self.isRecording = YES;
    [self configureRecordPauseButton];
}

- (void)pausePressed {
    [self.recorderController pauseRecording];
    self.isRecording = NO;
    [self configureRecordPauseButton];
}

- (IBAction)saveButtonPressed:(UIButton *)sender {
    __weak __typeof(self) weakSelf = self;
    [self.recorderController retrieveRecordingThenDelete:NO completion:^(CKRecording *recording, NSError *error) {
        if (error) {
            NSLog(@"error retrieving recording: %@", error);
            return;
        }
        
        weakSelf.isRecording = NO;
        [weakSelf configureRecordPauseButton];
        [weakSelf.recordings addObject:recording];
        [weakSelf.tableView reloadData];
    }];
}

#pragma mark - UITableViewDataSource && UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.recordings.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"SAVED RECORDINGS";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"recordingCell" forIndexPath:indexPath];
    CKRecording *recording = self.recordings[indexPath.row];
    
    NSString *dateYear = [NSString stringWithFormat:@"%ld", (long)recording.recordedDate.year];
    NSString *dateMonth = [self twoNumberStringWithInteger:recording.recordedDate.month];
    NSString *dateDay = [self twoNumberStringWithInteger:recording.recordedDate.day];
    NSString *dateHours = [self twoNumberStringWithInteger:recording.recordedDate.hour];
    NSString *dateMinutes = [self twoNumberStringWithInteger:recording.recordedDate.minute];
    NSString *dateSeconds = [self twoNumberStringWithInteger:recording.recordedDate.second];
    NSString *dateTimeZone = [recording.recordedDate.timeZone abbreviation];
    NSString *formattedDate = [NSString stringWithFormat:@"%@/%@/%@ %@:%@:%@ %@", dateYear, dateMonth, dateDay, dateHours, dateMinutes, dateSeconds, dateTimeZone];
    
    NSString *lengthHours = [self twoNumberStringWithInteger:recording.length.hours];
    NSString *lengthMinutes = [self twoNumberStringWithInteger:recording.length.minutes];
    NSString *lengthSeconds = [self twoNumberStringWithInteger:recording.length.seconds];
    NSString *lengthCentiseconds = [self twoNumberStringWithInteger:recording.length.centiseconds];
    NSString *formattedLength = [NSString stringWithFormat:@"%@:%@:%@.%@", lengthHours, lengthMinutes, lengthSeconds, lengthCentiseconds];
    
    cell.textLabel.text = recording.title;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ (%@)", formattedDate, formattedLength];
    
    return cell;
}

- (NSString *)twoNumberStringWithInteger:(NSInteger)integer {
    return [NSString stringWithFormat:@"%@%ld", integer < 10 ? @"0" : @"", (long)integer];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CKRecording *recording = (id)self.recordings[indexPath.row];
    
    // Load the player
    NSError *loadRecordingError;
    [self.playerController loadRecording:recording error:&loadRecordingError];
    if (loadRecordingError) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Audio Player Error" message:@"Couldn't Load Recording" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:alertAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }
    
    // play audio data
    NSError *playAudioError;
    [self.playerController playAudioWithError:&playAudioError];
    if (playAudioError) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Audio Player Error" message:@"Couldn't Play Recording" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:alertAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }
    
//    [self.playerController performSelector:@selector(pauseAudioWithError:) withObject:nil afterDelay:1.0f];
//    [self.playerController performSelector:@selector(playAudioWithError:) withObject:nil afterDelay:1.5f];
//    [self.playerController performSelector:@selector(pauseAudioWithError:) withObject:nil afterDelay:2.0f];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    NSString *className = NSStringFromClass([CKRecordingDetailsViewController class]);
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    CKRecordingDetailsViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:className];
    viewController.recording = self.recordings[indexPath.row];
    
    [self.navigationController pushViewController:viewController animated:YES];
}

#pragma mark - Other Actions

- (void)pushToSearchController {
    NSString *className = NSStringFromClass([CKSearchViewController class]);
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    CKSearchViewController *searchViewController = [storyboard instantiateViewControllerWithIdentifier:className];
    [self.navigationController pushViewController:searchViewController animated:YES];
}

@end
