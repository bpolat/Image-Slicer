//
//  ViewController.m
//  Image Slicer
//
//  Created by polat on 25/07/14.
//  Copyright (c) 2014 polat. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self getImagesFromImage:[UIImage imageNamed:@"1.png"] withRow:4 withColumn:4];
    
    
	// Do any additional setup after loading the view, typically from a nib.
}




-(NSMutableArray *)getImagesFromImage:(UIImage *)image withRow:(NSInteger)rows withColumn:(NSInteger)columns
{
    NSMutableArray *images = [NSMutableArray array];
    CGSize imageSize = image.size;
    CGFloat xPos = 0.0, yPos = 0.0;
    CGFloat width = imageSize.width/rows;
    CGFloat height = imageSize.height/columns;
    for (int y = 0; y < columns; y++) {
        xPos = 0.0;
        for (int x = 0; x < rows; x++) {
            
            CGRect rect = CGRectMake(xPos, yPos, width, height);
            CGImageRef cImage = CGImageCreateWithImageInRect([image CGImage],  rect);
            
            UIImage *dImage = [[UIImage alloc] initWithCGImage:cImage];
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(x*width, y*height, width, height)];
            [imageView setImage:dImage];
            [imageView.layer setBorderColor:[[UIColor blackColor] CGColor]];
            [imageView.layer setBorderWidth:1.0];
            [self.view addSubview:imageView];
            [images addObject:dImage];
            xPos += width;
        }
        yPos += height;
    }
    return images;
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
