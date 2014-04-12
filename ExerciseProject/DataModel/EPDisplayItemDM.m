//
//  EPDisplayItemDM.m
//  ExerciseProject
//
//  Created by Code Complete on 4/12/14.
//  Copyright (c) 2014 Asterio Manet Jr. All rights reserved.
//

#import "EPDisplayItemDM.h"

static NSString * const kVendorName  = @"title";
static NSString * const kDescription = @"description";
static NSString * const kImageLink   = @"imageHref";

@implementation EPDisplayItemDM

- (instancetype)initWithAttributes:(NSDictionary *)attributes{
    self = [super init];
    if (self) {
        self.strItemDescription = attributes[kDescription];
        self.strItemLabel       = attributes[kVendorName];
        self.strItemImageLink   = attributes[kImageLink];
    }
    return self;
}
@end
