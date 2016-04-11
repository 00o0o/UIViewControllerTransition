//
//  ImageCell.m
//  UIViewControllerTransition
//
//  Created by Clover on 4/11/16.
//  Copyright © 2016 Clover. All rights reserved.
//

#import "ImageCell.h"
#import <YYWebImage/YYWebImage.h>

@interface ImageCell ()


@end

@implementation ImageCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
    
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self.contentView addSubview:_imageView];
    }
    
    return self;
}

- (void)setImageUrl:(NSString *)imageUrl {
    [_imageView yy_setImageWithURL:[NSURL URLWithString:imageUrl] placeholder:nil];
}
@end
