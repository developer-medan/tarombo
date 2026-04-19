import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:tarombo/core/util/global_ui_handler.dart';

class AppBlocObserver extends BlocObserver {
  final Logger _logger = Logger(printer: PrettyPrinter(methodCount: 0, errorMethodCount: 5, lineLength: 80, colors: true, printEmojis: true, dateTimeFormat: DateTimeFormat.none));

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    _logger.i('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    _logger.d('onChange -- ${bloc.runtimeType}, change: $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    _logger.e('❌ Bloc Error in ${bloc.runtimeType}', error: error, stackTrace: stackTrace);

    // Auto-trigger global UI error notification
    GlobalUIHandler().showErrorSnackBar(error.toString());

    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    _logger.i('onClose -- ${bloc.runtimeType}');
  }
}
