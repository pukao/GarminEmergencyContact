using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;

(:glance)
class WidgetGlanceView extends Ui.GlanceView {

    function initialize() {
      GlanceView.initialize();
    }

    function onUpdate(dc) {
      dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_BLACK);
      dc.drawText(0 , dc.getHeight() / 3, Graphics.FONT_GLANCE, "Contacts", Graphics.TEXT_JUSTIFY_LEFT);
    }
}