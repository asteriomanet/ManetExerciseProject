//
//  EPDisplayItemDM.h
//  ExerciseProject
//
//  Created by Code Complete on 4/12/14.
//  Copyright (c) 2014 Asterio Manet Jr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EPDisplayItemDM : NSObject

@property (nonatomic, strong) NSString *strItemLabel;
@property (nonatomic, strong) NSString *strItemDescription;
@property (nonatomic, strong) NSString *strItemImageLink;

- (instancetype)initWithAttributes:(NSDictionary *)attributes;

@end
