import 'package:bonfire/bonfire.dart';

class BlueGhostSpriteSheet {
  static Future<SpriteAnimation> get blueGhostRight => SpriteAnimation.load(
        'enemies/blueGhost/blueGhostRight.png',
        SpriteAnimationData.sequenced(
          amount: 8,
          stepTime: 0.15,
          textureSize: Vector2(16, 16),
          texturePosition: Vector2(0, 0),
        ),
      );

  static Future<SpriteAnimation> get blueGhostLeft => SpriteAnimation.load(
        'enemies/blueGhost/blueGhostLeft.png',
        SpriteAnimationData.sequenced(
          amount: 8,
          stepTime: 0.15,
          textureSize: Vector2(16, 16),
          texturePosition: Vector2(0, 0),
        ),
      );

  static Future<SpriteAnimation> get blueGhostUp => SpriteAnimation.load(
        'enemies/blueGhost/blueGhostLeft.png',
        SpriteAnimationData.sequenced(
          amount: 8,
          stepTime: 0.15,
          textureSize: Vector2(16, 16),
          texturePosition: Vector2(0, 0),
        ),
      );

  static Future<SpriteAnimation> get blueGhostDown => SpriteAnimation.load(
        'enemies/blueGhost/blueGhostRight.png',
        SpriteAnimationData.sequenced(
          amount: 8,
          stepTime: 0.15,
          textureSize: Vector2(16, 16),
          texturePosition: Vector2(0, 0),
        ),
      );
}
