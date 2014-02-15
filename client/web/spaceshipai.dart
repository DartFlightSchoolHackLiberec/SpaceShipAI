import 'dart:html';
import 'package:angular/angular.dart';
import 'package:stagexl/stagexl.dart';
import 'ng/SpaceShipController.dart';

Stage stage;
RenderLoop renderLoop;
ResourceManager resourceManager;

void main() {
    ngBootstrap(module: new SpaceShipModule());
    
    //---------------------------------------------
    // Initialize the Display List

    stage = new Stage(document.querySelector('#space'), webGL: true);
    renderLoop = new RenderLoop();
    resourceManager = new ResourceManager();

    renderLoop.addStage(stage);
    
    resourceManager.addBitmapData('spaceship', 'resources/spaceship.png');
    
    resourceManager.load().then((result) {
      var spaceship = resourceManager.getBitmapData('spaceship');
      //var plop = resourceManager.getSound('plop');
      //var flowers = resourceManager.getTextureAtlas('fl');
      //var daisy = flowers.getBitmapData('daisy');
    });
}