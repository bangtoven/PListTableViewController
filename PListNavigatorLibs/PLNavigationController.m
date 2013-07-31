//
//  PLNavigationController.m
//  PListNavigator
//
//  Created by Jungho Bang on 13. 7. 30..
//  Copyright (c) 2013년 Bangtoven. All rights reserved.
//

#import "PLNavigationController.h"
#import "PLDictionaryTableViewController.h"
#import "PLArrayTableViewController.h"

@interface PLNavigationController ()
@property (nonatomic, strong) id data;
@end

@implementation PLNavigationController

- (id)initWithRootData:(id)data {
    UITableViewController *rootViewController;
    if ([data isKindOfClass:[NSDictionary class]]) {
        rootViewController = [[PLDictionaryTableViewController alloc] initWithDictionary:data];
    } else if ([data isKindOfClass:[NSArray class]]) {
        rootViewController = [[PLArrayTableViewController alloc] initWithArray:data];
    } else {
        NSLog(@"Data have to be collection type.");
        return nil;
    }
    rootViewController.title = @"ROOT";
    return [super initWithRootViewController:rootViewController];
}

@end
