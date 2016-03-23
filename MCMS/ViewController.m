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
#import "BattleViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property NSMutableArray *creatures;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.creatures = [[NSMutableArray alloc] init];
    MagicalCreature *mosDef = [[MagicalCreature alloc] initWithName:@"Mos Def" andWeapon:@"The mike" andBloodLust:5000 andHobbies:@"Ruining fellow rappers' careers" andimage:[UIImage imageNamed:@"MosDef"]];
    MagicalCreature *baldEagle = [[MagicalCreature alloc] initWithName:@"Bald Eagle" andWeapon:@"Freedom" andBloodLust:5000 andHobbies:@"FREE BIRD!!!" andimage:[UIImage imageNamed:@"BaldEagle"]];
    MagicalCreature *chimp= [[MagicalCreature alloc] initWithName:@"Chimp" andWeapon:@"Banana" andBloodLust:17 andHobbies:@"Monkey business" andimage:[UIImage imageNamed:@"Chimp"]];
    MagicalCreature *kungFuChicken = [[MagicalCreature alloc] initWithName:@"Kung Fu Chicken" andWeapon:@"Soy Sauce" andBloodLust:2 andHobbies:@"Cooking, strutting" andimage:[UIImage imageNamed:@"KungFuChicken"]];
    MagicalCreature *gorgorath = [[MagicalCreature alloc] initWithName:@"Gorgorath the World Smasher" andWeapon:@"The Pillar of Doom" andBloodLust:8999 andHobbies:@"Harvesting planets for their resources, poetry slams" andimage:[UIImage imageNamed:@"Gorgorath"]];
    [self.creatures addObject:mosDef];
    [self.creatures addObject:baldEagle];
    [self.creatures addObject:chimp];
    [self.creatures addObject:kungFuChicken];
    [self.creatures addObject:gorgorath];
    [self.tableView reloadData];
    NSLog(@"%@", self.creatures);
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
    MagicalCreature *creature =[[MagicalCreature alloc] initWithName:self.textField.text andWeapon:@"" andBloodLust:0 andHobbies:@"" andimage:nil];
    [self.creatures addObject:creature];
    [self.tableView reloadData];
    self.textField.text = @"";
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell *)sender {
    if([[segue identifier] isEqualToString:@"ShowCreatureSegue"]) {
        
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    MagicalCreature *creature = self.creatures[indexPath.row];
    CreatureViewController *destination = segue.destinationViewController;
    destination.magicalCreature = creature;
    } else {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        [self.tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionMiddle];
        NSInteger i = indexPath.row;
        
        BattleViewController *destination = segue.destinationViewController;
        MagicalCreature *creature1 = self.creatures[i];
        MagicalCreature *creature2 = self.creatures[i];
        destination.creature1 = creature1;
        destination.creature2 = creature2;
        
    }
}


@end
