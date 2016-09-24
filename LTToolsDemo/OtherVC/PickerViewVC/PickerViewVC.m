//
//  PickerViewVC.m
//  LTTools
//
//  Created by yelon on 16/4/7.
//  Copyright © 2016年 yelon. All rights reserved.
//

#import "PickerViewVC.h"
#import "LTPickerView.h"

@interface PickerViewVC ()<LTPickerViewDelegate>{
    
    NSArray *listArray;
}

@end


@implementation PickerViewVC

-(void)viewDidLoad{

    [super viewDidLoad];
    
    listArray = @[@{@"title":@"名称1",
                    @"value":@"000",@"image":@"eeee"},
                  @{@"title":@"名称2",@"value":@"000",@"image":@"eeee"},
                  @{@"title":@"名称3",@"value":@"000",@"image":@"eeee"}];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    
    [LTPickerView showPickerViewInView:self.navigationController.view
                              delegate:self];
}

- (NSUInteger)numberOfItemInltPickerView:(LTPickerView *)ltPickerView{

    return [listArray count];
}
- (NSString *)ltPickerView:(LTPickerView *)ltPickerView
        titleForRowAtIndex:(NSInteger)rowIndex{

    return listArray[rowIndex][@"title"];
}
- (void)ltPickerView:(LTPickerView *)ltPickerView
 didSelectRowAtIndex:(NSInteger)rowIndex{

    NSLog(@"didSelect=%@",listArray[rowIndex][@"title"]);
}
- (void)ltPickerView:(LTPickerView *)ltPickerView
    didChangeToIndex:(NSInteger)rowIndex{

    NSLog(@"didChange=%@",listArray[rowIndex][@"title"]);
}
@end
