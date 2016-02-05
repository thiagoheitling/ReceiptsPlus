//
//  Tag+CoreDataProperties.h
//  ReceiptsPlus
//
//  Created by Thiago Heitling on 2016-02-04.
//  Copyright © 2016 Thiago Heitling. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Tag.h"

NS_ASSUME_NONNULL_BEGIN

@interface Tag (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *tagName;
@property (nullable, nonatomic, retain) NSSet<NSManagedObject *> *receipts;

@end

@interface Tag (CoreDataGeneratedAccessors)

- (void)addReceiptsObject:(NSManagedObject *)value;
- (void)removeReceiptsObject:(NSManagedObject *)value;
- (void)addReceipts:(NSSet<NSManagedObject *> *)values;
- (void)removeReceipts:(NSSet<NSManagedObject *> *)values;

@end

NS_ASSUME_NONNULL_END
