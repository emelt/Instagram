//
//  INSUser.h
//  Instagram
//
//  Created by Emel Topaloglu on 07/11/2015.
//  Copyright © 2015 Emel Topaloglu. All rights reserved.
//

@interface INSUser : INSModel

@property (strong, nonatomic) NSString *userId;

@property (strong, nonatomic) NSString *nickname;

@property (strong, nonatomic) NSString *profilePhotoUrl;

@end
