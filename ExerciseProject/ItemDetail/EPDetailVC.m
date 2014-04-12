//
//  EPDetailVC.m
//  ExerciseProject
//
//  Created by Code Complete on 4/12/14.
//  Copyright (c) 2014 Asterio Manet Jr. All rights reserved.
//

#import "EPDetailVC.h"

@interface EPDetailVC ()
@property (weak, nonatomic) IBOutlet UIImageView *ivDetailViewImage;
@property (weak, nonatomic) IBOutlet UITextView *tvDescriptionDetails;
@end

@implementation EPDetailVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.navigationItem setTitle:[_itemSelected strItemLabel]];
    [_ivDetailViewImage setImageWithURL:[NSURL URLWithString:[_itemSelected.strItemImageLink isKindOfClass:[NSString class]]
        ?_itemSelected.strItemImageLink:@""] placeholderImage:[UIImage imageNamed:@"placeholder.jpg"]];
    [_tvDescriptionDetails setText:[_itemSelected.strItemDescription isKindOfClass:[NSString class]]
        ?_itemSelected.strItemDescription:@""];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
