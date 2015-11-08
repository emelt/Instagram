//
//  INSModelCell.h
//  Instagram
//
//  Created by Emel Topaloglu on 08/11/2015.
//  Copyright © 2015 Emel Topaloglu. All rights reserved.
//

/**
 Protocol indicating that the cell will format its contents by taking data from a specified data model
 */
@protocol INSModelCell <NSObject>

@required

/**
 This method sets the cell contents with the given data model
 @param model Model object that will be used in the update
 */
- (void)updateCellWithModel:(id)model;

@end