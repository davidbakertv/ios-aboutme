//
//  ViewController.m
//  Deploy on Day One
//
//  Created by David Baker on 9/30/13.
//  Copyright (c) 2013 David Baker. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *phoneLabel;
@property (strong, nonatomic) IBOutlet UILabel *emailLabel;
@property (strong, nonatomic) IBOutlet UITextView *descriptionView;
@property (strong, nonatomic) IBOutlet UIImageView *photoView;
@property (strong, nonatomic) IBOutlet UISegmentedControl *personPicker;
@property (strong, nonatomic) IBOutlet UIButton *facebookButton;



@property (strong,nonatomic) NSArray *images;
@property (strong,nonatomic) NSArray *descriptions;
@property (strong,nonatomic) NSArray *names;
@property (strong,nonatomic) NSArray *phoneNumbers;
@property (strong,nonatomic) NSArray *email;
@property (strong,nonatomic) NSArray *links;
@property (strong,nonatomic) NSURL *activeURL;

@end


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.names = @[@"Sunayna Jain",@"David Baker",@"Dasmer Singh"];
    self.phoneNumbers= @[@"(201) 936-8695",@"(212) 461-3255",@"(516) 232-4733"];
    self.email = @[@"sunayna.jain@flatironschool.com",@"david.baker@flatironschool.com",@"dasmer.singh@flatironschool.com"];
    
    NSString *sunaynaDescription = @"Done engineering in materials and textiles. Graduated from Cornell in January 2013. Been working with the non-profit Open Plans since then.";
    NSString *davidDescription = @"Working in music for the past 5 years.  Founded @spinsfm to bring radio requests to social media.  Web & mobile developer for @kanyewest";
    NSString *dasmerDescription = @"Graduated from Columbia in May. Started at finance job at JP Morgan in June.  Started teaching myself to code for iOS and can safely say I'm an addict!";
    self.descriptions = @[sunaynaDescription,davidDescription,dasmerDescription];
    
    UIImage *sunaynaPhoto = [UIImage imageNamed:@"sunanya-2.jpg"];
    UIImage *davidPhoto = [UIImage imageNamed:@"david-2.jpg"];
    UIImage *dasmerPhoto = [UIImage imageNamed:@"dasmer-2.jpg"];
    
    self.images = @[sunaynaPhoto,davidPhoto,dasmerPhoto];
    
    
    
    NSString *sunaynaLink=@"http://www.facebook.com/sunayna.jain.1";
    NSString *davidLink=@"http://www.facebook.com/davidbakertv";
    NSString *dasmerLink=@"http://www.facebook.com/dasmer";
    
    self.links = @[sunaynaLink,davidLink,dasmerLink];
    
    
    
    [self.facebookButton addTarget:self
               action:@selector(facebookButtonClicked)
     forControlEvents:UIControlEventTouchDown];
    
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

-(void) facebookButtonClicked{
    [[UIApplication sharedApplication] openURL:self.activeURL];
}


-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self clickedPicker:self.personPicker];
}
- (IBAction)clickedPicker:(UISegmentedControl *)sender {
    int index = [sender selectedSegmentIndex];
    
    self.photoView.image =  self.images[index];
    self.nameLabel.text = self.names[index];
    self.phoneLabel.text = self.phoneNumbers[index];
    self.emailLabel.text = self.email[index];
    self.descriptionView.text = self.descriptions[index];
    //self.linkLabel.text = self.links[index];
    self.activeURL = [NSURL URLWithString:self.links[index]];
    
    
    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
