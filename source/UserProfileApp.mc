//
// Copyright 2015-2021 by Garmin Ltd. or its subsidiaries.
// Subject to Garmin SDK License Agreement and Wearables
// Application Developer Agreement.
//

import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.Application.Storage;

var _contacts = [];


//! This app demonstrates how to access user profile data from a device.
//! Press the menu to cycle through three screens of user profile data.
(:glance)
class UserProfileApp extends Application.AppBase {

    //! Constructor
    public function initialize() {
        AppBase.initialize();
    }

    //! Handle app startup
    //! @param state Startup arguments
    public function onStart(state as Dictionary?) as Void {
        // if ((state != null) && (state.get(:launchedFromGlance))) {
        //     // Launched from glance
        // } else {
        //     // Launched from activity menu
        // }
       self.onSettingsChanged();
    }

   function onSettingsChanged() as Void {
        _contacts = [];
        // use Application.Storage and Application.Properties methods
        System.println("Read settings - Storage");

        for (var i = 1; i <= 5; i++) {
            var name;
            var details;
            var id;
            id = "contactName" + i.toString();
            name = Properties.getValue(id);
            id = "contactDetails" + i.toString();
            details = Properties.getValue(id);

            if (name.length() > 0 && details.length() > 0) {
                System.println("Adding name " + name + " with " + details);
                _contacts.add({"name"=>name, "details"=>details});
            }
        }
        if (_contacts.size() == 0) {
           System.println("No contacts configured, filling default");
           var name = "Please setup Contacts";
           var details = "using the app settings\n in the Connect IQ app\n on your phone";
           _contacts.add({"name"=>name, "details"=>details});
       }
   }


    //! Handle app shutdown
    //! @param state Shutdown arguments
    public function onStop(state as Dictionary?) as Void {
    }

    //! Return the initial view for the app
    //! @return Array Pair [View, Delegate]
    public function getInitialView() as Array<Views or InputDelegates>? {
        return [new $.UserProfileSectionOneView(0), new $.UserProfileDelegate()] as Array<Views or InputDelegates>;

    }

    // public function getGlanceView() as Lang.Array<WatchUi.GlanceView>? {
    //     return [new $.WidgetGlanceView()] as Array<WatchUi.GlanceView>;
    // }

}
