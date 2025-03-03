import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _swipableListIndex =
          prefs.getInt('ff_swipableListIndex') ?? _swipableListIndex;
    });
    _safeInit(() {
      _recentSearches =
          prefs.getStringList('ff_recentSearches') ?? _recentSearches;
    });
    _safeInit(() {
      _cartProducts = prefs
              .getStringList('ff_cartProducts')
              ?.map((path) => path.ref)
              .toList() ??
          _cartProducts;
    });
    _safeInit(() {
      _cartSummary =
          prefs.getStringList('ff_cartSummary')?.map(double.parse).toList() ??
              _cartSummary;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _image = '';
  String get image => _image;
  set image(String value) {
    _image = value;
  }

  bool _timerRunning = false;
  bool get timerRunning => _timerRunning;
  set timerRunning(bool value) {
    _timerRunning = value;
  }

  int _swipableListIndex = 0;
  int get swipableListIndex => _swipableListIndex;
  set swipableListIndex(int value) {
    _swipableListIndex = value;
    prefs.setInt('ff_swipableListIndex', value);
  }

  bool _searchActive = false;
  bool get searchActive => _searchActive;
  set searchActive(bool value) {
    _searchActive = value;
  }

  bool _searchActive2 = false;
  bool get searchActive2 => _searchActive2;
  set searchActive2(bool value) {
    _searchActive2 = value;
  }

  List<String> _recentSearches = [];
  List<String> get recentSearches => _recentSearches;
  set recentSearches(List<String> value) {
    _recentSearches = value;
    prefs.setStringList('ff_recentSearches', value);
  }

  void addToRecentSearches(String value) {
    recentSearches.add(value);
    prefs.setStringList('ff_recentSearches', _recentSearches);
  }

  void removeFromRecentSearches(String value) {
    recentSearches.remove(value);
    prefs.setStringList('ff_recentSearches', _recentSearches);
  }

  void removeAtIndexFromRecentSearches(int index) {
    recentSearches.removeAt(index);
    prefs.setStringList('ff_recentSearches', _recentSearches);
  }

  void updateRecentSearchesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    recentSearches[index] = updateFn(_recentSearches[index]);
    prefs.setStringList('ff_recentSearches', _recentSearches);
  }

  void insertAtIndexInRecentSearches(int index, String value) {
    recentSearches.insert(index, value);
    prefs.setStringList('ff_recentSearches', _recentSearches);
  }

  List<DocumentReference> _cartProducts = [];
  List<DocumentReference> get cartProducts => _cartProducts;
  set cartProducts(List<DocumentReference> value) {
    _cartProducts = value;
    prefs.setStringList('ff_cartProducts', value.map((x) => x.path).toList());
  }

  void addToCartProducts(DocumentReference value) {
    cartProducts.add(value);
    prefs.setStringList(
        'ff_cartProducts', _cartProducts.map((x) => x.path).toList());
  }

  void removeFromCartProducts(DocumentReference value) {
    cartProducts.remove(value);
    prefs.setStringList(
        'ff_cartProducts', _cartProducts.map((x) => x.path).toList());
  }

  void removeAtIndexFromCartProducts(int index) {
    cartProducts.removeAt(index);
    prefs.setStringList(
        'ff_cartProducts', _cartProducts.map((x) => x.path).toList());
  }

  void updateCartProductsAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    cartProducts[index] = updateFn(_cartProducts[index]);
    prefs.setStringList(
        'ff_cartProducts', _cartProducts.map((x) => x.path).toList());
  }

  void insertAtIndexInCartProducts(int index, DocumentReference value) {
    cartProducts.insert(index, value);
    prefs.setStringList(
        'ff_cartProducts', _cartProducts.map((x) => x.path).toList());
  }

  List<double> _cartSummary = [];
  List<double> get cartSummary => _cartSummary;
  set cartSummary(List<double> value) {
    _cartSummary = value;
    prefs.setStringList(
        'ff_cartSummary', value.map((x) => x.toString()).toList());
  }

  void addToCartSummary(double value) {
    cartSummary.add(value);
    prefs.setStringList(
        'ff_cartSummary', _cartSummary.map((x) => x.toString()).toList());
  }

  void removeFromCartSummary(double value) {
    cartSummary.remove(value);
    prefs.setStringList(
        'ff_cartSummary', _cartSummary.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromCartSummary(int index) {
    cartSummary.removeAt(index);
    prefs.setStringList(
        'ff_cartSummary', _cartSummary.map((x) => x.toString()).toList());
  }

  void updateCartSummaryAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    cartSummary[index] = updateFn(_cartSummary[index]);
    prefs.setStringList(
        'ff_cartSummary', _cartSummary.map((x) => x.toString()).toList());
  }

  void insertAtIndexInCartSummary(int index, double value) {
    cartSummary.insert(index, value);
    prefs.setStringList(
        'ff_cartSummary', _cartSummary.map((x) => x.toString()).toList());
  }

  DocumentReference? _currentUser =
      FirebaseFirestore.instance.doc('/users/xCMnPHFM7pcOuQiBwbQmzVuVHwu1');
  DocumentReference? get currentUser => _currentUser;
  set currentUser(DocumentReference? value) {
    _currentUser = value;
  }

  LatLng? _Latlng = LatLng(51.5085, -0.1257);
  LatLng? get Latlng => _Latlng;
  set Latlng(LatLng? value) {
    _Latlng = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
