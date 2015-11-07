//
//  INSPhotosManager.h
//  Instagram
//
//  Created by Emel Topaloglu on 07/11/2015.
//  Copyright © 2015 Emel Topaloglu. All rights reserved.
//

typedef void(^INSGetPhotosRequestCompletion)(NSError *error, NSArray *photos);

@interface INSPhotosManager : INSNetworkManager

+ (instancetype)sharedInstance;

- (NSString *)getPopularPhotosWithCompletion:(INSGetPhotosRequestCompletion)completion;

@end
