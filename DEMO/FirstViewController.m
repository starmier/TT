//
//  FirstViewController.m
//  DEMO
//
//  Created by starmier on 2019/11/1.
//  Copyright © 2019 yy. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)test{
	int a = 10;
	int b = a++;
	int c = ++a;
	printf("a:%d b:%d c:%d\n", a, b, c);
}

@end
