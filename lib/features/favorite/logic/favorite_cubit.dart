import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helpers/shared_pref_helper.dart';
import '../data/models/favorite_model.dart';

class FavoriteCubit extends Cubit<List<FavoriteProductData>> {
  FavoriteCubit() : super([]);

  static const String favoriteKey = "favorite_products";

  void loadFavorites() async {
    final favoritesJson = await SharedPrefHelper.getString(favoriteKey);
    if (favoritesJson.isNotEmpty) {
      try {
        final List<dynamic> decodedJson = json.decode(favoritesJson);
        final favorites =
            decodedJson
                .map((json) => FavoriteProductData.fromJson(json))
                .toList();
        emit(favorites);
      } catch (e) {
        emit([]);
      }
    } else {
      emit([]);
    }
  }

  void toggleFavorite(FavoriteProductData product) async {
    final currentFavorites = List<FavoriteProductData>.from(state);
    final index = currentFavorites.indexWhere(
      (favorite) => favorite.productId == product.productId,
    );

    if (index >= 0) {
      currentFavorites.removeAt(index);
    } else {
      currentFavorites.add(product);
    }

    final jsonString = json.encode(
      currentFavorites.map((product) => product.toJson()).toList(),
    );
    await SharedPrefHelper.setData(favoriteKey, jsonString);
    emit(currentFavorites);
  }

  bool isFavorite(String productId) {
    return state.any((product) => product.productId == productId);
  }
}
