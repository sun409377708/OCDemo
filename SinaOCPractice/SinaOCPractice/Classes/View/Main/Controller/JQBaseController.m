//
//  JQBaseController.m
//  SinaOCPractice
//
//  Created by maoge on 16/11/14.
//  Copyright © 2016年 maoge. All rights reserved.
//

#import "JQBaseController.h"
#import "JQOAuthController.h"
#import "JQUserAccountViewModel.h"

@interface JQBaseController ()<VisitorLoginViewDelegate>


@end

@implementation JQBaseController


- (void)loadView {
    
   
    if ( [JQUserAccountViewModel shared].isUserLogin) {
        
        [super loadView];
    }else {
        self.view = self.visitorView;
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (UIView *)visitorView {
    
    if (_visitorView == nil) {
        
        _visitorView = [[JQVisitorView alloc] init];
        
        _visitorView.delegate = self;
    }
    
    return _visitorView;
}


- (void)visitorWillLogin {
    NSLog(@"登录");
    
    JQOAuthController *oAuth = [[JQOAuthController alloc] init];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:oAuth];
    
    [self presentViewController:nav animated:YES completion:nil];
    
}

- (void)visitorWillRegistor {
    NSLog(@"注册");
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
