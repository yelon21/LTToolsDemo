//
//  LTContactsUIUtil.m
//  ABContacts
//
//  Created by yelon on 16/3/14.
//  Copyright © 2016年 yelon. All rights reserved.
//

#import "LTContactsUIUtil.h"

#import "LTAddressBookSelect.h"
#import "LTContactSelect.h"

#import "LTPickerView.h"

@interface LTContactsUIUtil ()<LTPickerViewDelegate>{

    NSArray *listArray;
}

@property(nonatomic,strong) NSObject *select;
@property(nonatomic,strong) void (^didSelectPerson)(NSString *name,NSString *tel);

@end

@implementation LTContactsUIUtil

+ (BOOL)checkAuthorizationStatus{

    Class class = NSClassFromString(@"CNContactPickerViewController");
    
    if (class) {
    
        return [LTContactSelect checkAuthorizationStatus];
    }
    else{
    
        return [LTAddressBookSelect checkAuthorizationStatus];
    }
}

- (void)showAddressBookUIFromVC:(UIViewController *)viewCon
                      didSelect:(void(^)(NSString *name,NSString *tel))didSelectPerson{

    self.didSelectPerson = didSelectPerson;
    
    Class class = NSClassFromString(@"CNContactPickerViewController");
    
    if (class) {
        
        self.select = [[LTContactSelect alloc]init];
        [(LTContactSelect *)self.select showAddressBookUIFromVC:viewCon
                              didSelect:^(NSString *name, NSArray *tels) {
                                  
                                  if ([tels count]>1) {
                                      
                                      [self showSelectFrom:viewCon
                                                      name:name
                                                      tels:tels];
                                  }
                                  else{
                                  
                                      [self didSelect:name tel:[tels firstObject]];
                                  }
                              }];
    }
    else{
    
        self.select = [[LTAddressBookSelect alloc]init];
        [(LTAddressBookSelect *)self.select showAddressBookUIFromVC:viewCon
                              didSelect:^(NSString *name, NSArray *tels) {
                                  
                                  if ([tels count]>1) {
                                      
                                      [self showSelectFrom:viewCon
                                                      name:name
                                                      tels:tels];
                                  }
                                  else{
                                      
                                      [self didSelect:name tel:[tels firstObject]];
                                  }
                              }];
    }
}

- (void)didSelect:(NSString *)name tel:(NSString *)tel{

    if (self.telOnlyNumber) {
        
        NSCharacterSet *setToRemove = [[ NSCharacterSet characterSetWithCharactersInString:@"0123456789"]
                                       invertedSet ];
        tel = [[tel componentsSeparatedByCharactersInSet:setToRemove] componentsJoinedByString:@""];
    }
    
    if (self.didSelectPerson) {
        
        self.didSelectPerson(name,tel);
    }
}

- (void)showSelectFrom:(UIViewController *)viewCon
                  name:(NSString *)name
                  tels:(NSArray *)tels{
    
    NSMutableArray *telsArray = [[NSMutableArray alloc]init];

    for (NSString *tel in tels) {
        
        [telsArray addObject:@{@"title":tel,@"value":tel}];
    }
    
    listArray = telsArray;
    
    [LTPickerView showPickerViewInView:viewCon.view
                              delegate:self];

}
#pragma mark LTPickerViewDelegate
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
    NSDictionary *dic = listArray[rowIndex];
    [self didSelect:dic[@"title"] tel:dic[@"value"]];
}
- (void)ltPickerView:(LTPickerView *)ltPickerView
    didChangeToIndex:(NSInteger)rowIndex{
    
    NSLog(@"didChange=%@",listArray[rowIndex][@"title"]);
}
@end
