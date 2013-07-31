//
//  PLArrayTableViewController.m
//  PListNavigator
//
//  Created by Jungho Bang on 13. 7. 30..
//  Copyright (c) 2013년 Bangtoven. All rights reserved.
//

#import "PLArrayTableViewController.h"
#import "PLDictionaryTableViewController.h"

@interface PLArrayTableViewController ()
@property (nonatomic, strong) NSArray *data;
@end

@implementation PLArrayTableViewController

- (id)initWithArray:(NSArray*)data {
    if (self = [super init]) {
        self.data = data;
    }
    return self;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Array Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIdentifier];
    }
    
    id item = [self.data objectAtIndex:indexPath.row];
    if ([item isKindOfClass:[NSDictionary class]]) {
        cell.textLabel.text = @"(dictionary)";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    } else if ([item isKindOfClass:[NSArray class]]) {
        cell.textLabel.text = @"(array)";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    } else {
        cell.textLabel.text = NSStringFromClass([[self.data objectAtIndex:indexPath.row] class]);
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    cell.detailTextLabel.text = [item description];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewController *nextViewController;
    
    id item = [self.data objectAtIndex:indexPath.row];
    if ([item isKindOfClass:[NSDictionary class]]) {
        nextViewController = [[PLDictionaryTableViewController alloc] initWithDictionary:item];
    } else if ([item isKindOfClass:[NSArray class]]) {
        nextViewController = [[PLArrayTableViewController alloc] initWithArray:item];
    } else {
        return;
    }
    
    nextViewController.title = [NSString stringWithFormat:@"item %d",indexPath.row];
    [self.navigationController pushViewController:nextViewController animated:YES];
}

@end
