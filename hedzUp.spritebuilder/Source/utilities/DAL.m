//
//  DAL.m
//  hedzUp
//
//  Created by Mus Bai on 07.08.14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "DAL.h"
#import <sqlite3.h>
#import "HUWord.h"
#import "HUCategory.h"


@implementation DAL
#define DB @"content.sqlite"




+(id) initStatic
{
    BOOL success;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *writableDBPath = [[NSString alloc] initWithString:[documentsDirectory stringByAppendingPathComponent:DB]];
    success = [fileManager fileExistsAtPath:writableDBPath];
    if (success) return self;
    
    [fileManager removeItemAtPath:writableDBPath error:&error];
    NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath]
                               stringByAppendingPathComponent:DB];
    
    NSLog(@"defaultDBPath == %@", defaultDBPath);
    success = [fileManager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
    if (!success) {
        NSAssert1(0, @"Failed to create writable database file with message '%@'.", [error localizedDescription]);
    }
    return self;
}


+(NSArray *) selectAllCategories
{
    sqlite3 *database;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *writableDBPath = [[NSString alloc] initWithString:[documentsDirectory stringByAppendingPathComponent:DB]] ;
    sqlite3_open([writableDBPath fileSystemRepresentation], &database);
	sqlite3_stmt *statement;
    
    
    NSLog(@"reading Categories");
	if (sqlite3_prepare_v2(database, "SELECT cid, nameRu, nameEng, nameKyr, nameUzb FROM Categories ORDER BY cid DESC", -1, &statement, nil) != SQLITE_OK)
    {
        sqlite3_close(database);
        return nil;
    }
    
    
   
    
    NSMutableArray *res = [[NSMutableArray alloc] init];
    
    while(sqlite3_step(statement) == SQLITE_ROW){
        
        HUCategory *cat = [HUCategory new];
        

        [cat setCid: sqlite3_column_int(statement, 0) ];

        
        if (sqlite3_column_text(statement, 1) != NULL)
            [cat setNameRu : [[NSString alloc] initWithUTF8String: (char *)sqlite3_column_text(statement, 1)] ];
        if (sqlite3_column_text(statement, 2) != NULL)
            [cat setNameEng : [[NSString alloc] initWithUTF8String: (char *)sqlite3_column_text(statement, 2)]];
        if (sqlite3_column_text(statement, 3) != NULL)
            [cat setNameKyr : [[NSString alloc] initWithUTF8String: (char *)sqlite3_column_text(statement, 3)]];
        if (sqlite3_column_text(statement, 4) != NULL)
            [cat setNameUzb : [[NSString alloc] initWithUTF8String: (char *)sqlite3_column_text(statement, 4)]];
        
        [res addObject: cat];
    }
    
    return [res copy];
}

@end
