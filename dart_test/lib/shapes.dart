import 'dart:math';

enum Shapes { circle, square, triangle }

abstract class Shape {
  factory Shape(Shapes type, Color color, num side) {
    if (type == Shapes.circle) return Circle(side)..paint(color);
    if (type == Shapes.square) return Square(side)..paint(color);
    if (type == Shapes.triangle) return Triangle(side)..paint(color);
    throw 'Can\'t create $type.';
  }
  num get area;
  Color get color;
  void draw();
}

enum Color { red, blue, green }

mixin PaintableMixin {
  late Color _color;
  void paint(Color color) {
    _color = color;
  }

  Color get color => _color;
}

class Circle with PaintableMixin implements Shape {
  num _radius;
  Circle(this._radius);
  @override
  num get area => pi * pow(_radius, 2);
  set radius(num r) {
    _radius = r;
  }

  @override
  void draw() {
    print('Draw circle with color $color and radius $_radius');
  }
}

class Square with PaintableMixin implements Shape {
  num _side;
  Square(this._side);
  @override
  num get area => pow(_side, 2);
  set side(num s) {
    _side = s;
  }

  @override
  void draw() {
    print('Draw square with color $color and side $_side');
  }
}

class Triangle with PaintableMixin implements Shape {
  num _side;
  Triangle(this._side);
  @override
  num get area => pow(_side, 2) / 2;
  set side(num s) {
    _side = s;
  }

  @override
  void draw() {
    print('Draw triangle with color $color and side $_side');
  }
}
