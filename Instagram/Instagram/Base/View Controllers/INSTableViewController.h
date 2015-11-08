//
//  INSTableViewController.h
//  Instagram
//
//  Created by Emel Topaloglu on 08/11/2015.
//  Copyright © 2015 Emel Topaloglu. All rights reserved.
//

@interface INSTableViewController : UITableViewController

@property (strong, nonatomic) NSMutableArray<INSModel *> *items;

@property (assign, nonatomic) Class modelCellClass;

- (void)loadingDidFinishWithItems:(NSArray *)newItems moreAvailable:(BOOL)moreAvailable;

@end
