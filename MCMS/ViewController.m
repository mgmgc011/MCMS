//
//  ViewController.m
//  MCMS
//
//  Created by Mingu Chu on 3/22/16.
//  Copyright © 2016 Mingu Chu. All rights reserved.
//

#import "ViewController.h"
#import "MagicalCreature.h"
#import "CreatureViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property NSMutableArray *creatures;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.creatures = [NSMutableArray arrayWithObjects:@"Bald Eagle", @"Elephant", @"Chicken", @"Chimp", nil ];
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.creatures.count;
}


-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID" forIndexPath:indexPath];
    cell.textLabel.text = self.creatures[indexPath.row];
    
    
    return cell;
}

- (IBAction)onAddButtonPressed:(UIButton *)sender {
    [self.creatures addObject:self.textField.text];
    [self.tableView reloadData];
    self.textField.text = @"";
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell *)sender {
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    MagicalCreature *creature = self.creatures[indexPath.row];
    CreatureViewController *destination = segue.destinationViewController;
    destination.magicalCreature = creature;
    
}

@end
