//
//  MallAndCityUtil.h
//  MallAndCityApp
//
//  Created by Admin on 2018/11/28.
//  Copyright © 2018 Johan Vorster. All rights reserved.
//

#ifndef MallAndCityUtil_h
#define MallAndCityUtil_h

@interface MallAndCityUtil:NSObject;

@property (nonatomic, strong) NSMutableDictionary *myDict;


-(void) setData:(NSMutableDictionary *) data;

-(NSMutableArray *) getCities:(NSString *) city;

-(NSMutableArray *) getMalls:(NSString *) selectedCity : (NSString *) selectedMall;

-(NSMutableArray *) getShops:(NSString *) selectedMall: (NSString *) selectedShop;

-(NSMutableArray *) getCityShops:(NSString *) selectedCity;
@end
#endif /* MallAndCityUtil_h */
