//
//  LSEggFMDBManager.m
//  LuckyEgg
//
//  Created by 李爽 on 2019/7/4.
//  Copyright © 2019 lishuang. All rights reserved.
//

#import "LSEggFMDBManager.h"
#import "LSEggLocationModel.h"
#import <FMDB.h>

@interface LSEggFMDBManager ()

@end

@implementation LSEggFMDBManager

static  NSString * _Nonnull CityTableName = @"egg_city";
static  NSString * _Nonnull SqliteName = @"LSEgg.sqlite";
static  NSString * _Nonnull jsonFileName = @"city";

+ (LSEggFMDBManager *)sharedFMDBManager
{
    static LSEggFMDBManager * handle;
    static dispatch_once_t once;
    dispatch_once(&once,^(){
        handle = [[LSEggFMDBManager alloc]init];
        [handle creatDataBase];
    });
    return handle;
}

//创建数据库路径

- (NSString*)databaseFilePath
{
    NSString * docPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
    NSString * dbPath  = [docPath stringByAppendingString:SqliteName];
    NSLog(@"path ==== %@",dbPath);
    return dbPath;
}

static FMDatabase * _db = nil;

//创建数据库

 - (void)creatDataBase
{
    if (!_db) {
        _db = [FMDatabase databaseWithPath:[self databaseFilePath]];
    }
}


#pragma mark ----- 城市表相关  -----

- (void)localtionTableInit
{
    [self insertDataWithLocaltionArray:[self getLocalAdressList]];
}

///创建city地址表
- (void)creatCityNameTable
{
    if (!_db) {
        [self creatDataBase];
    }
    
    //打开数据库,并判断数据库是否打开成功
    if (![_db open]) {
        NSLog(@"数据库打开失败");
        return;
    }
    //为数据库设置缓存，提高查询效率
    [_db setShouldCacheStatements:YES];
    
    //判断数据库中是否已经存在这个表，如果不存在则创建该表
    if(![_db tableExists:@"egg_city"]) {
        NSString *createCitySql = @"create table egg_city('id' TEXT PRIMARY KEY ,'cityEn' TEXT NOT NULL, 'cityZh' TEXT NOT NULL,'provinceEn' TEXT NOT NULL,'provinceZh' TEXT NOT NULL,'countryEn' TEXT ,'countryZh' TEXT,'leaderEn' TEXT NOT NULL,'leaderZh' TEXT NOT NULL,'lat' TEXT NOT NULL,'lon' TEXT NOT NULL)";
        BOOL result = [_db executeUpdate:createCitySql];
        if (result) {
            NSLog(@"City表创建成功");
        }
    }
    [_db close];
}

// 本地读取城市地址json
- (NSArray <LSEggLocationModel *> *)getLocalAdressList
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:jsonFileName ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    if (data) {
        NSArray  *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        if (jsonArray.count) {
            NSMutableArray <LSEggLocationModel *> *tempArray = [[NSMutableArray alloc] initWithCapacity:5000];
            for (NSDictionary *dic in jsonArray) {
                LSEggLocationModel *model = [LSEggLocationModel yy_modelWithJSON:dic];
                [tempArray addObject:model];
            }
            return [tempArray copy];
        }
    }
    return nil;
}


/// 插入数据库

- (void)insertDataWithLocaltionArray:(NSArray <LSEggLocationModel *> *)localtionArray
{
    if (!localtionArray.count) {
        return;
    }
    
    //打开数据库,并判断数据库是否打开成功
    if (![_db open]) {
        NSLog(@"数据库打开失败");
        return;
    }
    //为数据库设置缓存，提高查询效率
    [_db setShouldCacheStatements:YES];
    
    if(![_db tableExists:@"egg_city"]) {
        NSLog(@"未创建egg_city表");
        return;
    }
    
    NSString *sqlString = @"insert into egg_city (id,cityEn,cityZh,provinceEn,provinceZh,countryEn,countryZh,leaderEn,leaderZh,lat,lon) values (?,?,?,?,?,?,?,?,?,?,?) ";
    for (LSEggLocationModel *model in localtionArray) {
        BOOL b = [_db executeUpdate:sqlString,model.city_id,model.cityEn,model.cityZh,model.provinceEn,model.provinceZh,model.countryEn,model.countryZh,model.leaderEn,model.leaderZh,model.lat,model.lon];
        NSLog(@"%i",b);
    }
    [_db close];
}


/// 根据城市查询cityid

- (NSString *)getCityIdWithName:(NSString *)name
{
    if (!name.length) {
        return nil;
    }
    //打开数据库,并判断数据库是否打开成功
    if (![_db open]) {
        NSLog(@"数据库打开失败");
        return nil;
    }
    //为数据库设置缓存，提高查询效率
    [_db setShouldCacheStatements:YES];
    
    if(![_db tableExists:@"egg_city"]) {
        NSLog(@"未创建egg_city表");
        return nil;
    }
    NSString *selectSql= @"select * from egg_city where cityZh like ? ";
    FMResultSet * set = [_db executeQuery:selectSql,name];
    if ([set next]) {
        NSString *city_id = [set stringForColumn:@"id"];
        return city_id;
    }
    return nil;
}

#pragma mark






@end
