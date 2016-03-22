//
//  CreatureViewController.m
//  MCMS
//
//  Created by Mingu Chu on 3/22/16.
//  Copyright © 2016 Mingu Chu. All rights reserved.
//

#import "CreatureViewController.h"

@interface CreatureViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *creatureNameField;
@property (weak, nonatomic) IBOutlet UIButton *editButton;
@property (weak, nonatomic) IBOutlet UITextField *weaponField;
@property (weak, nonatomic) IBOutlet UITextField *bloodLustField;
@property (weak, nonatomic) IBOutlet UITextField *hobbiesfield;

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
}
- (IBAction)onEditButtonTapped:(UIButton *)sender {
    if ([sender.currentTitle isEqualToString:@"Edit"]) {
        [sender setTitle:@"Done" forState:UIControlStateNormal];
      
    }
    else {[sender setTitle:@"Edit" forState:UIControlStateNormal];
      
    }
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    if ([self.editButton.currentTitle isEqualToString:@"Edit"]){
        return NO;
    } else {
        return YES;
    }
}


@end
