//
//  EPNetworkHandler.m
//  ExerciseProject
//
//  Created by Code Complete on 4/12/14.
//  Copyright (c) 2014 Asterio Manet Jr. All rights reserved.
//

#import "EPNetworkHandler.h"

static EPNetworkHandler *_sharedClient = nil;
static NSString * const EPNetworkHandlerBaseURLString = @"http://guarded-basin-2383.herokuapp.com/";

@implementation EPNetworkHandler
+ (instancetype)sharedClient{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!_sharedClient) {
            _sharedClient = [[EPNetworkHandler alloc] initWithBaseURL:[NSURL URLWithString:EPNetworkHandlerBaseURLString]];
            _sharedClient.securityPolicy.allowInvalidCertificates   = YES;
            _sharedClient.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/plain",@"text/html", nil];
            [_sharedClient setResponseSerializer:[AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments]];
        }
    });
    return _sharedClient;
}

- (void) retrieveData:(void(^)(NSDictionary *dict, NSError *error)) block{
    [_sharedClient GET:@"facts.json" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        block((NSDictionary*)responseObject,nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        block(nil, error);
    }];
}
@end
