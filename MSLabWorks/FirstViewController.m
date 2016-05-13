//
//  ViewController.m
//  MSLabWorks
//
//  Created by student on 03.03.16.
//  Copyright © 2016 NURE. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "AddNewCarViewController.h"
#import "Quickblox/Quickblox.h"
#import "Car.h"
#import "FMDatabase.h"

@interface FirstViewController ()

@property (strong, nonatomic) IBOutlet UITextField *searchTextField;
@property (strong, nonatomic) NSArray *tableData;

@property (weak, nonatomic) IBOutlet UITableView *table;

@property (nonatomic, strong) FMDatabase* db;
@end

@implementation FirstViewController

- (NSURL *)databasePath
{
    return [[[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject] URLByAppendingPathComponent:@"data.sqlite3"];
}


- (void) getAllFromDB {

    
    NSString *SQL = [NSString stringWithFormat:@"SELECT * FROM Car"];
    FMResultSet *rs = [_db executeQuery:SQL];
    NSMutableArray* arr = [NSMutableArray array];
    while ([rs next]) {
        Car* c = [[Car alloc]init];
        c.carBrand = [rs stringForColumnIndex:0];
        c.carModel = [rs stringForColumnIndex:1];
        c.transmission = [rs stringForColumnIndex:2];
        c.engine = [rs stringForColumnIndex:3];
        c. pictureLink = [rs stringForColumnIndex:4];
        c.year = [rs stringForColumnIndex:5];
        c.price = [rs stringForColumnIndex:6];
        c.phone = [rs stringForColumnIndex:7];
        c.mileage = [rs stringForColumnIndex:8];
        
        [arr addObject:c];
    }
    
    self.tableData = arr;
    [_table reloadData];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.db = [FMDatabase databaseWithPath:[[self databasePath] absoluteString]];
    [_db open];
    

    
    self.title = @"Main Menu";
    
    //self.tableData = @[@"BMW x5", @"BMW x6", @"BMW x5m"];
    
    // Отправить запрос в Квикблокс, чтобы получить все объекты типа Car
    [QBRequest objectsWithClassName:@"Car" successBlock:^(QBResponse * _Nonnull response, NSArray * _Nullable objects) {
        
        
        // Drop Table
        NSString* Drop = [NSString stringWithFormat:@"DROP TABLE IF EXISTS Car"];
        [_db executeUpdate:Drop];

        
        // Create Table
        NSString* Create = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS Car (carBrand TEXT, carModel TEXT, transmission TEXT, engine TEXT, pictureLink TEXT, year TEXT, price TEXT, phone TEXT, mileage TEXT)"];
        [_db executeUpdate:Create];
        
        
        
        NSMutableArray* arr = [NSMutableArray array];
        for (QBCOCustomObject* co in objects)
        {
            Car *c = [[Car alloc]  init];
            c.phone = co.fields[@"phone"];
            c.engine = co.fields[@"engine"];
            c.carModel = co.fields[@"carModel"];
            c.pictureLink = co.fields[@"pictureLink"];
            c.carBrand = co.fields[@"carBrand"];
            c.transmission = co.fields[@"transmission"];
            c.year = co.fields[@"year"];
            c.price = co.fields[@"price"];
            c.mileage = co.fields[@"mileage"];
            [arr addObject:c];
            
            
            
            // Add objects in DB
            NSString *Add = [NSString stringWithFormat:@"INSERT INTO Car (carBrand, carModel, transmission, engine, pictureLink, year, price, phone, mileage) VALUES ('%@', '%@', '%@', '%@', '%@','%@', '%@', '%@', '%@')", c.carBrand, c.carModel, c.transmission, c.engine, c.pictureLink ,c.year, c.price, c.phone, c.mileage];
            [_db executeUpdate:Add];
            
        }
        
        self.tableData = arr;
        [_table reloadData];

        
        
    }
     
     errorBlock:^(QBResponse * _Nonnull response) {
         
         [self getAllFromDB];

    }];
    
    
}
- (IBAction)addNewCarButton:(id)sender {
    
    AddNewCarViewController* add = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"AddNewCar"];
    [self.navigationController pushViewController:add animated:YES];
}

- (IBAction)searchButton:(id)sender
{
 
    NSString *Search = [NSString stringWithFormat:@"SELECT * FROM Car WHERE carBrand LIKE '%@'", self.searchTextField.text];
    FMResultSet *rs = [_db executeQuery:Search];
    NSMutableArray *arr = [NSMutableArray array];
    while ([rs next]){
    
        Car* c = [[Car alloc]init];
        c.carBrand = [rs stringForColumnIndex:0];
        c.carModel = [rs stringForColumnIndex:1];
        c.transmission = [rs stringForColumnIndex:2];
        c.engine = [rs stringForColumnIndex:3];
        c. pictureLink = [rs stringForColumnIndex:4];
        c.year = [rs stringForColumnIndex:5];
        c.price = [rs stringForColumnIndex:6];
        c.phone = [rs stringForColumnIndex:7];
        c.mileage = [rs stringForColumnIndex:8];
        
        [arr addObject:c];
    }
    self.tableData = arr;
    [_table reloadData];
    
    if([self.searchTextField.text isEqualToString: @""])
        [self getAllFromDB];
}




#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    Car *c = _tableData[indexPath.row];
    cell.textLabel.text = c.carModel;
    return cell;
    
}

#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SecondViewController* scv = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"second"];
    scv.car = self.tableData[indexPath.row];
    [self.navigationController pushViewController:scv animated:YES];
}

@end
