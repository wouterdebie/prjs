#
#  SettingsController.rb
#  Prjs
#
#  Created by Wouter de Bie on 8/7/12.
#  Copyright 2012 Wouter de Bie. All rights reserved.
#

class SettingsController < NSWindowController
    attr_accessor :window, :open_with
    attr_accessor :pathsTableView
    
    def awakeFromNib
        @paths = (NSUserDefaults.standardUserDefaults['prjs.paths'] || "").split(",")
        @open_with.stringValue = NSUserDefaults.standardUserDefaults['prjs.openWith'] || ""
    end
    
    def controlTextDidEndEditing(notification)
        save_prefs
    end
    
    def windowWillClose(notification)
        save_prefs
    end
    
    def browse(sender)
        browse_with_options(canChooseFiles:true) do |dialog|
            @open_with.stringValue = dialog.filenames.first
            save_prefs
        end
    end
    
    def addPath(sender)
        browse_with_options(canChooseDirectories:true) do |dialog|
            @paths << dialog.filenames.first
            pathsTableView.reloadData
            save_prefs
        end
    end
    
    def removePath(sender)
        index = pathsTableView.selectedRow.intValue
        if index >= 0
            @paths.delete_at(index)
            pathsTableView.reloadData
            save_prefs
        end
    end
    
    def tableView(view, objectValueForTableColumn:column, row:index)
        @paths[index]
    end
    
    def numberOfRowsInTableView(view)
        @paths.size
    end
    
private
    
    def browse_with_options(params={}, &block)
        dialog = NSOpenPanel.openPanel
        dialog.canChooseFiles = params[:canChooseFiles] || false
        dialog.canChooseDirectories = params[:canChooseDirectories] || false
        dialog.allowsMultipleSelection = params[:allowsMultipleSelection] || false
        dialog.resolvesAliases = params[:resolvesAliases] || false
        if dialog.runModal == NSOKButton then
            yield dialog
        end
    end
    
    def save_prefs
        NSUserDefaults.standardUserDefaults['prjs.openWith'] = @open_with.stringValue
        NSUserDefaults.standardUserDefaults['prjs.paths'] = @paths.join(",")
        NSUserDefaults.standardUserDefaults.synchronize
        NSApp.delegate.refresh_menu
    end
end
