//
//  GPUImageInputFilterGroup.m
//  GPUImage
//
//  Created by Tbxark on 7/20/16.
//  Copyright © 2016 Brad Larson. All rights reserved.
//

#import "GPUImageInputFilterGroup.h"
#import "GPUImageFiveInputFilter.h"



@implementation GPUImageInputFilterGroup

- (instancetype) initWithShader:(NSString *)shader images:(NSArray<UIImage *>*)images {
    self = [super init];
    if (self) {
        
        GPUImageOutput<GPUImageInput> *filter = nil;
        switch (images.count) {
            case 0: {
                filter = [[GPUImageTwoInputFilter alloc] initWithFragmentShaderFromString:shader];
                break;
            }
            case 1: {
                filter = [[GPUImageTwoInputFilter alloc] initWithFragmentShaderFromString:shader];
                break;
            }
            case 2:{
                filter = [[GPUImageThreeInputFilter alloc] initWithFragmentShaderFromString:shader];
                break;
            }
            case 3:{
                filter = [[GPUImageFourInputFilter alloc] initWithFragmentShaderFromString:shader];
                break;
            }
            case 4:{
                filter = [[GPUImageFiveInputFilter alloc] initWithFragmentShaderFromString:shader];
                break;
            }
            default:{
                filter = [[GPUImageFiveInputFilter alloc] initWithFragmentShaderFromString:shader];
                break;
            }
        }
        _multInputFilter = filter;
        [self addFilter:filter];
        
        NSInteger count = images.count;
        
        if (count >= 1) {
            imageSource1 = [[GPUImagePicture alloc] initWithImage:images[0]];
            [imageSource1 addTarget:filter atTextureLocation:1];
            [imageSource1 processImage];
        }
        if (count >= 2) {
            imageSource2 = [[GPUImagePicture alloc] initWithImage:images[1]];
            [imageSource2 addTarget:filter atTextureLocation:2];
            [imageSource2 processImage];
        }
        if (count >= 3) {
            imageSource3 = [[GPUImagePicture alloc] initWithImage:images[2]];
            [imageSource3 addTarget:filter atTextureLocation:3];
            [imageSource3 processImage];
        }
        if (count >= 4) {
            imageSource4 = [[GPUImagePicture alloc] initWithImage:images[3]];
            [imageSource4 addTarget:filter atTextureLocation:4];
            [imageSource4 processImage];
        }
        
        self.initialFilters = [NSArray arrayWithObjects:filter, nil];
        self.terminalFilter = filter;
    }
    return self;
}

@end
