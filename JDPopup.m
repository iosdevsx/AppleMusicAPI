#import "JDPopup.h"
#import "JDConstants.h"

static const NSTimeInterval PopupLifitime = 3.0;
static const NSTimeInterval PopupAnimationDuration = 0.2;

#define HidenFrame CGRectMake(0, -64, SCREEN_WIDTH, 64);
#define ShownFrame CGRectMake(0, 0, SCREEN_WIDTH, 64);

static JDPopup *CurrentPopup;

@interface JDPopup ()

@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@property (nonatomic, strong) NSTimer *removingTimer;

@end

@implementation JDPopup

+ (void)showPopupWithText:(NSString *)text
{
    JDPopup *popup = [JDPopup popupWithText:text];
    [popup setupTapGesture];
    [popup showInView:[UIApplication sharedApplication].keyWindow];
    [popup removeAfterDelay:PopupLifitime];
}

+ (instancetype)popupWithText:(NSString *)text
{
    JDPopup *popup = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
    popup.frame = HidenFrame;
    popup.textLabel.text = text;
    
    popup.backgroundColor = [UIColor redColor];
    
    return popup;
}

- (void)setupTapGesture {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(popupTap)];
    [self addGestureRecognizer:tap];
}

#pragma mark - Show/hide popup

- (void)showInView:(UIView *)view {
    
    @synchronized ([self class]) {
        
        [CurrentPopup removeAnimated];
        CurrentPopup = self;
        
        self.frame = HidenFrame;
        [view addSubview:self];
        [UIView animateWithDuration:PopupAnimationDuration animations:^{
            self.frame = ShownFrame;
        }];
    }
}

- (void)removeAfterDelay:(NSTimeInterval)delay {
    self.removingTimer = [NSTimer scheduledTimerWithTimeInterval:delay target:self selector:@selector(removeAnimated) userInfo:nil repeats:NO];
}

- (void)removeAnimated {
    if ([self.removingTimer isValid]) {
        [self.removingTimer invalidate];
    }
    [UIView animateWithDuration:PopupAnimationDuration animations:^{
        self.frame = HidenFrame;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

#pragma mark - Actions

- (void)popupTap {
    [self removeAnimated];
}

@end
