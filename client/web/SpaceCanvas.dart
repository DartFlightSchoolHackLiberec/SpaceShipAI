import 'CanvasDemo.dart';
import 'SpaceShip.dart';
import 'dart:html';
import 'dart:convert';

class SpaceCanvas extends CanvasDemo {
  //SpaceCanvas() : super("Space shit");
     
  SpaceCanvas() : super("Space shit") {  
    this.initialize();
    this.initializeAnimation();
    this.runAnimation();    
  }
  
  var context;
  
  /** Entrypoint. */
  /*
  static void main() {
    final instace = new SpaceCanvas();
    instace.initialize();
    instace.initializeAnimation();
    instace.runAnimation();    
  }
  */
  
  void initialize() {
    var canvas = document.querySelector("#space");
    context = canvas.context2D;
    
    SpaceShip ship = new SpaceShip(10, 10, 6, 'green');
    addShip(ship);
    
    loadData();
  }
  
  void addShip(SpaceShip ship) {
    //var imageObj = new ImageElement();
    //imageObj.onLoad.listen((data) => (context.drawImage(imageObj, 0, 0)));    
    //imageObj.src = 'http://www.html5canvastutorials.com/demos/assets/darth-vader.jpg';
    
  }
  
  void loadData() {
    String url = 'http://10.0.0.214:8080/api/games/1.json';
        
    var request = HttpRequest.getString(url).then(onDataLoaded).catchError(onError);
  }
  
  void onDataLoaded (data) {
    print('loaded');
    var js = JSON.decode(data);
    print(js);
    
    for(Map meteoritMap in js) {
      
      
      print(meteoritMap['meteorit']['name']);
    }
  }
  
  void onError (data) {
    print('errrrr');
    print(data);
  }
}