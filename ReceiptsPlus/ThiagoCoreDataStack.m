//
//  ThiagoCoreDataStack.m
//  ReceiptsPlus
//
//  Created by Thiago Heitling on 2016-02-04.
//  Copyright © 2016 Thiago Heitling. All rights reserved.
//

#import "ThiagoCoreDataStack.h"

@implementation ThiagoCoreDataStack

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        // get momd url
        
        NSURL *momdURL = [[NSBundle mainBundle] URLForResource:@"ReceiptModel" withExtension:@"momd"];
        
        // init MOM (as a private property)
        NSManagedObjectModel *managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:momdURL];
        
        _mom = managedObjectModel;
        
        // init PSC (as a private property)
        
        _psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedObjectModel];
        
        NSArray *documentsDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [documentsDirectories firstObject];
        
        
        NSString *sqlPath = [documentsDirectory stringByAppendingPathComponent:@"mydata.sqlite"];
        
        NSURL *sqlURL = [NSURL fileURLWithPath:sqlPath];
        
        // get data store url NSSearchPathFor...
        
        NSError *pscError = nil;
        
        
        NSLog(@"our data is at %@", sqlURL);
        
        // add a NSSQLiteStoreType PS to the PSC
        
        [_psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:sqlURL options:nil error:&pscError];
        
        // init a MOC (as a public property)
        
        _context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        
        
        // set the MOCs PSC
        
        [_context setPersistentStoreCoordinator:_psc];
    }
    return self;
}
@end
