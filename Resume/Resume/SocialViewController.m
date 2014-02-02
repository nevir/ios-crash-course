//
//  SocialViewController.m
//  Resume
//
//  Created by Ian MacLeod on 2/1/14.
//  Copyright (c) 2014 Jane Developer. All rights reserved.
//

#import "SocialViewController.h"
#import "SocialInfo.h"
#import "WebViewController.h"

@interface SocialViewController ()

@end

@implementation SocialViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        // Email
        return 1;
    } else {
        // Social links
        return [SocialInfo allSocialInfo].count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return [self tableView:tableView emailCellForRowAtIndexPath:indexPath];
    } else {
        return [self tableView:tableView socialNetworkCellForRowAtIndexPath:indexPath];
    }
}

- (UITableViewCell *)tableView:(UITableView*)tableView emailCellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MailCell";
    return [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
}

- (UITableViewCell *)tableView:(UITableView *)tableView socialNetworkCellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"SocialInfoCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    SocialInfo *info = [SocialInfo allSocialInfo][indexPath.row];
    cell.textLabel.text = info.title;
    cell.imageView.image = info.icon;

    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Segue to show a social network's page in a webview.
    if ([segue.destinationViewController isKindOfClass:[WebViewController class]] &&
        [sender isKindOfClass:[UITableViewCell class]]) {
        // Note that we are free to cast the sender and destination now that we know they are of the
        // appropriate classes.
        UITableViewCell *sourceCell = (UITableViewCell*)sender;
        WebViewController *destination = (WebViewController*)segue.destinationViewController;

        NSInteger row = [self.tableView indexPathForCell:sourceCell].row;
        SocialInfo *info = [SocialInfo allSocialInfo][row];
        destination.title = info.title;
        destination.url = info.url;
    }
}

@end
