//
//  dictionary.m
//  NavigationData
//
//  Created by afhenry on 2/8/15.
//  Copyright (c) 2015 Chips&Tea. All rights reserved.
//

#import "dictionary.h"

NSMutableDictionary* gHackData;         // singleton instance
NSMutableDictionary* bHackData;         // singleton instance
NSMutableDictionary* cHackData;         // singleton instance

NSMutableDictionary* sharedData() {
    if (!gHackData) {
        gHackData = [NSMutableDictionary dictionaryWithCapacity:1];
    }
    return gHackData;
}

NSMutableDictionary* bData() {
    if (!bHackData) {
        bHackData = [NSMutableDictionary dictionaryWithCapacity:1];
    }
    return bHackData;
}

NSMutableDictionary* cData() {
    if (!cHackData) {
        cHackData = [NSMutableDictionary dictionaryWithCapacity:1];
    }
    return cHackData;
}
