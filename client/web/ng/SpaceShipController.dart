import 'package:angular/angular.dart';

// Temporary, please follow https://github.com/angular/angular.dart/issues/476
@MirrorsUsed(targets: const['recipe_book'], override: '*')
import 'dart:mirrors';


/* Use the @NgController annotation to indicate that this class is an
 * Angular controller. Angular will instantiate the controller if
 * it finds an element matching its selector in the DOM.
 *
 * The selector field defines the CSS selector that will trigger the
 * controller. It can be any valid CSS selector which does not cross
 * element boundaries.
 *
 * The publishAs field specifies that the controller instance should be
 * assigned to the current scope under the name specified.
 *
 * The controller's public fields are available for data binding from the view.
 * Similarly, the controller's public methods can be invoked from the view.
 */

@NgController(
  selector: '[ship-control]',
  publishAs: 'shipCtrl')  
class SpaceShipController {

  String turn = '0';
  String upDown = '3';
  String forwardBack = '4';
  bool isSending = false;
  
  List<ApiCall> apiCalls = [];
  
  void addToApiCalls() {      
    ApiCall apiCall = new ApiCall(int.parse(turn), int.parse(upDown), int.parse(forwardBack));
    apiCalls.add(apiCall);
  }
  
  void flushApiCalls() {
    isSending = true;
    //TODO: Get api url - use update()    
  }
  
  SpaceShipController() {
    
    
  }

}

class ApiCall {
  int turn;
  int upDown;
  int forwardBack;
  DateTime date;
  
  ApiCall(this.turn, this.upDown, this.forwardBack) {
    this.date = new DateTime.now();    
  }
}

class SpaceShipModule extends Module {
  SpaceShipModule() {
    type(SpaceShipController);
  }
}

