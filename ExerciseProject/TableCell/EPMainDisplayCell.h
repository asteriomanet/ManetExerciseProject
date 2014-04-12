//
//  EPMainDisplayCell.h
//  ExerciseProject
//
//  Created by Code Complete on 4/12/14.
//  Copyright (c) 2014 Asterio Manet Jr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EPMainDisplayCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView    *ivItemImage;
@property (weak, nonatomic) IBOutlet UILabel        *lblItemHeader;
@property (weak, nonatomic) IBOutlet UILabel        *lblDescription;
@end
