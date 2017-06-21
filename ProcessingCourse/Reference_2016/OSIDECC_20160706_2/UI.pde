void UI() {
  bar = new ControlP5(this, font);

  //bar.addSlider("ellipseRadius", 20, 200, 50, 50, 50, 200, 40).setLabel("椭圆半径");

  bar.addSlider("ellipseRadius")
    .setRange(20, 200)
    .setValue(50)
    .setPosition(50, 50)
    .setSize(400, 80)
    .setColorBackground(color(162, 153, 125))
    .setColorForeground(color(204, 204, 0))
    .setColorLabel(color(255, 255, 255))
    .setColorValue(color(0, 0, 0))
    .setColorActive(color(224, 224, 0))
    .setNumberOfTickMarks(7)
    .setLock(false)
    //.setSliderMode(Slider.FLEXIBLE)
    .setLabel("椭圆半径");
}