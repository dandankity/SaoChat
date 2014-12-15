#import <Foundation/Foundation.h>

@class AFHTTPRequestOperation;

@interface SCContact : NSObject

@property(strong, nonatomic) NSString *userId;
@property(strong, nonatomic) NSString *name;
@property(strong, nonatomic) NSString *avatorUrl;

- (instancetype)initWithUserId:(NSString *)userId name:(NSString *)name avatorUrl:(NSString *)avatorUrl;

+ (void)listWithSuccess:(void (^)(NSArray *contacts))successBlock failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failureBlock;

+ (instancetype)contactWithUserId:(NSString *)userId name:(NSString *)name avatorUrl:(NSString *)avatorUrl;


+ (instancetype)contactFromDictionary:(NSDictionary *)dict;

+ (NSArray *)contactsFromDictionaries:(NSArray *)dicts;
@end
