import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'reducer.dart';
import 'state.dart';

Store<AppState> createStore() {
  final middleware = <Middleware<AppState>>[thunkMiddleware];
  return Store<AppState>(
    appReducer,
    initialState: AppState(),
    middleware: middleware,
  );
}
