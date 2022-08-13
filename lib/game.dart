import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:pocman_game/interface/interface.dart';
import 'coins/big_coin.dart';
import 'coins/small_coin.dart';
import 'controller/my_game_controller.dart';
import 'enemies/blue_ghost.dart';
import 'enemies/green_ghost.dart';
import 'enemies/red_ghost.dart';
import 'enemies/yellow_ghost.dart';
import 'main.dart';
import 'player/pocman.dart';

class Game extends StatefulWidget {
  final int stage;
  const Game({Key? key, this.stage = 1}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  final TiledWorldMap map1 = TiledWorldMap(
    'map/pocman_map.json',
    objectsBuilder: {
      'blueGhost': (properties) => BlueGhost(properties.position),
      'greenGhost': (properties) => GreenGhost(properties.position),
      'yellowGhost': (properties) => YellowGhost(properties.position),
      'redGhost': (properties) => RedGhost(properties.position),
      'small_coin': (properties) => SmallCoin(properties.position),
      'big_coin': (properties) => BigCoin(properties.position),
    },
  );

  final TiledWorldMap map2 = TiledWorldMap(
    'map/pocman_map2.json',
    objectsBuilder: {
      'blueGhost': (properties) => BlueGhost(properties.position),
      'greenGhost': (properties) => GreenGhost(properties.position),
      'yellowGhost': (properties) => YellowGhost(properties.position),
      'redGhost': (properties) => RedGhost(properties.position),
      'small_coin': (properties) => SmallCoin(properties.position),
      'big_coin': (properties) => BigCoin(properties.position),
    },
  );

  Vector2 position = Vector2(5 * tileSize, 10 * tileSize);

  @override
  void initState() {
    switch (widget.stage) {
      case 1:
        position = Vector2(5 * tileSize, 10 * tileSize);
        break;
      case 2:
        position = Vector2(19 * tileSize, 13 * tileSize);
        break;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BonfireTiledWidget(
      joystick: Joystick(
        directional: JoystickDirectional(
          margin: const EdgeInsets.only(left: 200, bottom: 100),
          color: Colors.yellowAccent,
        ),
        keyboardConfig: KeyboardConfig(),
      ),
      map: widget.stage == 1 ? map1 : map2,
      components: [
        MyGameController(widget.stage),
      ],
      player: Pocman(position),
      overlayBuilderMap: {
        Interface.overlayKey: ((context, game) => Interface(game: game))
      },
      initialActiveOverlays: const [
        Interface.overlayKey,
      ],
      cameraConfig: CameraConfig(
        moveOnlyMapArea: true,
        zoom: 5.5,
      ),
    );
  }
}
