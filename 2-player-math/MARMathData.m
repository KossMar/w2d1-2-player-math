//
//  MARMathController.m
//  2-player-math
//
//  Created by Mar Koss on 2017-10-09.
//  Copyright © 2017 Mar Koss. All rights reserved.
//

#import "MARMathData.h"

@implementation MARMathData

- (instancetype)init
{
    self = [super init];
    if (self) {
        _playerTurn = YES;
        _oneLives = 3;
        _twoLives = 3;
    }
    return self;
}

-(NSString*)generateAdditionQuestion {
    
    NSString *player;
    
    int a = arc4random_uniform(101);
    int b = arc4random_uniform(101);
    self.x = b;
    self.y = a;
    
    self.answer = a + b;
    
    if (self.playerTurn == YES){
        player = @"PLAYER 1: ";
    }
    else {
        player = @"PLAYER 2: ";
    }
    
    player = [player mutableCopy];
    
    NSString *question = [NSString stringWithFormat:@"%i + %i", a, b];

    NSString *playerAndQuestion = [player stringByAppendingString:question];
    
return playerAndQuestion;
}

-(void)switchPlayerTurn {
    if (self.playerTurn == YES){
        self.playerTurn = NO;
    }
    else {
        self.playerTurn = YES;
    }
}



@end
