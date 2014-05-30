library breakout;

import 'dart:html';
import 'dart:math' as math;

class CanvasDraw {
  
  // private properties
  CanvasRenderingContext2D _ctx;
  int _width;
  int _height;
  
  // constructor
  CanvasDraw(this._ctx);
  
  // public methods
  void circle(int x, int y,int r) {
    _ctx.beginPath();
    _ctx.arc(x, y, r, 0, math.PI*2, true);
    _ctx.closePath();
    _ctx.fill();
  }

  void rect(int x,int y,int w,int h) {
    _ctx.beginPath();
    _ctx.rect(x,y,w,h);
    _ctx.closePath();
    _ctx.fill();
  }

  void clear() {
    _ctx.clearRect(0, 0, _width, _height);
  }
  
  // TODO
  
}