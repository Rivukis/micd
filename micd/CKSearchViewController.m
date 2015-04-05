#import "CKSearchViewController.h"
#import "NSString+Score.h"
#import "Recording.h"
#import "FakesForProject.h"

@interface CKSearchViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *searchBarTextField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *titleResults;
@property (strong, nonatomic) NSArray *tagResults;

@end

@implementation CKSearchViewController

- (void)viewDidLoad {
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (IBAction)searchBarValueDidChange:(UITextField *)sender {
    
    // find audio title matches
    
    NSArray *searchItems = [FakesForProject fakeArrayOfSearchItems];
    
    NSMutableArray *titleResults = [NSMutableArray array];
    for (Recording *recording in searchItems) {
        if ([recording.title scoreAgainst:sender.text fuzziness:@1] > 0.4f) {
            [titleResults addObject:recording];
        }
    }
    
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"currentSearchScore" ascending:NO];
    [titleResults sortUsingDescriptors:@[sortDescriptor]];
    self.titleResults = [titleResults copy];
    
    // find tag matches
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"tags contains %@", sender.text];
    self.tagResults = [searchItems filteredArrayUsingPredicate:predicate];
    
    [self.tableView reloadData];
}

- (NSArray *)titleResults {
    _titleResults = (_titleResults) ?: [NSArray array];
    return _titleResults;
}

- (NSArray *)tagResults {
    _tagResults = (_tagResults) ?: [NSArray array];
    return _tagResults;
}

#pragma mark - UITableViewDelegate && UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return self.titleResults.count;
    } else if (section == 1) {
        NSLog(@"%lu number of rows in section", (unsigned long)self.tagResults.count);
        return self.tagResults.count;
    } else {
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"resultsCell" forIndexPath:indexPath];
    Recording *recording;
    
    if (indexPath.section == 0) {
        recording = self.titleResults[indexPath.row];
    } else {
        recording = self.tagResults[indexPath.row];
    }
    
    cell.textLabel.text = recording.title;
//    cell.detailTextLabel.text = [NSString stringWithFormat:@"search score: %f", recording.currentSearchScore];
    
    return cell;
}

@end
