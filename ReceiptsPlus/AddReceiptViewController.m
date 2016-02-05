//
//  AddReceiptViewController.m
//  ReceiptsPlus
//
//  Created by Thiago Heitling on 2016-02-04.
//  Copyright © 2016 Thiago Heitling. All rights reserved.
//

#import "AddReceiptViewController.h"

@interface AddReceiptViewController ()

@property (weak, nonatomic) IBOutlet UITextField *receiptAmount;
@property (weak, nonatomic) IBOutlet UITextField *receiptDescription;
@property (weak, nonatomic) IBOutlet UIDatePicker *receiptDate;
@property (weak, nonatomic) IBOutlet UITableView *receiptTags;

@end

@implementation AddReceiptViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)cancelButtonPressed:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)saveButtonPressed:(UIButton *)sender
{
    NSManagedObject *receipt = [NSEntityDescription insertNewObjectForEntityForName:@"Receipt" inManagedObjectContext:self.context];
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *receiptAmount = [formatter numberFromString:self.receiptAmount.text];
    
    [receipt setValue:receiptAmount forKey:@"amount"];
    [receipt setValue:self.receiptDescription.text forKey:@"note"];
    [receipt setValue:self.receiptDate forKey:@"timeStamp"];

    
    NSError *error = nil;
    
    if (![self.context save:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
