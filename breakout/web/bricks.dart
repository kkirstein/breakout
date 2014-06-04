part of breakout;

class Brick {
  
  // public properties
  bool isHit;
  
  // constructor
  Brick() {
    isHit = false;
  }
}

class BrickCoordinates {
  int x;
  int y;
  int width;
  int height;
  
  // constructor
  BrickCoordinates(this.x, this.y, this.width, this.height) {}
}

class Bricks {
  
  // public properties
  
  // private properties
  List<Brick> _bricks;
  int _brickWidth;
  int _brickHeight;
  int _ncols;
  int _nrows;  
  int _padding;
  
  // constructor
  Bricks(this._ncols, this._nrows, this._padding, int canvasWidth) {
    _brickWidth = (canvasWidth~/_ncols) - _padding;
    _brickHeight = 15;
    
    _bricks = new List(_ncols * _nrows);
    for (int i=0; i<(_ncols*_nrows); i++) {
      _bricks[i] = new Brick();
    }
  }
  
  // check whether brick is hit
  bool checkBricks(int ballX, int ballY) {
    var colPitch = _brickWidth + _padding;
    var rowPitch = _brickHeight + _padding;
    var col = ballX ~/ colPitch;
    var row = ballY ~/ rowPitch;
    if ((ballY < _nrows*rowPitch) && (row >= 0) && (col >= 0) && !isBrickHit(col, row)) {
      _hitBrick(col, row);
      return true;
    } else {
      return false;
    }
  }
  
  // hit tests
  bool isBrickHit(int col, int row) {
    return _bricks[col + row*_ncols].isHit;
  }
  
  // get list of active brick's coordinate
  List<BrickCoordinates> getBricks() {
    List<BrickCoordinates> ll = new List();
    for (int i=0; i<_nrows; i++) {
      for (int j=0; j<_ncols; j++) {
        if (!_bricks[j + i*_ncols].isHit) {
          ll.add(new BrickCoordinates(_getBrickX(j), _getBrickY(i), _brickWidth, _brickHeight));
        }
      }
    }
    return ll;
  }
  
  // private methods
  void _hitBrick(int col, int row) {
      _bricks[col + row*_ncols].isHit = true;
    }
    
  int _getBrickX(int col) {
    return col * (_brickWidth+_padding) + _padding;
  }
  
  int _getBrickY(int row) {
    return row * (_brickHeight+_padding) + _padding;
  }
}
