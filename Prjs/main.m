//
//  main.m
//  Prjs
//
//  Created by Wouter de Bie on 8/7/12.
//  Copyright (c) 2012 Wouter de Bie. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import <MacRuby/MacRuby.h>

int main(int argc, char *argv[])
{
    return macruby_main("rb_main.rb", argc, argv);
}
