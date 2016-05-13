//
//  AddNewCarViewController.m
//  MSLabWorks
//
//  Created by Alexander Kuprikov on 18.03.16.
//  Copyright © 2016 NURE. All rights reserved.
//

#import "AddNewCarViewController.h"
#import "Car.h"
#import "Quickblox/Quickblox.h"

@interface AddNewCarViewController ()
@property (weak, nonatomic) IBOutlet UITextField *carBrandTextField;
@property (weak, nonatomic) IBOutlet UITextField *carModelTextField;
@property (weak, nonatomic) IBOutlet UITextField *carTransmissonTextField;
@property (weak, nonatomic) IBOutlet UITextField *engineTextField;
@property (weak, nonatomic) IBOutlet UITextField *pictureLinkTextField;
@property (weak, nonatomic) IBOutlet UITextField *yearTextField;
@property (weak, nonatomic) IBOutlet UITextField *priceTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;
@property (weak, nonatomic) IBOutlet UITextField *mileage;

@end

@implementation AddNewCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Add New Car";
}

- (IBAction)saveButton:(id)sender {
    
    Car* tempCar = [[Car alloc] init];
    
    tempCar.carBrand = self.carBrandTextField.text;
    tempCar.carModel = self.carModelTextField.text;
    tempCar.transmission = self.carTransmissonTextField.text;
    tempCar.engine = self.engineTextField.text;
    tempCar.pictureLink = self.pictureLinkTextField.text;
    tempCar.year = self.yearTextField.text;
    tempCar.price = self.priceTextField.text;
    tempCar.phone = self.phoneNumberTextField.text;
    tempCar.mileage = self.mileage.text;
    
    
    QBCOCustomObject *object = [QBCOCustomObject customObject];
    object.className = @"Car"; // your Class name
    
    // Object fields
    [object.fields setObject:tempCar.carBrand forKey:@"carBrand"];
    [object.fields setObject:tempCar.carModel forKey:@"carModel"];
    [object.fields setObject:tempCar.transmission forKey:@"transmission"];
    [object.fields setObject:tempCar.engine forKey:@"engine"];
    [object.fields setObject:tempCar.pictureLink forKey:@"pictureLink"];
    [object.fields setObject:tempCar.year forKey:@"year"];
    [object.fields setObject:tempCar.price forKey:@"price"];
    [object.fields setObject:tempCar.phone forKey:@"phone"];
    [object.fields setObject:tempCar.mileage forKey:@"mileage"];
    
    if([NSURL URLWithString:tempCar.pictureLink])
    {
        [QBRequest createObject:object successBlock:^(QBResponse *response, QBCOCustomObject *object) {
            NSLog(@"Success!!!");
        } errorBlock:^(QBResponse *response) {
            // error handling
            NSLog(@"Response error: %@", [response.error description]);
        }];
    }
    else
    {
        NSLog(@"type valid picture link");
    }
}

@end
