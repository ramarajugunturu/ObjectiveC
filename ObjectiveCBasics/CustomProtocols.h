//
//  CustomProtocols.h
//  ObjectiveCBasics
//
//  Created by Rama Raju Gunturu on 26/10/14.
//  Copyright (c) 2014 iApp Soltions. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CustomProtocols <NSObject>

@end

@protocol SpriteGameDelegate <NSObject>
@required
-(NSString *)wordForCurrentGame;
-(void)willStartFallingOfFruits;
-(void)capturedGoodFruitWithLetter:(NSString *)letter andType:(int)type;
-(void)capturedBadFruitWithLetter:(NSString *)letter andType:(int)type;
-(void)didCapturedAllLettersInScene:(id)scene;

@optional
-(BOOL)willAllowedBomb;
-(int)bombFrequency;
-(float)speedFactorOfFallingApple;
-(BOOL)willAllowedRotenApples;

-(void)touchedBombByBeetle;
-(void)touchedRottenAppleByBeetle;
@end