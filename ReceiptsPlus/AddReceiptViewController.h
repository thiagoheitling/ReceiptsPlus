//
//  AddReceiptViewController.h
//  ReceiptsPlus
//
//  Created by Thiago Heitling on 2016-02-04.
//  Copyright © 2016 Thiago Heitling. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Receipt.h"
#import "Tag.h"

@interface AddReceiptViewController : UIViewController

@property (nonatomic, strong) Receipt *receipt;
@property (nonatomic) NSManagedObjectContext *context;

@end
