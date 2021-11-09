import 'package:quiver/core.dart';

class Composition {
  final String author;
  final String composition;
  final String compositionImage;

  Composition(this.author, this.composition, this.compositionImage);

  bool operator ==(o) => o is Composition && author == o.author && author == o.author;
  int get hashCode => hash2(author.hashCode, composition.hashCode);
}
