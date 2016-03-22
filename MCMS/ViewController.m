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
     MagicalCreature *mosDef = [[MagicalCreature alloc] initWithName:@"Mos Def" andWeapon:@"The mike" andBloodLust:9001 andHobbies:@"Ruining fellow rappers' careers"];
    [self.creatures addObject:mosDef];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.creatures.count;
}


-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID" forIndexPath:indexPath];
    MagicalCreature *creature = [self.creatures objectAtIndex:indexPath.row];
    cell.textLabel.text = creature.creatureName;
    
    
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
