//
//  GPUImageInputFilterGroup.h
//  GPUImage
//
//  Created by Tbxark on 7/20/16.
//  Copyright © 2016 Brad Larson. All rights reserved.
//

#import "GPUImageFilterGroup.h"
#import "GPUImagePicture.h"



@interface GPUImageInputFilterGroup  : GPUImageFilterGroup
{
    GPUImagePicture *imageSource1;
    GPUImagePicture *imageSource2;
    GPUImagePicture *imageSource3;
    GPUImagePicture *imageSource4;
}

@property(nonatomic, strong) GPUImageOutput<GPUImageInput> *multInputFilter;

- (instancetype) initWithShader:(NSString *)shader images:(NSArray<UIImage *>*)images;

@end
