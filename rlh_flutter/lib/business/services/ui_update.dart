abstract class UiUpdate {
  final String message;
  final bool showSnackBar;

  UiUpdate(this.message, {this.showSnackBar = false});
}

class UiUpdateSuccess extends UiUpdate {
  UiUpdateSuccess(super.message, {super.showSnackBar});
}

class UiUpdateMessage extends UiUpdate {
  UiUpdateMessage(super.message, {super.showSnackBar});
}
