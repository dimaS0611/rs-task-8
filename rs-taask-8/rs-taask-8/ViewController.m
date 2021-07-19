//
//  ViewController.m
//  rs-taask-8
//
//  Created by Dzmitry Semenovich on 18.07.21.
//

#import "ViewController.h"
#import "PaletteView.h"
//#import "rs-taask-8-Swift.h"

@interface ViewController ()

@property (weak, nonatomic) UILayoutGuide * safeArea;
//@property (nonatomic, strong) DrawingsViewController * drawingVC;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.safeArea = self.view.layoutMarginsGuide;
    
    [self setupNavigationItems];
    [self setupViewInteractionItems];
}

- (void) setupNavigationItems {
    self.navigationItem.title = @"Artist";
    
    UIBarButtonItem * drawingsButton = [[UIBarButtonItem alloc] initWithTitle:@"Drawings" style: UIBarButtonItemStylePlain target:self action:nil];
    
    self.navigationItem.rightBarButtonItem = drawingsButton;
}

- (void) setupViewInteractionItems {
    [self.view setBackgroundColor: UIColor.whiteColor];
    
    UIImageView * canvas = [[UIImageView alloc] initWithFrame:CGRectZero];
    canvas.layer.shadowColor = [UIColor colorWithRed:0 green:0.7 blue:1 alpha:0.25].CGColor;
    canvas.layer.shadowOffset = CGSizeMake(2, 2);
    canvas.layer.shadowOpacity = 1;
    canvas.layer.shadowRadius = 8.0;
    [canvas.layer setBorderColor: [UIColor colorWithRed:0 green:0.7 blue:1 alpha:0.1].CGColor];
    [canvas.layer setCornerRadius:8.0];
    [canvas.layer setBorderWidth:2.0];
    [canvas setClipsToBounds: NO];
    
    [self.view addSubview:canvas];
    
    UIButton * paletteButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    [paletteButton setTitle:@"Open Palette" forState:UIControlStateNormal];
    [[paletteButton layer] setBorderColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.09].CGColor];
    [[paletteButton layer] setBorderWidth:1];
    [[paletteButton layer] setCornerRadius:10];
    [paletteButton addTarget:self action:@selector(showPalette:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:paletteButton];
    
    UIButton * drawButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    [drawButton setTitle:@"Draw" forState:UIControlStateNormal];
    [[drawButton layer] setBorderColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.09].CGColor];
    [[drawButton layer] setBorderWidth:1];
    [[drawButton layer] setCornerRadius:10];
    [self.view addSubview:drawButton];
    
    UIButton * timerButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    [timerButton setTitle:@"Open Timer" forState:UIControlStateNormal];
    [[timerButton layer] setBorderColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.09].CGColor];
    [[timerButton layer] setBorderWidth:1];
    [[timerButton layer] setCornerRadius:10];
    [self.view addSubview:timerButton];
    
    UIButton * shareButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    [shareButton setTitle:@"Share" forState:UIControlStateNormal];
    [[shareButton layer] setBorderColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.09].CGColor];
    [[shareButton layer] setBorderWidth:1];
    [[shareButton layer] setCornerRadius:10];
    [shareButton setUserInteractionEnabled:NO];
    [self.view addSubview:shareButton];

    [canvas setTranslatesAutoresizingMaskIntoConstraints:NO];
    [[[canvas topAnchor] constraintEqualToAnchor:self.safeArea.topAnchor constant:40.0] setActive:YES];
    [[[canvas leadingAnchor] constraintEqualToAnchor:self.view.leadingAnchor constant:37.0] setActive:YES];
    [[[canvas trailingAnchor] constraintEqualToAnchor:self.view.trailingAnchor constant:-37.0] setActive:YES];
    [[[canvas bottomAnchor] constraintEqualToAnchor:self.safeArea.bottomAnchor constant:-263.0] setActive:YES];

    [paletteButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [[[paletteButton topAnchor] constraintEqualToAnchor:canvas.bottomAnchor constant:50.0] setActive:YES];
    [[[paletteButton leadingAnchor] constraintEqualToAnchor:self.view.leadingAnchor constant:20.0] setActive:YES];
    [[[paletteButton trailingAnchor] constraintEqualToAnchor:self.view.trailingAnchor constant:-192.0] setActive:YES];
    [[[paletteButton bottomAnchor] constraintEqualToAnchor:self.view.bottomAnchor constant:-181.0] setActive:YES];
    
    [drawButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [[[drawButton topAnchor] constraintEqualToAnchor:canvas.bottomAnchor constant:50.0] setActive:YES];
    [[[drawButton leadingAnchor] constraintEqualToAnchor:paletteButton.trailingAnchor constant:60.0] setActive:YES];
    [[[drawButton trailingAnchor] constraintEqualToAnchor:self.view.trailingAnchor constant:-41] setActive:YES];
    [[[drawButton bottomAnchor] constraintEqualToAnchor:self.view.bottomAnchor constant:-181.0] setActive:YES];
    
    [timerButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [[[timerButton topAnchor] constraintEqualToAnchor:paletteButton.bottomAnchor constant:20.0] setActive:YES];
    [[[timerButton leadingAnchor] constraintEqualToAnchor:self.view.leadingAnchor constant:20.0] setActive:YES];
    [[[timerButton trailingAnchor] constraintEqualToAnchor:self.view.trailingAnchor constant:-204.0] setActive:YES];
    [[[timerButton bottomAnchor] constraintEqualToAnchor:self.view.bottomAnchor constant:-129] setActive:YES];
    
    [shareButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [[[shareButton topAnchor] constraintEqualToAnchor:drawButton.bottomAnchor constant:20.0] setActive:YES];
    [[[shareButton leadingAnchor] constraintEqualToAnchor:timerButton.trailingAnchor constant:68.0] setActive:YES];
    [[[shareButton trailingAnchor] constraintEqualToAnchor:self.view.trailingAnchor constant:-41] setActive:YES];
    [[[shareButton bottomAnchor] constraintEqualToAnchor:self.view.bottomAnchor constant:-129] setActive:YES];
    
    NSLog(@"%f",self.view.bounds.size.height);
    NSLog(@"%f",self.view.bounds.size.width);
}

- (void)showPalette:(UIButton *) sender {
    PaletteView * view = [[PaletteView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height , self.view.bounds.size.width, 0)];
    [UIView animateWithDuration:0.75 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        view.frame = CGRectMake(0, self.view.bounds.size.height * 0.55, self.view.bounds.size.width, self.view.bounds.size.height * 0.5);
    } completion:^(BOOL finished) {}];
    [self.view addSubview:view];
}

@end
