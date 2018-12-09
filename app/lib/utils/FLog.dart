import 'package:logging/logging.dart';

final flog = new Logger('hoge');

fLogInit() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((LogRecord rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}
