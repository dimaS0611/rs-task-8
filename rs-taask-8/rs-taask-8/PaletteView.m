//
//  PaletteView.m
//  rs-taask-8
//
//  Created by Dzmitry Semenovich on 18.07.21.
//

#import "PaletteView.h"

@implementation PaletteView

- (id)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
       [self setupView];
    }
    return self;
}

- (void)setupView {
    [self setBackgroundColor: UIColor.whiteColor];
    [[self layer] setCornerRadius:25];
    [[self layer] setBorderWidth:1];
    [[self layer] setBorderColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.09].CGColor];
    
    self.layer.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2].CGColor;
    self.layer.shadowOffset = CGSizeMake(0, 0);
    self.layer.shadowOpacity = 1;
    self.layer.shadowRadius = 20;
    
    UIButton * saveButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [saveButton setTitle:@"Save" forState:UIControlStateNormal];
    [[saveButton layer] setBorderColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.09].CGColor];
    [[saveButton layer] setBorderWidth:1];
    [[saveButton layer] setCornerRadius:10];
    [saveButton setBackgroundColor:UIColor.whiteColor];
    [saveButton addTarget:self action:@selector(dismissView) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:saveButton];
    
    [saveButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [[[saveButton topAnchor] constraintEqualToAnchor:self.topAnchor constant:20] setActive:YES];
    [[[saveButton trailingAnchor] constraintEqualToAnchor:self.trailingAnchor constant:-40] setActive:YES];
    [[[saveButton leadingAnchor] constraintEqualToAnchor:self.leadingAnchor constant:250] setActive:YES];
    [[[saveButton bottomAnchor] constraintEqualToAnchor:self.bottomAnchor constant:-280] setActive:YES];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setBackgroundColor:UIColor.whiteColor];
    [[btn layer] setCornerRadius:10];
    [btn addTarget:self action:@selector(paletteButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    CALayer * nonactive = [CALayer layer];
    nonactive.frame = CGRectMake(10, 10, 30, 30);
    nonactive.masksToBounds = YES;
    [nonactive setBackgroundColor:UIColor.redColor.CGColor];
    [nonactive setCornerRadius:10];
    
    CALayer * active = [CALayer layer];
    active.frame = CGRectMake(5, 5, 40, 40);
    active.masksToBounds = YES;
    [active setBackgroundColor:UIColor.redColor.CGColor];
    [active setCornerRadius:10];
   
    [[btn layer] addSublayer:active];
    [[btn layer] addSublayer:nonactive];
    
   // [[btn layer] insertSublayer:active above:[btn layer]];
    
    [active setHidden:YES];
    [[btn layer] setBorderColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.09].CGColor];
    [[btn layer] setBorderWidth:1];
    [[btn layer] setCornerRadius:10];
    
  //  [[[[btn layer] sublayers] firstObject] setHidden:YES];
    
    [self addSubview:btn];
    
    [btn setTranslatesAutoresizingMaskIntoConstraints:NO];
    [[[btn topAnchor] constraintEqualToAnchor:self.topAnchor constant:92] setActive:YES];
    [[[btn leadingAnchor] constraintEqualToAnchor:self.leadingAnchor constant:17] setActive:YES];
    [[[btn widthAnchor] constraintEqualToConstant:50] setActive:YES];
    [[[btn heightAnchor] constraintEqualToConstant:50] setActive:YES];
}

- (void) dismissView {
    [UIView animateWithDuration:0.7 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.frame = CGRectMake(0, self.superview.bounds.size.height, self.superview.bounds.size.width, 0);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void) changeButtoLayer:(BOOL)isHidden forButton:(UIButton *)sender {
    if(sender.layer.sublayers.count > 3) {
        [UIView transitionWithView:sender duration:0.4 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
            [[[sender.layer sublayers] objectAtIndex: 1] setHidden: isHidden];
        } completion:nil];
       
    } else {
        [UIView transitionWithView:sender duration:0.4 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                [[[sender.layer sublayers] firstObject] setHidden: isHidden];
        } completion:nil];
    }
}

- (void)paletteButtonAction:(UIButton *)sender {
    
    if (!sender.selected) {
        if(sender.layer.sublayers.count > 3) {
            [self setBackgroundColor: [UIColor colorWithCGColor:[[sender.layer sublayers] objectAtIndex: 1].backgroundColor]];
        } else {
            [self setBackgroundColor: [UIColor colorWithCGColor:[[sender.layer sublayers] firstObject].backgroundColor]];
        }
        [self changeButtoLayer:NO forButton:sender];
        [sender setSelected: YES];
    } else {
        [self setBackgroundColor: UIColor.whiteColor];
        [self changeButtoLayer:YES forButton:sender];
        [sender setSelected: NO];
    }

}
@end
