class SpaceShip {
  String color; //rgg code 
  int x;
  int y;
  int speed;
  
  SpaceShip(this.x, this.y, this.color) {
    
  }
  
  SpaceShip.withoutColor(this.x, this.y) {
    color = 'red';
  }
}