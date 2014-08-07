//
//  HUCategory.h
//  hedzUp
//
//  Created by Mus Bai on 07.08.14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HUCategory : NSObject


@property(atomic, assign) int cid;
@property(nonatomic, retain) NSString *nameRu;
@property(nonatomic, retain) NSString *nameEng;
@property(nonatomic, retain) NSString *nameKyr;
@property(nonatomic, retain) NSString *nameUzb;

@end
