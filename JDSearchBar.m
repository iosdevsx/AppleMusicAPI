//
//  JDSearchBar.m
//  MarvelApp
//
//  Created by Юрий Логинов on 24.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

#import "JDSearchBar.h"
#import "UIColor+Colors.h"


@interface JDSearchBar()

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *closeButton;

@end

@implementation JDSearchBar

+ (instancetype)searchBar {
    JDSearchBar *searchBar = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
    return searchBar;
}

- (void)setFilledState:(BOOL)isFilled {
    if (isFilled) {
        self.textField.textAlignment = NSTextAlignmentLeft;
        self.closeButton.hidden = NO;
        self.backgroundColor = [UIColor whiteColor];
    } else {
        self.textField.textAlignment = NSTextAlignmentCenter;
        self.closeButton.hidden = YES;
        self.backgroundColor = [UIColor jd_grayColor];
    }
}

#pragma mark - Accessors

- (NSString *)searchText {
    return self.textField.text;
}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [self setFilledState:YES];
    [self.delegate searchViewDidBeginEditing:self];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *text = [textField.text stringByReplacingCharactersInRange:range withString:string];
    [self.delegate searchView:self didEnterText:text];
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.textField resignFirstResponder];
    return YES;
}

#pragma mark - Actions

- (void)cancelSearch {
    [self closeTap:nil];
}

- (IBAction)closeTap:(id)sender {
    [self.delegate searchViewDidCloseTap:self];
    self.textField.text = @"";
    [self.textField resignFirstResponder];
    [self setFilledState:NO];
}

@end
