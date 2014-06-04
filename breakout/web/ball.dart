part of breakout;

class Ball {
  
  // public properties
  int x;
  int y;
  int dx;
  int dy;
  
  // private properties
//  CanvasRenderingContext2D _ctx;

  // contructor
  Ball(int startX, int startY) {
    x = startX;
    y = startY;
    dx = 0;
    dy = 0;
  }
  
  // public methods
  void move() {
    x += dx;
    y += dy;    
  }
}
