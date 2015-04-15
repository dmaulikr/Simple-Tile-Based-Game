//
//  ViewController.h
//  Simple Tile Based Game
//
//  Created by King Gregory on 11/2/14.
//  Copyright (c) 2014 Protocol. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GGCharacter.h"
#import "GGBoss.h"

@interface ViewController : UIViewController

// instance Variables
@property (nonatomic) CGPoint currentPoint; // this will store the information for the current point
@property (strong, nonatomic) NSArray *tiler;
@property (strong, nonatomic) GGCharacter *character;
@property (strong, nonatomic) GGBoss *boss; 

// Background Image View
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;

// Character Stats View
@property (strong, nonatomic) IBOutlet UILabel *healthValue;
@property (strong, nonatomic) IBOutlet UILabel *damageValue;
@property (strong, nonatomic) IBOutlet UILabel *weaponType;
@property (strong, nonatomic) IBOutlet UILabel *armorType;

// Available Actions View
@property (strong, nonatomic) IBOutlet UIButton *actionButton;

// Locator View
@property (strong, nonatomic) IBOutlet UILabel *locationValue;

// Directional Buttons
@property (strong, nonatomic) IBOutlet UIButton *northButton;
@property (strong, nonatomic) IBOutlet UIButton *eastButton;
@property (strong, nonatomic) IBOutlet UIButton *westButton;
@property (strong, nonatomic) IBOutlet UIButton *southButton;


// IBActions

- (IBAction)actionButtonPressed:(UIButton *)sender;
- (IBAction)northButtonPressed:(UIButton *)sender;
- (IBAction)eastButtonPressed:(UIButton *)sender;
- (IBAction)westButtonPressed:(UIButton *)sender;
- (IBAction)southButtonPressed:(UIButton *)sender;
- (IBAction)resetButtonPressed:(UIButton *)sender;


@end

