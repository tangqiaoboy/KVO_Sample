//
//  ViewController.m
//  KVOTest
//
//  Created by TangQiao on 13-1-1.
//  Copyright (c) 2013年 TangQiao. All rights reserved.
//

#import "ViewController.h"
#import "MyClass.h"

@interface ViewController ()

@property (nonatomic, strong) MyClass * nameObject;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.nameObject = [[MyClass alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    debugMethod();
    debugLog(@"keyPath = %@", keyPath);
    debugLog(@"change dict = %@", change);
}

- (IBAction)change:(id)sender {
    debugMethod();
    int idx = 0;
    NSString * value = [@(idx) stringValue];
    self.nameObject.name = value;
    idx++;
}

// 多次add时 KVO不会判重，会真的add多次
- (IBAction)add:(id)sender {
    debugMethod();
    [self.nameObject addObserver:self forKeyPath:@"name" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
}

- (IBAction)remove:(id)sender {
    debugMethod();
    [self.nameObject removeObserver:self forKeyPath:@"name"];
}

@end
