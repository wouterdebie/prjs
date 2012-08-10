#
#  AppDelegate.rb
#  Prjs
#
#  Created by Wouter de Bie on 8/7/12.
#  Copyright 2012 Wouter de Bie. All rights reserved.
#

class AppDelegate
    attr_accessor :window

    def applicationDidFinishLaunching(a_notification)
        initStatusBar
    end
    
    def setupMenu
        menu = NSMenu.new
        menu.initWithTitle 'Projects'
        paths = NSUserDefaults.standardUserDefaults['prjs.paths'] || ""
        
        paths.split(",").each do |project_dir|

            begin
                directories = Dir.entries(project_dir).sort
                directories.each do |dir|
                    full_path = File.join(project_dir, dir)
                    if File.directory?(full_path) and !dir.start_with?(".") then
                        addToMenu(menu, dir, "openProject:", full_path)
                    end
                end
            rescue
                addToMenu(menu, "Unable to open #{project_dir}")
            end
            menu.addItem NSMenuItem.separatorItem
        end
            
        addToMenu(menu, "Settings...", "settings:")
        addToMenu(menu, "Quit", "quit:")
      
        menu
    end
    
    def addToMenu(menu, title, action=nil, representedObject=nil)
        mi = NSMenuItem.new
        mi.title = title
        mi.target = self
        mi.action = action
        mi.representedObject = representedObject
        menu.addItem mi
    end
    
    def initStatusBar
        status_bar = NSStatusBar.systemStatusBar
        @status_item = status_bar.statusItemWithLength(NSVariableStatusItemLength)
        refresh_menu
        img = NSImage.new.initWithContentsOfFile File.join(NSBundle.mainBundle.resourcePath.fileSystemRepresentation,'projects.png')
        @status_item.setImage(img)
    end
    
    
    def openProject(sender)
        open_cmd = NSUserDefaults.standardUserDefaults['prjs.openWith']
        system("#{open_cmd} #{sender.representedObject}")
    end
    
    def quit(sender)
        app = NSApplication.sharedApplication
        app.terminate(self)
    end
    
    def refresh_menu
        @status_item.setMenu setupMenu
    end
    
    def settings(sender)
        unless @controller
            @controller = SettingsController.new
            nib = NSNib.alloc.initWithNibNamed('Settings', bundle: nil)
            nib.instantiateNibWithOwner(@controller, topLevelObjects:nil)
        end

        @controller.showWindow(self)
        @controller.window.makeKeyAndOrderFront(self)
    end
end

