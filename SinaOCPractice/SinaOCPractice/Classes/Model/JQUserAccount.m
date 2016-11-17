//
//  JQUserAccount.m
//  SinaOCPractice
//
//  Created by maoge on 16/11/15.
//  Copyright © 2016年 maoge. All rights reserved.
//

#import "JQUserAccount.h"

@implementation JQUserAccount

- (instancetype)initWithDict:(NSDictionary *)dict {
    
    if (self = [super init]) {
        
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (void)setExpires_in:(NSInteger)expires_in {
    _expires_in = expires_in;
    
    _expiresDate = [NSDate dateWithTimeIntervalSinceNow: _expires_in];
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeObject:_uid forKey:@"uid"];
    [aCoder encodeObject:_access_token forKey:@"access_token"];
    [aCoder encodeObject:_avatar_large forKey:@"avatar_large"];
    [aCoder encodeObject:_expiresDate forKey:@"expiresDate"];
    
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    if (self = [super init]) {
        
        _name = [aDecoder decodeObjectForKey:@"name"];
        _uid = [aDecoder decodeObjectForKey:@"uid"];
        _access_token = [aDecoder decodeObjectForKey:@"access_token"];
        _avatar_large = [aDecoder decodeObjectForKey:@"avatar_large"];
        _expiresDate = [aDecoder decodeObjectForKey:@"expiresDate"];
    }
    
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}

@end
