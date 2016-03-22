//
//  MagicalCreature.m
//  MCMS
//
//  Created by Mingu Chu on 3/22/16.
//  Copyright © 2016 Mingu Chu. All rights reserved.
//

#import "MagicalCreature.h"

@implementation MagicalCreature

-(instancetype) initWithName:(NSString *)name andWeapon:(NSString *)weapon andBloodLust:(int)level andHobbies:(NSString *)hobbies andimage:(UIImage *)image {
    self = [super init];
    if (self) {
        self.creatureName = name;
        self.creatureWeapon = weapon;
        self.bloodLust = level;
        self.hobbies = hobbies;
        self.creatureImage = image;
 
    }
    return self;
}

@end
