//
//  SecondViewController.m
//  MSLabWorks
//
//  Created by Александр on 13.03.16.
//  Copyright © 2016 NURE. All rights reserved.
//

#import "SecondViewController.h"
#import <UIImageView+WebCache.h>
#import "Car.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UITextField *carBrandTextField;
@property (weak, nonatomic) IBOutlet UITextField *carModelTextField;
@property (weak, nonatomic) IBOutlet UITextField *transmissionTextField;
@property (weak, nonatomic) IBOutlet UITextField *engineTextField;
@property (weak, nonatomic) IBOutlet UITextField *yearTextField;
@property (weak, nonatomic) IBOutlet UITextField *mileageTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *priceTextField;


@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = _car.carModel;
    [self.image sd_setImageWithURL:[NSURL URLWithString:_car.pictureLink]/*[NSURL URLWithString:@"http://www.netlore.ru/upload/files/19/large_valera01.jpg"*/];
    self.carBrandTextField.text = self.car.carBrand;
    self.carModelTextField.text = self.car.carModel;
    self.transmissionTextField.text = self.car.transmission;
    self.engineTextField.text = self.car.engine;
    self.yearTextField.text = self.car.year;
    self.mileageTextField.text = self.car.mileage;
    self.phoneTextField.text = self.car.phone;
    self.priceTextField.text = self.car.price;
    
}

@end
