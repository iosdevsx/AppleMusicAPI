//
//  NSString+Utils.m
//  AppleMusic
//
//  Created by Юрий Логинов on 26.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

#import "NSString+Utils.h"

@implementation NSString (Utils)

+ (NSString *)formatInterval:(NSTimeInterval)interval {
    unsigned long milliseconds = interval;
    unsigned long seconds = milliseconds / 1000;
    milliseconds %= 1000;
    unsigned long minutes = seconds / 60;
    seconds %= 60;
    unsigned long hours = minutes / 60;
    minutes %= 60;
    
    NSMutableString * result = [NSMutableString new];
    
    if(hours)
        [result appendFormat: @"%lu hours ", hours];
    
    [result appendFormat: @"%2lu minutes", minutes];
    
    return result;
}

@end
