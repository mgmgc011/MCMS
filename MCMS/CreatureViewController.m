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
@property NSMutableArray *creatureAttributes;
@property (weak, nonatomic) IBOutlet UITextField *weaponField;
@property (weak, nonatomic) IBOutlet UITextField *bloodLustField;
@property (weak, nonatomic) IBOutlet UITextField *hobbiesField;
@property (weak, nonatomic) IBOutlet UIImageView *creatureImage;



@end

@implementation CreatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.creatureNameField.text = self.magicalCreature.creatureName;
    self.weaponField.text = self.magicalCreature.creatureWeapon;

    self.bloodLustField.text = [NSString stringWithFormat:@"%i",self.magicalCreature.bloodLust];
    self.hobbiesField.text = self.magicalCreature.hobbies;
    [self textFieldShouldBeginEditing:self.creatureNameField];
    [self textFieldShouldBeginEditing:self.weaponField];
    [self textFieldShouldBeginEditing:self.bloodLustField];
    [self textFieldShouldBeginEditing:self.hobbiesField];
   

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

@end
