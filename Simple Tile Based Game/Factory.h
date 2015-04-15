//
//  Factory.h
//  Simple Tile Based Game
//
//  Created by King Gregory on 11/8/14.
//  Copyright (c) 2014 Protocol. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GGCharacter.h"
#import "GGBoss.h"

@interface Factory : NSObject

-(void)testIfFactoryMethodIsCalled;
-(NSArray *)factoryTiles;

-(GGCharacter *) character;

-(GGBoss *) boss; 




@end
