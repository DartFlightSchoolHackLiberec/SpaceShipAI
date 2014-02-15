class SpaceShip {
  String color; //rgg code 
  int x;
  int y;
  int speed;
  int size;
  
  SpaceShip(this.x, this.y, this.size, this.color) {
    
  }
  
  SpaceShip.withoutColor(this.x, this.y, this.size) {
    color = 'red';
  }
}