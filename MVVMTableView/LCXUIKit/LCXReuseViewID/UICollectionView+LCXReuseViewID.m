//
//  UICollectionView+LCXReuseViewID.m
//  LCXReuseViewID
//
//  Created by lcx on 2020/2/25.
//  Copyright © 2020 lcx. All rights reserved.
//

#import "UICollectionView+LCXReuseViewID.h"
#import "UIView+LCXReuseViewID.h"
#import <objc/runtime.h>

@implementation UICollectionView (LCXReuseViewID)

#pragma mark - property:lcx_registerCellClassNames

- (NSArray<NSString *> *)lcx_registerCellClassNames{
    return objc_getAssociatedObject(self,_cmd);
}

- (void)setLcx_registerCellClassNames:(NSArray<NSString *> *)lcx_registerCellClassNames{
    //1 注册类和复用id
    lcx_registerCellClassNames = [self lcx_registerClassNames:lcx_registerCellClassNames registerSuperClass:UICollectionViewCell.class registerBlock:^(Class cls, NSString *reuseID) {
        [self registerClass:cls forCellWithReuseIdentifier:reuseID];
    }];
    
    //2 关联
    objc_setAssociatedObject(self, @selector(lcx_registerCellClassNames), lcx_registerCellClassNames, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

#pragma mark - property:lcx_registerHeaderClassNames

- (NSArray<NSString *> *)lcx_registerHeaderClassNames{
    return objc_getAssociatedObject(self,_cmd);
}

- (void)setLcx_registerHeaderClassNames:(NSArray<NSString *> *)lcx_registerHeaderClassNames{
    //1 注册类和复用id
    lcx_registerHeaderClassNames = [self lcx_registerClassNames:lcx_registerHeaderClassNames registerSuperClass:UICollectionReusableView.class registerBlock:^(Class cls, NSString *reuseID) {
        [self registerClass:cls forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:reuseID];
    }];
    
    //2 关联
    objc_setAssociatedObject(self, @selector(lcx_registerHeaderClassNames), lcx_registerHeaderClassNames, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

#pragma mark - property:lcx_registerFooterClassNames

- (NSArray<NSString *> *)lcx_registerFooterClassNames{
    return objc_getAssociatedObject(self,_cmd);
}

- (void)setLcx_registerFooterClassNames:(NSArray<NSString *> *)lcx_registerFooterClassNames{
    //1 注册类和复用id
    lcx_registerFooterClassNames = [self lcx_registerClassNames:lcx_registerFooterClassNames registerSuperClass:UICollectionReusableView.class registerBlock:^(Class cls, NSString *reuseID) {
        [self registerClass:cls forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:reuseID];
    }];
    
    //2 关联
    objc_setAssociatedObject(self, @selector(lcx_registerFooterClassNames), lcx_registerFooterClassNames, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
