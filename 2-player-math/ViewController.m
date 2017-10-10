//
//  ViewController.m
//  2-player-math
//
//  Created by Mar Koss on 2017-10-09.
//  Copyright © 2017 Mar Koss. All rights reserved.
//

#import "ViewController.h"
#import "MARMathData.h"

@interface ViewController ()

@property (nonatomic) MARMathData *mathData;
@property (nonatomic) NSMutableString *guessStr;
@property (weak, nonatomic) IBOutlet UILabel *mathQuestionLabel;
@property (weak, nonatomic) IBOutlet UILabel *firstScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *guessLabel;
@property (weak, nonatomic) IBOutlet UILabel *answerResponseLabel;
@property (weak, nonatomic) IBOutlet UILabel *firstLivesLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondLivesLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mathData = [MARMathData new];
    self.firstScoreLabel.text = @"0";
    self.secondScoreLabel.text = @"0";
    self.guessLabel.text = @"GUESS RIGHT, LOSER!";
    self.guessStr = [NSMutableString new];
    self.answerResponseLabel.text = @" ";
    self.firstLivesLabel.text = [NSString stringWithFormat:@"%i", self.mathData.oneLives];
    self.secondLivesLabel.text = [NSString stringWithFormat:@"%i", self.mathData.twoLives];
    
    
    
}
- (IBAction)startGameView:(id)sender {

    self.mathQuestionLabel.text = [self.mathData generateAdditionQuestion];
}

// enter numbers into Guess Box
- (IBAction)enterNumber:(UIButton*)sender {
    NSString *string = [NSString stringWithFormat:@"%li", (long)sender.tag];
    self.guessStr = [[self.guessStr stringByAppendingString:string] mutableCopy];
    self.guessLabel.text = self.guessStr;

}

// submit answer
- (IBAction)enterGuessView:(id)sender {
    float guessInt = [self.guessStr integerValue];
    
    if (self.mathData.playerTurn == YES) {
        if (guessInt == self.mathData.answer) {
            self.answerResponseLabel.text = @"CORRECT!!!";
            self.mathData.oneScore ++;
            self.firstScoreLabel.text = [NSString stringWithFormat:@"%i", self.mathData.oneScore];
            [self.mathData switchPlayerTurn];
            self.mathQuestionLabel.text = [self.mathData generateAdditionQuestion];

        }
        else {
            self.answerResponseLabel.text = @"WRONG!!!";
            self.mathData.oneLives --;
            self.firstLivesLabel.text = [NSString stringWithFormat:@"%i", self.mathData.oneLives];
            if (self.mathData.oneLives > 0){
                [self.mathData switchPlayerTurn];
                self.mathQuestionLabel.text = [self.mathData generateAdditionQuestion];
            }
            else  {
                self.mathQuestionLabel.text = @"PLAYER 2 WINS";
            }


            
            
        }
    }

    
    else {
        if (guessInt == self.mathData.answer) {
            self.answerResponseLabel.text = @"CORRECT!!!";
            self.mathData.twoScore ++;
            self.secondScoreLabel.text = [NSString stringWithFormat:@"%i", self.mathData.twoScore];
            [self.mathData switchPlayerTurn];
            self.mathQuestionLabel.text = [self.mathData generateAdditionQuestion];
        }
        else {
            self.answerResponseLabel.text = @"WRONG!!!";
            self.mathData.twoLives --;
            self.secondLivesLabel.text = [NSString stringWithFormat:@"%i", self.mathData.twoLives];
            if (self.mathData.twoLives > 0){
                [self.mathData switchPlayerTurn];
//                self.guessStr = @" ";
                self.mathQuestionLabel.text = [self.mathData generateAdditionQuestion];
            }
            else  {
                self.mathQuestionLabel.text = @"PLAYER 1 WINS";
            }
            

        }

    }
    

    self.guessStr = @"";
    self.guessLabel.text = self.guessStr;


}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
