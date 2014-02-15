import 'CanvasDemo.dart';

class SpaceCanvas extends CanvasDemo {
  /** Constructs a new BlobTest. */
  SpaceCanvas() : super("Blob test");

  /** Entrypoint. */
  static void main() {
    final blob = new SpaceCanvas();
    blob.initialize();
    blob.initializeAnimation();
    blob.runAnimation();
  }

  void initialize() {
    
  }
}