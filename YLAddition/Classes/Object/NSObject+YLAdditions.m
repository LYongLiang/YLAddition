//
//  NSObject+YLAdditions.m
//  TestToolsAndCategroys
//
//  Created by MobbyDeveloper on 15/11/25.
//  Copyright © 2015年 LYL. All rights reserved.
//

#import "NSObject+YLAdditions.h"

@implementation NSObject (YLAdditions)



//把传进来的数据为NSNull的对象移除
+ (id)turnNullToNilForObject:(id)item
{
    if([item isKindOfClass:[NSDictionary class]]){
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:item];
        for (NSString *key in [dic allKeys]) {
            id value = [dic objectForKey:key];
            id o = [self turnNullToNilForObject:value];
            if (o) {
                [dic setObject:o forKey:key];
            }
            else {
                [dic removeObjectForKey:key];
            }
        }
        return dic;
    }
    else if([item isKindOfClass:[NSArray class]]){
        NSMutableArray *arr= [NSMutableArray arrayWithArray:item];
        for (NSInteger i = [arr count]-1; i >= 0; i--) {
            id value = [arr objectAtIndex:i];
            id o = [self turnNullToNilForObject:value];
            if (o) {
                [arr replaceObjectAtIndex:i withObject:o];
            }
            else {
                [arr removeObjectAtIndex:i];
            }
        }
        return arr;
    }
    return [item nullTonil];
}

- (id)nilToNull {
    
    if (self == nil) {
        return [NSNull null];
    }else
        return self;
}

- (id)nullToKong {
    if (self == nil) {
        return @"";
    }else
        return self;
}


- (id)nullTonil
{
    if ([self isKindOfClass:[NSNull class]]) {
        return nil;
    }
    if ([self isKindOfClass:[NSString class]]) {
        if([(NSString *)self length] == 0)
        {
            return nil;
        }
    }
    return self;
    
}
- (id)objcetByRemoveNullObjects
{
    return [NSObject turnNullToNilForObject:self];
}
- (void)setArchiveredObject:(NSObject *)object forKey:(NSString *)key
{
    if (object == nil) {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    }else {
        [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:object] forKey:key];
    }
}
- (id)archiveredObjectForKey:(NSString *)key
{
    return [NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:key]];
}

- (UIAlertView *)showAlertWith:(NSString *)title andMessage:(NSString *)message
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
    
    return alert;
}


- (void)showHttpError {
    [self showAlertWith:@"提示" andMessage:@"网络请求异常~"];
}


@end
