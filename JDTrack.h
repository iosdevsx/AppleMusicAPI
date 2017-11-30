//
//  JDTrack.h
//  AppleMusic
//
//  Created by Юрий Логинов on 25.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol JDTrack;

@interface JDTrack : JSONModel

@property (nonatomic, strong) NSString <Optional> *name;
@property (nonatomic, strong) NSNumber<Optional> *duration;

@end
