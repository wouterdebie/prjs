# Prjs

Prjs is a small tool that lives in the OSX menu bar that allows you to open a directory with a given
command. To open a project in my editor, I often open a terminal, cd to a specific directory (~/prjs/wouter in my case) and type `subl .` or `vim .`, which often leaves me with a lot of terminal windows open.

In Prjs you can configure multiple paths that serve as the root of you menu. So if you config ~/prjs/wouter
then all subdirectories of ~/prjs/wouter will become available in the menu. Nex to that, you can configure with what
command line application you want to open a chosen directory.

## Installing 

Download a prebuilt binary from https://github.com/wouterdebie/prjs/downloads, unzip and drag
to your Applications folder.

## Building

Clone this repository and open it in XCode and build it.
Note that Prjs is written using MacRuby. Make sure you have MacRuby installed to build it.

## TODO

- Being able to specify additional functions for menu items (e.g. Show in Finder, git pull, etc..)
- Application icon and better menu bar icon

## Contributing to Prjs

 * Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
 * Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
 * Fork the project
 * Start a feature/bugfix branch
 * Commit and push until you are happy with your contribution
 * Please try not to mess with version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## DISCLAIMER

I haven't done much OSX programming, so the code might suck and might not be done the way things are normally done.

## Copyright

Copyright (c) 2012 Wouter de Bie. See LICENSE.txt for
further details.

