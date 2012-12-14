//
//  ViewController.m
//  TalkAroundIT
//
//  Created by Catherine Sweeney on 12/12/2012.
//  Copyright (c) 2012 Catherine Sweeney. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


NSInteger  no_cards=50;
NSInteger  quest_no;
NSInteger  card_no;
NSInteger  cards[50];

UIImage *imgCard;
UILabel *lblWord;
UILabel *lblWordfl;

-(IBAction) nextPicture;
-(IBAction) lastPicture;
-(IBAction) nextQuestion;
-(IBAction) lastQuestion;
-(IBAction) playFirstSound;
-(IBAction) playFirstSyllable;
-(IBAction) playSoundsLike;
-(IBAction) playNoise;
-(IBAction) playSentenceCompletion;
-(IBAction) playInfo;
-(IBAction) showFirstLetter;
-(IBAction) showWord;



-(void) start
{
    quest_no=1;
    card_no=1;
    [self shuffleCards]
    [self getPicture];
    [self getQuestion];
}


- (void) getPicture
{
    NSInteger  current_card;
    current_card= cards[card_no-1];
    
    open database and run sql
    SELECT * FROM Objects where object_id = current_card
    
    imgCard.image = object_name;
    lblWord.text = object_name;
    lblWordfl.text = first_letter(object_name);
    lblWord.hidden=TRUE;
    lblWordfl.hidden=TRUE;
}

- (void)getQuestion
{
    NSInteger  current_card;
    current_card= cards[card_no-1];
 
    open database and run sql
    SELECT * FROM Questions q,Hints h where q.quest_id = quest_no
    and h.question_id = q.question_id and h.object_id = current_card
    
    lblQuestionGrp.text = question_grp;
    lblQuestion.text = question;
    lblQuestionHint.text = question_hint;
    
}

-(void)nextPicture
{
    do while (card_no<50)
    {
        card_no++;
        [self getPicture];
    }
}

- (void)lastPicture
{
    do while (card_no>1)
    {
        card_no--;
        [self getPicture];
    }
}


- (void)nextQuestion
{
    do while (quest_no<6)
    {
        quest_no ++;
        [self getQuestion];
    }
}

- (void) lastQuestion
{
    do while (quest_no>1)
    {
        quest_no --;
        [self getQuestion];
    }
}

- (void) shuffleCards
{
    NSInteger temp,rand_no;
    
    for (NSInteger i=0;i<no_cards;i++)
    {
        cards[i]=i+1;
    }
    for (NSInteger j=0;j<no_cards-1;j++)
    {
        temp=cards[no_cards-j];
        cards[no_cards-j]=cards[rand_no];
        cards[rand_no]=temp;
    }
}

-(void) stopSound
{
}

-(void) play
/*:NSString *pString*/
{
    [self stopSound];
   /* playsound pstring;*/
}

-(void) playFirstSound
{
    NSString *playString;
    
    /*playString = first_letter(lblCard.text);*/
    [self play:playString];
}

-(void) playFirstSyllable
{
    playString = concatenate(lblCard.text, @'fs');
    [self play:playString];
}

-(void) playSoundsLike
{
}

-(void) playNoise
{
}

-(void) playSentenceCompletion
{
}

-(void) playInfo
{
}

-(void) showFirstLetter
{
    lblWord.hidden=TRUE;
    lblWordfl.hidden=FALSE;
    
}

-(void) showWord
{
    lblWordfl.hidden=TRUE;
    lblWord.hidden=FALSE;
}


@end
