part of breakout;

class CanvasDraw {
  
  // private properties
  CanvasRenderingContext2D _ctx;
  int width;
  int height;
  int minX;
  int maxX;
  
  // constructor
  CanvasDraw(this._ctx) {
    width = _ctx.canvas.width;
    height = _ctx.canvas.height;
    minX = _ctx.canvas.offsetLeft;
    maxX = minX + width;
  }
  
  // public methods
  void circle(int x, int y,int r, [String color]) {
    if (color != null) {
      _ctx.fillStyle = color;
    } else {
      _ctx.fillStyle = "#000000";
    }
    _ctx.beginPath();
    _ctx.arc(x, y, r, 0, math.PI*2, true);
    _ctx.closePath();
    _ctx.fill();
  }

  void rect(int x,int y,int w,int h, [String color]) {
    if (color != null) {
      _ctx.fillStyle = color;
    } else {
      _ctx.fillStyle = "#000000";
    }
    _ctx.beginPath();
    _ctx.rect(x,y,w,h);
    _ctx.closePath();
    _ctx.fill();
  }

  void clear() {
    _ctx.clearRect(0, 0, width, height);
  }
  
  // TODO
  
}