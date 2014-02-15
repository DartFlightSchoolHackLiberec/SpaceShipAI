
class SpaceShip  {
  String color; //rgg code 
  int x;
  int y;
  int speedx;
  int speedy;
  int size;
  
  SpaceShip(this.x, this.y, this.size, this.color) {
    
  }
  
  SpaceShip.withoutColor(this.x, this.y, this.size) {
    color = 'red';
  }
  
  bool advanceTime(num time) {
    var tx = x + speedx * time;
    var ty = y + speedy * time;
    if (tx > 910 || tx < 30) speedx = -speedx; else x = tx;
    if (ty > 480 || ty < 20) speedy = -speedy; else y = ty;
    return true;
  }
}