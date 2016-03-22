//
//  ViewController.m
//  FGSwizzlingExample
//
//  Created by Fernanda Geraissate on 18/03/16.
//  Copyright © 2016 Fernanda G. Geraissate. All rights reserved.
//

#import "ViewController.h"

#import "UIViewController+Swizzling.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
