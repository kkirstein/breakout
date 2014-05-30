library breakout;

import 'dart:html';
import 'dart:math' as math;

import 'canvas_draw.dart';

class Ball extends CanvasDraw {
  
  // public properties
  int x = 150;
  int y = 150;
  int dx = 2;
  int dy = 4;
  
  // private properties
//  CanvasRenderingContext2D _ctx;

  // contructor
  Ball(CanvasRenderingContext2D ctx) : super(ctx);
  
  // public methods
  void draw() {
    // TODO: call super methods to draw circle
//    _ctx.clearRect(0, 0, 300, 300);
//    _ctx.beginPath();
//    _ctx.arc(x, y, 10, 0, 2*math.PI, true);
//    _ctx.closePath();
//    _ctx.fill();
//    x += dx;
//    y += dy;
  }
  
}
