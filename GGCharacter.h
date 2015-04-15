//
//  GGCharacter.h
//  Simple Tile Based Game
//
//  Created by King Gregory on 3/4/15.
//  Copyright (c) 2015 Protocol. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Armor.h"
#import "Weapon.h"

@interface GGCharacter : NSObject

@property (strong, nonatomic) Armor *armor;
@property (strong, nonatomic) Weapon *weapon;
@property (nonatomic) int damage;
@property (nonatomic) int health;

@end
