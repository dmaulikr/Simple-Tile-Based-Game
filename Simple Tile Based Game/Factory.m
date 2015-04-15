//
//  Factory.m
//  Simple Tile Based Game
//
//  Created by King Gregory on 11/8/14.
//  Copyright (c) 2014 Protocol. All rights reserved.
//

#import "Factory.h"
#import "Tile.h"

@implementation Factory

-(void)testIfFactoryMethodIsCalled
{
    NSLog(@"Factory Method Successfully Called");
}


-(NSArray *)factoryTiles;
{
    
    // create 12 different tile objects with their own property. In this case the name of the location.
    
    Tile *tile1 = [[Tile alloc]init];
    tile1.location = @"Location 1: The salt flats";
    tile1.backgroundImage = [UIImage imageNamed:@"saltflat.jpg"];
    Weapon *bluntedSword = [[Weapon alloc]init];
    bluntedSword.name = @"Blunted Sword";
    bluntedSword.damage = 12;
    tile1.weapon = bluntedSword;
    tile1.armor = nil; // there is actually no need to set this to nil because the default is already nil. This is just here for demonstration purposes.
    tile1.actionButton = @"Take the Sword";
    
    
    Tile *tile2 = [[Tile alloc]init];
    tile2.location = @"Location 2: The open field";
    tile2.backgroundImage = [UIImage imageNamed:@"field.jpg"];
    Armor *steelArmor = [[Armor alloc]init];
    steelArmor.name = @"Steel Armor";
    steelArmor.health = 8;
    tile2.armor = steelArmor;
    tile2.weapon = nil; // same reason as above
    tile2.actionButton = @"Take the Armor";

    Tile *tile3 = [[Tile alloc]init];
    tile3.location = @"Location 3: The swamp";
    tile3.backgroundImage = [UIImage imageNamed:@"swamp.jpg"];
    tile3.healthEffect = 12;
    tile3.actionButton = @"Stop at the dock";
    
        // group the first 3 objects into one array
        NSMutableArray *firstColumn = [[NSMutableArray alloc]init];
        [firstColumn addObject:tile1];
        [firstColumn addObject:tile2];
        [firstColumn addObject:tile3];

    
    Tile *tile4 = [[Tile alloc]init];
    tile4.location = @"Location 4: The beach";
    tile4.backgroundImage = [UIImage imageNamed:@"beach.jpg"];
    Armor *xArmor = [[Armor alloc]init];
    xArmor.health = 20;
    xArmor.name = @"X Armor";
    tile4.actionButton = @"Get X Armor";

    Tile *tile5 = [[Tile alloc]init];
    tile5.location = @"Location 5: The mountain";
    tile5.backgroundImage = [UIImage imageNamed:@"mountain.jpg"];
    Weapon *xBuster = [[Weapon alloc]init];
    xBuster.name = @"X Buster";
    xBuster.damage = 17;
    tile5.actionButton = @"Take the X-Buster";
    
    Tile *tile6 = [[Tile alloc]init];
    tile6.location = @"Location 6: The Snowy mountain";
    tile6.backgroundImage = [UIImage imageNamed:@"snowymountain.jpg"];
    tile6.healthEffect = -22;
    tile6.actionButton = @"Show no fear";
    
        // group objects 4-6
        NSMutableArray *secondColumn = [[NSMutableArray alloc]init];
        [secondColumn addObject:tile4];
        [secondColumn addObject:tile5];
        [secondColumn addObject:tile6];
    

    Tile *tile7 = [[Tile alloc]init];
    tile7.location = @"Location 7: The plains";
    tile7.backgroundImage = [UIImage imageNamed:@"plains.jpg"];
    tile7.healthEffect = 8;
    tile7.actionButton = @"Fight those scum";
    
    Tile *tile8 = [[Tile alloc]init];
    tile8.location = @"Location 8: The antarctic";
    tile8.backgroundImage = [UIImage imageNamed:@"antarctic.jpg"];
    tile8.healthEffect = -46;
    tile8.actionButton = @"Abandoned house";
    
    Tile *tile9 = [[Tile alloc]init];
    tile9.location = @"Location 9: The loch";
    tile9.backgroundImage = [UIImage imageNamed:@"loch.jpg"];
    tile9.healthEffect = 20;
    tile9.actionButton = @"Get resources";
    
        // group object 7-9
        NSMutableArray *thirdColumn = [[NSMutableArray alloc]init];
        [thirdColumn addObject:tile7];
        [thirdColumn addObject:tile8];
        [thirdColumn addObject:tile9];
    

    Tile *tile10 = [[Tile alloc]init];
    tile10.location = @"Location 10: The forest";
    tile10.backgroundImage = [UIImage imageNamed:@"forest.jpg"];
    tile10.healthEffect = -15;
    tile10.actionButton = @"Repel the invaders";

    Tile *tile11 = [[Tile alloc]init];
    tile11.location = @"Location 11: The tundra";
    tile11.backgroundImage = [UIImage imageNamed:@"tundra.jpg"];
    tile11.healthEffect = -7;
    tile11.actionButton = @"Go deeper";
    
    Tile *tile12 = [[Tile alloc]init];
    tile12.location = @"Location 12: The galaxy";
    tile12.backgroundImage = [UIImage imageNamed:@"galaxy2.jpg"];
    tile12.healthEffect = -15;
    tile12.actionButton = @"Fight"; 
    
    // group object 10-12
    NSMutableArray *fourthColumn = [[NSMutableArray alloc]init];
    [fourthColumn addObject:tile10];
    [fourthColumn addObject:tile11];
    [fourthColumn addObject:tile12];

    // Return an array. Group all the previously declared arrays. We use initWithObjects as a shorthand method to add array objects.
    NSArray *groupOfTiles = [[NSArray alloc] initWithObjects:firstColumn, secondColumn, thirdColumn, fourthColumn, nil];
    
    // Return the array
    return groupOfTiles;
}

-(GGCharacter *)character
{
    
    GGCharacter *character = [[GGCharacter alloc] init];
    
    character.health = 100;
    Armor *armor = [[Armor alloc]init];
    armor.name = @"Cloak";
    armor.health = 5;
    character.armor = armor;
    
    Weapon *weapon = [[Weapon alloc] init];
    weapon.name = @"Fists";
    weapon.damage = 10;
    character.weapon = weapon;
    
    return character;
    
}


-(GGBoss *) boss
{
    GGBoss *boss = [[GGBoss alloc]init];
    boss.health = 65;
    
    return boss; 
}

@end
