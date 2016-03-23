//
//  BattleViewController.m
//  MCMS
//
//  Created by Mingu Chu on 3/22/16.
//  Copyright © 2016 Mingu Chu. All rights reserved.
//

#import "BattleViewController.h"
#import "MagicalCreature.h"

@interface BattleViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageViewA;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewB;
@property (weak, nonatomic) IBOutlet UILabel *labelA;
@property (weak, nonatomic) IBOutlet UILabel *LabelB;


@end

@implementation BattleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageViewA.image = self.creature1.creatureImage;
    self.imageViewB.image = self.creature2.creatureImage;
    self.labelA.text = self.creature1.creatureName;
    self.LabelB.text = self.creature2.creatureName;
    

}
- (IBAction)onFightButtonTapped:(UIButton *)sender {
    UIAlertController *victory = [UIAlertController alertControllerWithTitle:[NSString stringWithFormat:@"%@ Win!", self.creature1.creatureName] message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertController *victory2 = [UIAlertController alertControllerWithTitle:[NSString stringWithFormat:@"%@ Win!", self.creature2.creatureName] message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertController *tie = [UIAlertController alertControllerWithTitle:[NSString stringWithFormat:@"It's a Tie!"] message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *goBack = [UIAlertAction actionWithTitle:@"Go Back" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
    UIAlertAction *reBattle = [UIAlertAction actionWithTitle:@"Battle Again" style:UIAlertActionStyleCancel handler:nil];
    
    if(self.creature1.bloodLust > self.creature2.bloodLust) {
        [victory addAction:goBack];
        [victory addAction:reBattle];
        [self presentViewController:victory animated:YES completion:nil];
    } else if (self.creature1.bloodLust == self.creature2.bloodLust) {
        [tie addAction:goBack];
        [tie addAction:reBattle];
        [self presentViewController:tie animated:YES completion:nil];
    } else {
        [victory2 addAction:goBack];
        [victory2 addAction:reBattle];
        [self presentViewController:victory2 animated:YES completion:nil];
    }
}



@end
