//
//  CustomView.m
//  Earth
//
//  Created by Gin on 7/27/14.
//  Copyright (c) 2014 Nguyễn Huỳnh Lâm. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView
{
    NSTimer *timer;
    float alpha;
    float x,y;
    int count,centerX,centerY,arrayCount;
    NSArray* array;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        alpha = 0.0;
        count = 0;
        centerX = 160;centerY = 684;
        timer = [NSTimer scheduledTimerWithTimeInterval: 0.1
                                                  target: self
                                                selector: @selector(refreshView)
                                                userInfo: nil
                                                 repeats: YES];
        x = -135;
        y = -395;
    }
    return self;
}

-(void)refreshView
{
    [self setNeedsDisplay];
}

-(void)cleanView
{
    [timer invalidate];
}

- (void)drawRect:(CGRect)rect //
{
    
	CGContextRef context = UIGraphicsGetCurrentContext();
    
  //  CGContextFillRect(context, rect);
    
    CGRect earth = CGRectMake(135, 259, 50, 50); // ve hinh tron
    CGContextAddEllipseInRect(context, earth);
    
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor); // ve mau
    CGContextSetLineWidth(context, 2.0); // tạo độ rộng viền
	CGContextSetFillColorWithColor(context, [UIColor cyanColor].CGColor);
    CGContextDrawPath(context, kCGPathFillStroke);
    
    CGContextTranslateCTM(context, centerX, centerY);
    CGContextRotateCTM(context, alpha);
    alpha += 0.01;
    count++;
    NSLog(@"%f",alpha);
    
    if(count==70) // 32
    {
        x = 135;
        y = 410;
        centerX = 160;centerY = -116;
        alpha = 0;

    }
    if(count==137)
    {
        count = 0;
        x = -135;
        y = -395;
        centerX = 160;centerY = 684;
        alpha = 0;
    }
    
    CGRect moon = CGRectMake(x, y, 10, 10);
    CGContextAddEllipseInRect(context, moon);
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor); // ve mau
    CGContextSetLineWidth(context, 1.0); // tạo độ rộng viền
	CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    CGContextDrawPath(context, kCGPathFillStroke);
    

}

@end
