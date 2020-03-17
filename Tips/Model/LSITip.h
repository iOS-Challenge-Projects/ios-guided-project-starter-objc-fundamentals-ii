//
//  LSITip.h
//  Tips
//
//  Created by Paul Solt on 3/17/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//class Tip {
//    let name: String
//    let subTotal: Double
//    let tipPercentage: Double // 0-100
//    let splitCount: Int
//    private let counter: Int
//
//    init(name: String, subTotal: Double, tipPercentage: Double, splitCount: Int) {
//        // ...
//    }
//}

// An interface feels like a protocol in Swift
// Public interface

@interface LSITip : NSObject

// What information to store?

// Properties
@property NSString *name;
// Properties create three things
// 1. setter: setName
//- (void)setName:(NSString *)name;

// 2. getter
//- (NSString *)name;

// 3. instance variable (_name)
//NSString *_name;

@property double subTotal;
@property double tipPercentage;
@property int splitCount;

// Methods (init)

// - = instance method
// + = class method

- (instancetype)initWithName:(NSString *)name
                    subTotal:(double)subTotal
               tipPercentage:(double)tipPercentage
                  splitCount:(int)splitCount;


@end

NS_ASSUME_NONNULL_END
