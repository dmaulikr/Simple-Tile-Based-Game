//
//  ViewController.m
//  Simple Tile Based Game
//
//  Created by King Gregory on 11/2/14.
//  Copyright (c) 2014 Protocol. All rights reserved.
//

#import "ViewController.h"
#import "Factory.h"
#import "Tile.h"


@interface ViewController ()

@end

@implementation ViewController

// As much as we can, we want ViewController to only manage the view. It is better from an organizational standpoint to delegate different task to different objects; so that you do not confuse yourself which object does what.

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Factory *instanceFromFactory = [[Factory alloc]init];
    self.tiler = [instanceFromFactory factoryTiles]; // Remember that a method call has the form [VariableName MethodName]
    
    self.character = [instanceFromFactory character];
    self.boss = [instanceFromFactory boss];
    
    self.currentPoint = CGPointMake(0, 0);
    
    // NSLog(@"%f %f", self.currentPoint.x, self.currentPoint.y);
    [self updateCharacterStatsForArmor:nil withWeapons:nil withHealthEffects:0];
    
    [self updateTiles];
    
    [self updateButtons];
    
}

-(void) updateTiles // This method is used to update the information on the tiles: location value, background image
{
    Tile *tileModel = [[self.tiler objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    self.locationValue.text = tileModel.location; //update the location value
    self.backgroundImageView.image = tileModel.backgroundImage; // update the background image
    self.healthValue.text = [NSString stringWithFormat:@"%i", self.character.health];
    self.damageValue.text = [NSString stringWithFormat:@"%i", self.character.damage];
    self.armorType.text = self.character.armor.name;
    self.weaponType.text = self.character.weapon.name;
    [self.actionButton setTitle:tileModel.actionButton forState:(UIControlStateNormal)];
    
}

- (void) updateButtons // hide/show buttons
{
    self.westButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x -1, self.currentPoint.y)];
    self.eastButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x +1, self.currentPoint.y)];
    self.northButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y +1)];
    self.southButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y - 1)];
}

- (BOOL) tileExistsAtPoint:(CGPoint)point // helper method
{
    if (point.y >= 0 && point.x >= 0 && point.x < [self.tiler count] && point.y < [[self.tiler objectAtIndex:point.x]count]) {
        return NO;
    }
    
    else {
        return YES;
    }
    
}

-(void)updateCharacterStatsForArmor:(Armor *)armor withWeapons:(Weapon *)weapon withHealthEffects:(int)healthEffect
{
    
    if (armor != nil) {
        self.character.health = self.character.health - self.character.armor.health + armor.health;
        self.character.armor = armor;
    }
    else if (weapon != nil){
        self.character.damage = self.character.damage - self.character.weapon.damage + weapon.damage;
        self.character.weapon = weapon;
    }
    else if (healthEffect != 0){
        self.character.health = self.character.health + healthEffect;
    }
    
    else {
        self.character.health = self.character.health + self.character.armor.health;
        self.character.damage = self.character.damage + self.character.weapon.damage;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



// IBActions

- (IBAction)actionButtonPressed:(UIButton *)sender {
    
    Tile *tile = [[self.tiler objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    
    if (tile.healthEffect == -15) {
        self.boss.health = self.boss.health - self.character.damage;
    }
    
    [self updateCharacterStatsForArmor:tile.armor withWeapons:tile.weapon withHealthEffects:tile.healthEffect];
    [self updateTiles];
    
    if (self.character.health <= 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Death Message" message:@"You have died please restart the game" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
    else if (self.boss.health <= 0){
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Victory" message:@"You have won" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show]; 
    }
}

#pragma mark - directional buttons

- (IBAction)northButtonPressed:(UIButton *)sender
{
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y + 1);
    
    [self updateButtons];
    [self updateTiles];
}

- (IBAction)southButtonPressed:(UIButton *)sender
{
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y - 1);
    
    [self updateButtons];
    [self updateTiles];
}



- (IBAction)eastButtonPressed:(UIButton *)sender
{
    self.currentPoint = CGPointMake(self.currentPoint.x + 1, self.currentPoint.y);
    
    [self updateButtons];
    [self updateTiles];

}

- (IBAction)westButtonPressed:(UIButton *)sender
{
    self.currentPoint = CGPointMake(self.currentPoint.x - 1, self.currentPoint.y);
    
    [self updateButtons];
    [self updateTiles];
}

#pragma mark - reset

- (IBAction)resetButtonPressed:(UIButton *)sender {
    
    self.character = nil; // point to no object
    self.boss = nil;
    [self viewDidLoad];
    
}


@end
