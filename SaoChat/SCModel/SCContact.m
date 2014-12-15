//
//  SCContact.m
//  SaoChat
//
//  Created by lvjian on 12/15/14.
//  Copyright (c) 2014 lvjian. All rights reserved.
//

#import "SCContact.h"
#import "AFHTTPRequestOperation.h"
#import "AFHTTPRequestOperationManager.h"

@implementation SCContact

- (instancetype)initWithUserId:(NSString *)userId name:(NSString *)name avatorUrl:(NSString *)avatorUrl {
    self = [super init];
    if (self) {
        self.userId = userId;
        self.name = name;
        self.avatorUrl = avatorUrl;
    }

    return self;
}

+ (instancetype)contactWithUserId:(NSString *)userId name:(NSString *)name avatorUrl:(NSString *)avatorUrl {
    return [[self alloc] initWithUserId:userId name:name avatorUrl:avatorUrl];
}

+ (instancetype)contactFromDictionary:(NSDictionary *) dict {
    return [SCContact contactWithUserId:[dict objectForKey:@"id"]
                                   name:[dict objectForKey:@"name"]
                              avatorUrl:[dict objectForKey:@"avator_url"]];
}

+ (NSArray *) contactsFromDictionaries: (NSArray *) dicts {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:12];

    for (NSDictionary *dictItem in dicts) {
        [array addObject:[SCContact contactFromDictionary:dictItem]];
    }

    return array;
}

+ (void) listWithSuccess: (void (^)(NSArray *contacts)) successBlock
                 failure: (void (^)(AFHTTPRequestOperation *operation, NSError *error)) failureBlock {

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://localhost:3000/users.json" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        successBlock([SCContact contactsFromDictionaries:responseObject]);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        failureBlock(operation, error);
    }];
}

@end
