//
//  UIImage+Resize.h
//  rs.ios.stage-task7
//
//  Created by Ivan on 7/4/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Resize)
+ (UIImage *)imageWithColor:(UIColor *)color;
- (UIImage *)imageWithImage:(UIImage *)image convertToSize:(CGSize)size;
@end

NS_ASSUME_NONNULL_END
