library breakout;

import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';
import 'dart:async';
import 'dart:html';
import 'dart:math' as math;

import 'ball.dart';

/**
 * GUI controller for Breakout game
 */
@Controller(
    selector: '[breakout-gui]',
    publishAs: 'ctrl')
class BreakoutController {
  
  // private properties
  CanvasRenderingContext2D _ctx;
  Ball _ball;
  final Duration _updateInterval = new Duration(milliseconds: 10);
  Timer _ballTimer;
  
  // constructor
  BreakoutController() {
    var canvas = document.querySelector('#canvas');
    _ball = new Ball(canvas.context2D);
    _ctx = canvas.context2D;
    
    _ball.dx = -2;
    _ball.dy = -1;
    _ballTimer = new Timer.periodic(_updateInterval, (_) {_ball.draw();});
//    drawCircle();
//    addColors();
  }
   
  void drawCircle() {
    _ctx.beginPath();
    _ctx.arc(75, 75, 10, 0, 2*math.PI, true);
    _ctx.closePath();
    _ctx.fill();    
  }
  
  void addColors() {
    _ctx.fillStyle = "#00A308";
    _ctx.beginPath();
    _ctx.arc(220, 220, 50, 0, 2*math.PI, true);
    _ctx.closePath();
    _ctx.fill();
    
    _ctx.fillStyle = "#FF1C0A";
    _ctx.beginPath();
    _ctx.arc(100, 100, 100, 0, 2*math.PI, true);
    _ctx.closePath();
    _ctx.fill();
    
    _ctx.fillStyle = "rgba(255, 255, 0, .5)";
    _ctx.beginPath();
    _ctx.rect(15, 150, 120, 120);
    _ctx.closePath();
    _ctx.fill();
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