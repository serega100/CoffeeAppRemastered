import 'package:coffee_app_remastered/model/cart/cart_holder.dart';
import 'package:coffee_app_remastered/model/map/address/address.dart';
import 'package:coffee_app_remastered/model/map/address/address_holder.dart';
import 'package:coffee_app_remastered/model/map/personal_map_holder.dart';
import 'package:coffee_app_remastered/presenter/cart/i_cart_presenter.dart';
import 'package:coffee_app_remastered/view/pages/cart/i_cart_view.dart';

class CartPresenter implements ICartPresenter {
  final Future<CartHolder> _cartHolderFuture;
  final Future<AddressHolder> _addressHolder;
  final Future<PersonalMapHolder> _personalMapHolder;

  late ICartView _view;

  CartPresenter({
    required Future<CartHolder> cartHolderFuture,
    required Future<AddressHolder> addressHolderFuture,
    required Future<PersonalMapHolder> personalMapHolderFuture,
  })
      : _cartHolderFuture = cartHolderFuture,
        _addressHolder = addressHolderFuture,
        _personalMapHolder = personalMapHolderFuture;

  @override
  set view(ICartView view) {
    _view = view;
    _cartHolderFuture.then((holder) {
      view.cartHolder = holder;
    });
  }

  @override
  void onCheckoutPressed() {
    _cartHolderFuture.then((holder) async {
      var addressHolder = await _addressHolder;
      Address? address = await _getOptimalAddress();
      if (address == null) {
        _view.showNoAddressesMessage();
        return;
      }
      _view.showCheckout(holder, addressHolder, address);
    });
  }

  Future<Address?> _getOptimalAddress() async {
    var favoriteAddress = await _getFavoriteAddress();
    if (favoriteAddress != null && favoriteAddress.openingHours.isOpened) {
      return favoriteAddress;
    }

    var nearAddress = (await _addressHolder).getNearOpenedAddress();
    return nearAddress;
  }

  Future<Address?> _getFavoriteAddress() async {
    Address? favoriteAddress;
    var addressHolder = await _addressHolder;
    var favoriteId = (await _personalMapHolder).selectedAddressId;
    if (favoriteId != null) {
      favoriteAddress = addressHolder.getAddressById(favoriteId);
    }
    return favoriteAddress;
  }

  @override
  void onItemRemoved(int itemId) {
    _cartHolderFuture.then((holder) {
      var removedItem = holder.getItemById(itemId);
      holder.removeItem(itemId);
      _view.cartHolder = holder;
      _view.showRemovedNotification(removedItem);
    });
  }
}
