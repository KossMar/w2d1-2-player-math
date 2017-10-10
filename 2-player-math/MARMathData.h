//
//  MARMathController.h
//  2-player-math
//
//  Created by Mar Koss on 2017-10-09.
//  Copyright © 2017 Mar Koss. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MARMathData : NSObject

@property (nonatomic) NSString *question;
@property (nonatomic) NSInteger answer;
@property (nonatomic) int x;
@property (nonatomic) int y;
@property (nonatomic) int oneScore;
@property (nonatomic) int twoScore;
@property (nonatomic) BOOL playerTurn;
@property (nonatomic) int oneLives;
@property (nonatomic) int twoLives;

-(NSString*)generateAdditionQuestion;

-(void)switchPlayerTurn;


@end
