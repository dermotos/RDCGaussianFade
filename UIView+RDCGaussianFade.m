//
//  UIView+RDCGaussianFade.m
//  RDCGaussianBlur
//
//  Created by Dermot on 6/18/13.
//  Copyright (c) 2013 Rocky Desk Creations. All rights reserved.
//



#import "UIView+RDCGaussianFade.h"
#import <QuartzCore/QuartzCore.h>
#import <CoreGraphics/CoreGraphics.h>
#import <CoreImage/CoreImage.h>

@implementation UIView (RDCGaussianFade)



-(void)fadeIn:(float)duration{
    [self fadeIn:duration withCompletion:nil];
}
-(void)fadeIn:(float)duration withCompletion:(void (^)()) block {
    NSAssert([NSThread mainThread], @"fadeIn: must be called from the main thread.");
    NSAssert([self superview] || (self.alpha != 0.0), @"Before calling fadeIn:, the view to be faded must be already added to its superview and must have its alpha set to zero opacity.");
    
    float blurRadius = 2.0f;
    
    UIImageView *blurredView;

    [self setAlpha:1.0f];
    UIGraphicsBeginImageContext(self.bounds.size);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *capture = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self setAlpha:0.0f];
    
    CIImage *inputImage = [[CIImage alloc] initWithCGImage:capture.CGImage];
    CIFilter *gaussianFilter = [CIFilter filterWithName: @"CIGaussianBlur" keysAndValues:kCIInputImageKey, inputImage, @"inputRadius", @(blurRadius), nil];
    CIImage *outputImage = [gaussianFilter outputImage];
    
    UIImage *finalImage = [[UIImage alloc] initWithCIImage:outputImage];
    blurredView = [[UIImageView alloc] initWithFrame:self.frame];
    
    [self.superview insertSubview:blurredView aboveSubview:self];
    [blurredView setImage:finalImage];
    [blurredView setAlpha:0.0f];
    
    [UIView animateWithDuration:duration /2 delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        [blurredView setAlpha:1.0f];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:duration /2 animations:^{
            [blurredView setAlpha:0.0f];
        }];
    }];
    
    [UIView animateWithDuration:duration delay:duration / 5 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        self.alpha = 1.0f;
    } completion:^(BOOL finished){
        if(block)
            block();
    }];
}

-(void)fadeOut:(float)duration{
    [self fadeOut:duration withCompletion:nil];
}
-(void)fadeOut:(float)duration withCompletion:(void (^)()) block{
    NSAssert([NSThread mainThread], @"fadeOut: must be called from the main thread.");
    NSAssert([self superview] || (self.alpha != 1.0), @"Before calling fadeIn:, the view to be faded must be already added to its superview and must have its alpha set to full opacity.");
    
    float blurRadius = 2.0f;
    
    UIImageView *blurredView;
    UIGraphicsBeginImageContext(self.bounds.size);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *capture = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    
    CIImage *inputImage = [[CIImage alloc] initWithCGImage:capture.CGImage];
    CIFilter *gaussianFilter = [CIFilter filterWithName: @"CIGaussianBlur" keysAndValues:kCIInputImageKey, inputImage, @"inputRadius", @(blurRadius), nil];
    CIImage *outputImage = [gaussianFilter outputImage];
    
    UIImage *finalImage = [[UIImage alloc] initWithCIImage:outputImage];
    blurredView = [[UIImageView alloc] initWithFrame:self.frame];
    
    [self.superview insertSubview:blurredView aboveSubview:self];
    [blurredView setImage:finalImage];
    [blurredView setAlpha:0.0f];
    
    [UIView animateWithDuration:duration /2 delay:duration / 5 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        [blurredView setAlpha:1.0f];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:duration /2 animations:^{
            [blurredView setAlpha:0.0f];
        }];
    }];
    
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        self.alpha = 0.0f;
    } completion:^(BOOL finished){
        if(block)
            block();
    }];
}


@end
