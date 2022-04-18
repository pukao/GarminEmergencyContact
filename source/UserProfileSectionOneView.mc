//
// Copyright 2015-2021 by Garmin Ltd. or its subsidiaries.
// Subject to Garmin SDK License Agreement and Wearables
// Application Developer Agreement.
//

import Toybox.Graphics;
import Toybox.Lang;
import Toybox.WatchUi;

//! Shows user information about weight, height, gender, and wake time
class UserProfileSectionOneView extends WatchUi.View {

    private var _topicStr as String;
    private var _index as Number;

    //! Constructor
    public function initialize(index as Number) {
        View.initialize();

        _topicStr = WatchUi.loadResource($.Rez.Strings.Topic) as String;
        _index = index;
    }

    //! Load your resources here
    //! @param dc Device context
    public function onLayout(dc as Dc) as Void {
        setLayout($.Rez.Layouts.SectionOneLayout(dc));
    }

    //! Update the view
    //! @param dc Device Context
    public function onUpdate(dc as Dc) as Void {

        System.println("Index: " + _index.toString());

        System.println(_contacts[_index]);

        var name = _contacts[_index].get("name");
        (findDrawableById("ContactNameLabel") as Text).setText(name);

        var details = _contacts[_index].get("details");
        (findDrawableById("ContactNumberLabel") as Text).setText(details);

        View.onUpdate(dc);
    }
}
