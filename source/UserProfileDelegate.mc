//
// Copyright 2015-2021 by Garmin Ltd. or its subsidiaries.
// Subject to Garmin SDK License Agreement and Wearables
// Application Developer Agreement.
//

import Toybox.Lang;
import Toybox.WatchUi;

//! Handles navigating between views
class UserProfileDelegate extends WatchUi.BehaviorDelegate {

    private var _page as Number = 0;

    //! Constructor
    public function initialize() {
        BehaviorDelegate.initialize();
    }

    //! Handle going to the next page
    //! @return true if handled, false otherwise
    public function onNextPage() as Boolean {
        _page++;
        _page = _page % _contacts.size();

        switchView();
        return true;
    }

    //! Switch to the current view
    private function switchView() as Void {
        var newView;

        newView = new $.UserProfileSectionOneView(_page);

        WatchUi.switchToView(newView, self, WatchUi.SLIDE_IMMEDIATE);
    }
}