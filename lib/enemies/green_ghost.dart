import 'package:bonfire/bonfire.dart';
import 'package:pocman_game/main.dart';
import '../player/pocman.dart';
import '../spriteSheets/green_ghost_sprite_sheet.dart';
import '../spriteSheets/scared_ghost_sprite_sheet.dart';

class GreenGhost extends SimpleEnemy
    with ObjectCollision, AutomaticRandomMovement {
  GreenGhost(Vector2 position)
      : super(
          position: position,
          size: Vector2(tileSize, tileSize),
          animation: SimpleDirectionAnimation(
            idleRight: GreenGhostSpriteSheet.greenGhostRight,
            idleLeft: GreenGhostSpriteSheet.greenGhostLeft,
            idleDown: GreenGhostSpriteSheet.greenGhostDown,
            idleUp: GreenGhostSpriteSheet.greenGhostUp,
            runRight: GreenGhostSpriteSheet.greenGhostRight,
            runLeft: GreenGhostSpriteSheet.greenGhostLeft,
            runDown: GreenGhostSpriteSheet.greenGhostDown,
            runUp: GreenGhostSpriteSheet.greenGhostUp,
            others: {
              'scared': ScaredGhostSpriteSheet.scaredGhost,
            },
          ),
          speed: 20,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.circle(radius: 4),
        ],
      ),
    );
  }

  @override
  bool onCollision(GameComponent component, bool active) {
    if (isScared && component is Pocman) {
      removeFromParent();
      score += 300;
    }
    return super.onCollision(component, active);
  }

  @override
  void update(double dt) {
    seePlayer(
      observed: (player) {
        if (isScared == false) {
          seeAndMoveToPlayer(
            closePlayer: (player) {},
            radiusVision: tileSize * 2,
            margin: 0,
          );
        } else {
          runRandomMovement(
            dt,
            speed: 22,
            minDistance: 0,
            maxDistance: 99999999,
            timeKeepStopped: 0,
          );
        }
      },
      notObserved: () {
        runRandomMovement(
          dt,
          speed: 22,
          minDistance: 0,
          maxDistance: 99999999,
          timeKeepStopped: 0,
        );
      },
      radiusVision: tileSize * 2,
    );

    if (isScared == true) {
      animation?.playOther('scared');
    }

    super.update(dt);
  }
}
