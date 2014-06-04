library breakout;

import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';
import 'dart:async';
import 'dart:html';
import 'dart:math' as math;

part 'canvas_draw.dart';
part 'ball.dart';
part 'paddle.dart';
part 'bricks.dart';

/**
 * GUI controller for Breakout game
 */
@Controller(
    selector: '[breakout-gui]',
    publishAs: 'ctrl')
class BreakoutController extends CanvasDraw {
  
  // private properties
//  CanvasRenderingContext2D _ctx;
  Ball _ball;
  Paddle _paddle;
  Bricks _bricks;
  final Duration _updateInterval = new Duration(milliseconds: 10);
  Timer _updateTimer;
  bool _rightDown;
  bool _leftDown;
  
  // constructor
  BreakoutController() : super((document.querySelector('#canvas') as CanvasElement).context2D) {
//    var canvas = document.querySelector('#canvas');
    _ball = new Ball(width ~/2, height ~/ 2);
    _paddle = new Paddle(width ~/ 2);
    _bricks = new Bricks(5, 5, 1, width);

    // intial ball speed
    _ball.dx = 2;
    _ball.dy = 3;
    
    // reset keyboard control
    _rightDown = false;
    _leftDown = false;
    
    _updateTimer = new Timer.periodic(_updateInterval, (_) {draw();});
    
    window.onKeyDown.listen(onKeyDown);
    window.onKeyUp.listen(onKeyUp);
    window.onMouseMove.listen(onMouseMove);
  }
  
  // public methods
  void draw() {
    clear();

    // move ball
    _ball.move();
    circle(_ball.x, _ball.y, 10);

    // move paddle
    if (_rightDown) _paddle.x += 5;
    if (_leftDown) _paddle.x -= 5;
    rect(_paddle.x, height - _paddle.h, _paddle.w, _paddle.h);

    // draw bricks
    for (var b in _bricks.getBricks()) {
      rect(b.x, b.y, b.width, b.height);
    }
    
    // check for bricks
    if (_bricks.checkBricks(_ball.x, _ball.y)) {
      _ball.dy = -_ball.dy;
    }
    
    // check for boundaries
    if (_ball.x+_ball.dx > width || _ball.x+_ball.dx < 0) {
      _ball.dx = -_ball.dx;
    }
    if (_ball.y+_ball.dy < 0) {
      _ball.dy = -_ball.dy;
    } else if (_ball.y+_ball.dy > height) {
      if (_ball.x > _paddle.x && _ball.x < _paddle.x+_paddle.w) {
        _ball.dy = -_ball.dy; // paddle has been hit
      } else {
        // game over
        _updateTimer.cancel();
      }
    }
    
    
  }
  
  void onKeyDown(KeyboardEvent e) {
    if (e.keyCode == 39) _rightDown = true;
    else if (e.keyCode == 37) _leftDown = true;
//    print("Key pressed down: keyCode: ${e.keyCode}, charCode: ${e.charCode}");
  }
  void onKeyUp(KeyboardEvent e) {
    if (e.keyCode == 39) _rightDown = false;
    else if (e.keyCode == 37) _leftDown = false;
//    print("Key released: keyCode: ${e.keyCode}, charCode: ${e.charCode}");
  }
  
  void onMouseMove(MouseEvent e) {
    if ((e.page.x > minX) && (e.page.x < maxX)) {
      _paddle.x = e.page.x - minX;
    }
  }

}

/**
 * Application module and mainentry point
 */
class BreakoutModule extends Module {
  BreakoutModule() {
    type(BreakoutController);
  }
}

void main() {
  applicationFactory()
    .addModule(new BreakoutModule())
    .run();
}