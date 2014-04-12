//
//  EPMainDisplayTVC.m
//  ExerciseProject
//
//  Created by Code Complete on 4/12/14.
//  Copyright (c) 2014 Asterio Manet Jr. All rights reserved.
//

#import "EPMainDisplayTVC.h"
#import "EPNetworkHandler.h"
#import "EPMainDisplayCell.h"
#import "MBProgressHUD.h"
#import "EPDisplayItemDM.h"
#import "UIImageView+AFNetworking.h"
#import "EPDetailVC.h"

@interface EPMainDisplayTVC ()<MBProgressHUDDelegate>{
    NSMutableArray *marrData;
    MBProgressHUD *HUD;
}

@end

@implementation EPMainDisplayTVC

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.navigationItem.title = @"Data List";
    HUD = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    HUD.labelText = @"Retrieving Data...";
    [HUD setDelegate:self];
    [[EPNetworkHandler sharedClient] retrieveData:^(NSDictionary *dict, NSError *error) {
        if(!error){
            [self parseReturnData:dict];
        }else{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Something went wrong. Try again later." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alert show];
            alert = nil;
        }
        [HUD hide:YES];
    }];
}


- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [marrData count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath: (NSIndexPath *)indexPath{
    return 60;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Cell";
    EPMainDisplayCell *cell     = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    if(!cell){
        cell                    = [[EPMainDisplayCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                           reuseIdentifier:identifier];
    }else{
        cell.ivItemImage        = (UIImageView*)[cell.contentView viewWithTag:10];
        cell.lblItemHeader      = (UILabel*)[cell.contentView viewWithTag:11];
        cell.lblDescription     = (UILabel*)[cell.contentView viewWithTag:12];
    }
    EPDisplayItemDM *itemModel  = (EPDisplayItemDM*) [marrData objectAtIndex:[indexPath row]];
    
    [cell.lblItemHeader       setText:[itemModel.strItemLabel isKindOfClass:[NSString class]]?itemModel.strItemLabel:@""];
    [cell.lblDescription      setText:[itemModel.strItemDescription isKindOfClass:[NSString class]]?itemModel.strItemDescription:@""];
    [cell.ivItemImage setImageWithURL:[NSURL URLWithString:[itemModel.strItemImageLink isKindOfClass:[NSString class]]
                                       ?itemModel.strItemImageLink:@""] placeholderImage:[UIImage imageNamed:@"placeholder.jpg"]];
    itemModel = nil;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}


//parse server data
- (void)parseReturnData:(NSDictionary*) dict{
    self.navigationItem.title = dict[@"title"];
    NSDictionary *dataContent = dict[@"rows"];
    if(dataContent){
        marrData = [NSMutableArray array];
        for (NSDictionary *data in dataContent) {
            [marrData addObject:[[EPDisplayItemDM alloc]initWithAttributes:data]];
        }
        [self.tableView reloadData];
    }
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSIndexPath *path           = [self.tableView indexPathForSelectedRow];
    EPDisplayItemDM *itemModel  = (EPDisplayItemDM*) [marrData objectAtIndex:[path row]];
    [((EPDetailVC*)segue.destinationViewController) setItemSelected:itemModel];
}


#pragma mark MBPrpgressHUD delegate
- (void)hudWasHidden:(MBProgressHUD *)hud {
	[HUD removeFromSuperview];
    HUD = nil;
}
@end
