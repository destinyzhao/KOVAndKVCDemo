//
//  ViewController.m
//  KOVAndKVCDemo
//
//  Created by Destiny on 2018/9/4.
//  Copyright © 2018年 Destiny. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import <Objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Person *person = [Person new];
    person.name = @"old";
    NSLog(@"before Class Name:%s",object_getClassName(person));
    [person addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    NSLog(@"after Class Name:%s",object_getClassName(person));
    
    // 手动实现
    [person willChangeValueForKey:@"name"];
    person.name = @"Alex";
    [person didChangeValueForKey:@"name"];
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"%@",change);
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
