//
//  UIColor+Color.m
//  rs.ios.stage-task7
//
//  Created by Ivan on 7/4/21.
//

#import "UIColor+Color.h"

@implementation UIColor (Color)
+ (UIColor *)colorFromHex:(unsigned long)hex
{
    return [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0
                           green:((float)((hex & 0xFF00) >> 8))/255.0
                            blue:((float)(hex & 0xFF))/255.0
                           alpha:1.0];
}
@end
