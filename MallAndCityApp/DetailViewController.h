//
//  DetailViewController.h
//  MallAndCityApp
//
//  Created by Admin on 2018/11/28.
//  Copyright © 2018 Johan Vorster. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) NSDate *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

