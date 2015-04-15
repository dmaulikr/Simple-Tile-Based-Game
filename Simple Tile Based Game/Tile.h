//
//  Tile.h
//  Simple Tile Based Game
//
//  Created by King Gregory on 11/3/14.
//  Copyright (c) 2014 Protocol. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Weapon.h"
#import "Armor.h"

@interface Tile : NSObject

@property (strong, nonatomic) NSString *location;
@property (strong, nonatomic) UIImage *backgroundImage;
@property (strong, nonatomic) NSString *actionButton;

@property (strong, nonatomic) Weapon *weapon;
@property (strong, nonatomic) Armor *armor;
@property (nonatomic) int healthEffect; 



@end
