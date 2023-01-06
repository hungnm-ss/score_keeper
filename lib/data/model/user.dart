import 'package:score_keeper/database/db_constants.dart';
import 'package:score_keeper/utils/parse_format/parse_util.dart';

class User {
  int? id;
  String? name;
  int? score;
  String? color;

  User({
    this.id,
    this.name,
    this.score,
    this.color,
  });

  User.fromDbMap(Map map) {
    id = Parse.toIntValue(map[columnUserId]);
    score = Parse.toIntValue(map[columnUserScore]);
    name = map[columnUserName];
    color = map[columnUserColor];
  }


}
