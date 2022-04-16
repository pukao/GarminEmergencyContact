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

    //! Constructor
    public function initialize() {
        View.initialize();

        _topicStr = WatchUi.loadResource($.Rez.Strings.Topic) as String;
    }

    //! Load your resources here
    //! @param dc Device context
    public function onLayout(dc as Dc) as Void {
        setLayout($.Rez.Layouts.SectionOneLayout(dc));
    }

    //! Update the view
    //! @param dc Device Context
    public function onUpdate(dc as Dc) as Void {

        var name = "The One";
        (findDrawableById("ContactNameLabel") as Text).setText(name);

        var number = "+49 151 123123123";
        (findDrawableById("ContactNumberLabel") as Text).setText(number);

        View.onUpdate(dc);
    }
}
