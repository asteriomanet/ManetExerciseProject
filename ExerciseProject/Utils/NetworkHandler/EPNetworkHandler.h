//
//  EPNetworkHandler.h
//  ExerciseProject
//
//  Created by Code Complete on 4/12/14.
//  Copyright (c) 2014 Asterio Manet Jr. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface EPNetworkHandler : AFHTTPSessionManager
+ (instancetype)sharedClient;
- (void) retrieveData:(void(^)(NSDictionary *dict, NSError *error)) block;

@end
