//
//  CreatureViewController.m
//  MCMS
//
//  Created by Mingu Chu on 3/22/16.
//  Copyright © 2016 Mingu Chu. All rights reserved.
//

#import "CreatureViewController.h"

@interface CreatureViewController () <UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *creatureNameField;
@property (weak, nonatomic) IBOutlet UIButton *editButton;
@property (weak, nonatomic) IBOutlet UITextField *weaponField;
@property (weak, nonatomic) IBOutlet UITextField *bloodLustField;
@property (weak, nonatomic) IBOutlet UITextField *hobbiesfield;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSMutableArray *creatureAttributes;


@end

@implementation CreatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.creatureNameField.text = self.magicalCreature.creatureName;
    self.weaponField.text = self.magicalCreature.creatureWeapon;
    self.bloodLustField.text = [NSString stringWithFormat:@"%i", self.magicalCreature.bloodLust];
    self.hobbiesfield.text = self.magicalCreature.hobbies;
    [self textFieldShouldBeginEditing:self.creatureNameField];
    [self textFieldShouldBeginEditing:self.weaponField];
    [self textFieldShouldBeginEditing:self.bloodLustField];
    [self textFieldShouldBeginEditing:self.hobbiesfield];
    
    NSLog(@"%@", self.magicalCreature.creatureWeapon);
    self.creatureAttributes[0] = [NSString stringWithFormat:@"Weapon %@", self.magicalCreature.creatureWeapon];
    self.creatureAttributes[1] = [NSString stringWithFormat:@"Power Level %i", self.magicalCreature.bloodLust];
    self.creatureAttributes[2] = [NSString stringWithFormat:@"Hobbies %@", self.magicalCreature.hobbies];

}
- (IBAction)onEditButtonTapped:(UIButton *)sender {
    if ([sender.currentTitle isEqualToString:@"Edit"]) {
        [sender setTitle:@"Done" forState:UIControlStateNormal];
    }
    else {
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        [self.view endEditing:YES];

    }
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    if ([self.editButton.currentTitle isEqualToString:@"Edit"]){
        return NO;
    } else if ([self.editButton.currentTitle isEqualToString:@"Done"]){
        return YES;
    } else
        return NO;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.creatureAttributes.count;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID" forIndexPath:indexPath];
    MagicalCreature *creature = [self.creatureAttributes objectAtIndex:indexPath.row];
    cell.textLabel.text = creature.creatureName;
    
    
    return cell;
}

@end
