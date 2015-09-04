// Generated by Apple Swift version 1.2 (swiftlang-602.0.53.1 clang-602.0.53)
#pragma clang diagnostic push

#if defined(__has_include) && __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if defined(__has_include) && __has_include(<uchar.h>)
# include <uchar.h>
#elif !defined(__cplusplus) || __cplusplus < 201103L
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
#endif

typedef struct _NSZone NSZone;

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif

#if defined(__has_attribute) && __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if defined(__has_attribute) && __has_attribute(objc_subclassing_restricted) 
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if defined(__has_attribute) && __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name) enum _name : _type _name; enum SWIFT_ENUM_EXTRA _name : _type
#endif
#if __has_feature(nullability)
#  define SWIFT_NULLABILITY(X) X
#else
# if !defined(__nonnull)
#  define __nonnull
# endif
# if !defined(__nullable)
#  define __nullable
# endif
# if !defined(__null_unspecified)
#  define __null_unspecified
# endif
#  define SWIFT_NULLABILITY(X)
#endif
#if defined(__has_feature) && __has_feature(modules)
@import UIKit;
@import ObjectiveC;
@import CoreGraphics;
@import Foundation;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
@class UIWindow;
@class UIApplication;
@class NSObject;

SWIFT_CLASS("_TtC6FeedMe11AppDelegate")
@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic) UIWindow * __nullable window;
- (BOOL)application:(UIApplication * __nonnull)application didFinishLaunchingWithOptions:(NSDictionary * __nullable)launchOptions;
- (void)applicationWillResignActive:(UIApplication * __nonnull)application;
- (void)applicationDidEnterBackground:(UIApplication * __nonnull)application;
- (void)applicationWillEnterForeground:(UIApplication * __nonnull)application;
- (void)applicationDidBecomeActive:(UIApplication * __nonnull)application;
- (void)applicationWillTerminate:(UIApplication * __nonnull)application;
- (SWIFT_NULLABILITY(nonnull) instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class Meal;
@class NSData;

SWIFT_CLASS("_TtC6FeedMe11DataService")
@interface DataService : NSObject
+ (DataService * __nonnull)sharedInstance;
- (NSArray * __nonnull)getMeals:(NSInteger)steps;
- (NSArray * __nonnull)parseJson:(NSData * __nonnull)JsonData;
- (void)checkTime;
- (NSInteger)currentNumberSteps;
- (SWIFT_NULLABILITY(nonnull) instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC6FeedMe4Meal")
@interface Meal : NSObject
@property (nonatomic, copy) NSString * __nullable imageStr;
@property (nonatomic, copy) NSString * __nullable mealId;
- (SWIFT_NULLABILITY(nonnull) instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC6FeedMe8MealItem")
@interface MealItem : NSObject
@property (nonatomic, copy) NSString * __nullable mealId;
@property (nonatomic, copy) NSString * __nullable name;
@property (nonatomic, copy) NSString * __nullable info;
@property (nonatomic, copy) NSString * __nullable imageStr;
- (SWIFT_NULLABILITY(nonnull) instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class UILabel;
@class UIImageView;
@class UITextView;
@class NSCoder;

SWIFT_CLASS("_TtC6FeedMe21MealItemTableViewCell")
@interface MealItemTableViewCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel * __null_unspecified TitleLabel;
@property (nonatomic, weak) IBOutlet UILabel * __null_unspecified NutritionLabel;
@property (nonatomic, weak) IBOutlet UIImageView * __null_unspecified MealItemImageView;
@property (nonatomic, weak) IBOutlet UITextView * __null_unspecified infoTextView;
- (void)awakeFromNib;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated;
- (SWIFT_NULLABILITY(nonnull) instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString * __nullable)reuseIdentifier OBJC_DESIGNATED_INITIALIZER;
- (SWIFT_NULLABILITY(nonnull) instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UIView;
@class UITableView;
@class NSIndexPath;
@class UIStoryboardSegue;
@class NSBundle;

SWIFT_CLASS("_TtC6FeedMe23MealTableViewController")
@interface MealTableViewController : UITableViewController
@property (nonatomic) UIView * __nullable footerView;
@property (nonatomic) UILabel * __nullable totalLabel;
@property (nonatomic) Meal * __nullable meal;
@property (nonatomic, copy) NSArray * __nullable mealItems;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)animated;
- (void)didReceiveMemoryWarning;
- (CGFloat)tableView:(UITableView * __nonnull)tableView heightForRowAtIndexPath:(NSIndexPath * __nonnull)indexPath;
- (NSInteger)tableView:(UITableView * __nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell * __nonnull)tableView:(UITableView * __nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * __nonnull)indexPath;
- (CGFloat)tableView:(UITableView * __nonnull)tableView heightForFooterInSection:(NSInteger)section;
- (UIView * __nullable)tableView:(UITableView * __nonnull)tableView viewForFooterInSection:(NSInteger)section;
- (void)updatePriceLabel:(NSInteger)price;
- (void)prepareForSegue:(UIStoryboardSegue * __nonnull)segue sender:(id __nullable)sender;
- (NSArray * __nonnull)jsonParsing;
- (NSArray * __nonnull)mealItemsForId:(NSArray * __nonnull)items mealId:(NSString * __nonnull)mealId;
- (SWIFT_NULLABILITY(nonnull) instancetype)initWithStyle:(UITableViewStyle)style OBJC_DESIGNATED_INITIALIZER;
- (SWIFT_NULLABILITY(null_unspecified) instancetype)initWithNibName:(NSString * __null_unspecified)nibNameOrNil bundle:(NSBundle * __null_unspecified)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (SWIFT_NULLABILITY(null_unspecified) instancetype)initWithCoder:(NSCoder * __null_unspecified)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UIButton;

SWIFT_CLASS("_TtC6FeedMe8MealView")
@interface MealView : UIView
@property (nonatomic) UIImageView * __nullable imageView;
@property (nonatomic) UIButton * __nullable button;
@property (nonatomic) Meal * __nullable meal;
- (SWIFT_NULLABILITY(nonnull) instancetype)initWithFrame:(CGRect)frame target:(id __nonnull)target selectorName:(SEL __null_unspecified)selectorName OBJC_DESIGNATED_INITIALIZER;
- (SWIFT_NULLABILITY(nonnull) instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


@interface NSDate (SWIFT_EXTENSION(FeedMe))
@end


@interface NSDate (SWIFT_EXTENSION(FeedMe))
@end


@interface NSDate (SWIFT_EXTENSION(FeedMe))

/// This adds a new method dateAt to NSDate.
///
/// It returns a new date at the specified hours and minutes of the receiver
///
/// \param hours: The hours value
///
/// \param minutes: The new minutes
///
/// \returns a new NSDate with the same year/month/day as the receiver, but with the specified hours/minutes values
- (NSDate * __nonnull)dateAtHours:(NSInteger)hours minutes:(NSInteger)minutes;
@end

@class NSTimer;
@class UIScrollView;

SWIFT_CLASS("_TtC6FeedMe14ViewController")
@interface ViewController : UIViewController <UIScrollViewDelegate>
@property (nonatomic, weak) IBOutlet UIImageView * __null_unspecified profileImageView;
@property (nonatomic, weak) IBOutlet UILabel * __null_unspecified timeLabel;
@property (nonatomic, weak) IBOutlet UILabel * __null_unspecified stepsLabel;
@property (nonatomic, weak) IBOutlet UIScrollView * __null_unspecified mealScrollView;
@property (nonatomic) NSTimer * __nullable timer;
@property (nonatomic, copy) NSArray * __nonnull mealViews;
@property (nonatomic) Meal * __nullable selectedMeal;
- (void)viewDidLoad;
- (void)viewDidAppear:(BOOL)animated;
- (void)viewDidDisappear:(BOOL)animated;
- (void)updateTime;
- (void)didReceiveMemoryWarning;
- (void)clearScrolView;
- (void)setupScrollView;
- (void)mealPageButtonAction:(id __nonnull)sender;
- (IBAction)eatAction:(id __nonnull)sender;
- (void)jsonParsing;
- (void)prepareForSegue:(UIStoryboardSegue * __nonnull)segue sender:(id __nullable)sender;
- (SWIFT_NULLABILITY(nonnull) instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (SWIFT_NULLABILITY(nonnull) instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

#pragma clang diagnostic pop
