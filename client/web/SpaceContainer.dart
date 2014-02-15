import 'package:stagexl/stagexl.dart';
import 'SpaceShip.dart';

class SpaceContainer extends DisplayObjectContainer {
  SpaceContainer(resourceManager) {
    resourceManager.load().then((result) {
      var spaceship = resourceManager.getBitmapData('spaceship');
      
      addShip(spaceship);  
    });    
  }
  
  void addShip(bitmap) {
    var ship = new SpaceShip(bitmap, 5, 10, 3, 'green');
    addChild(ship);
  }
}