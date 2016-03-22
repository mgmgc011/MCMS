//
//  MagicalCreature.h
//  MCMS
//
//  Created by Mingu Chu on 3/22/16.
//  Copyright © 2016 Mingu Chu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MagicalCreature : NSObject

@property NSString *creatureName;
@property int bloodLust;
@property NSString *creatureWeapon;
@property NSString *hobbies;
@property UIImage *creatureImage;

-(instancetype) initWithName:(NSString *)name andWeapon:(NSString *)weapon andBloodLust:(int)level andHobbies:(NSString *)hobbies andimage:(UIImage *)image;

@end
