import 'package:auth_app/data/models/app_info/app_info.dart';
import 'package:auth_app/data/models/user/user.dart';
import 'package:auth_app/data/repositories/app_info.repository.dart';
import 'package:auth_app/data/repositories/user.repository.dart';
import 'package:auth_app/extensions/extension_on_object.dart';
import 'package:mobx/mobx.dart';

part 'auth.store.g.dart';

class AuthStore = AuthStoreBase with _$AuthStore;

abstract class AuthStoreBase with Store {
  final UserRepository _userRepository = UserRepository();
  final AppInfoRepository _appInfoRepository = AppInfoRepository();

  @observable
  bool loading = false;

  @observable
  String errorMessage = '';

  @observable
  String toastMessage = '';

  @observable
  int selectedIndex = 0;

  @observable
  bool? shouldShowToast;

  @computed
  bool get isLoginSelected => selectedIndex == 0;

  @action
  void changeSelectedIndex(int index) {
    selectedIndex = index;
  }

  @action
  void showToast({bool? isSucceed = false, String message = ''}) {
    shouldShowToast = isSucceed;
    toastMessage = message;
  }

  @action
  void setLoading(bool newLoading) {
    loading = newLoading;
  }

  @action
  void setErrorMessage(String message) {
    errorMessage = message;
  }

  void onAuthActionWrapper(
    String email,
    String username,
    String password,
  ) {
    if (isLoginSelected) {
      onLoginAction(username, password);
      return;
    }

    onSignUpAction(email, username, password);
  }

  void onLoginAction(String username, String password) async {
    if (!isValidateLoginCreds(username, password)) {
      setErrorMessage('Please write valid creds');

      return;
    }

    setLoading(true);

    User? user = await _userRepository.getUserByUsername(username);

    if (user.isNotNull && user!.password == password) {
      var isSucceed = await _appInfoRepository.updateAppInfo(
        AppInfo(
          is_user_logged_in: 0,
          is_dark_mode: 0,
        ),
      );
      setLoading(false);

      showToast(isSucceed: true, message: 'You are logged in');
    } else {
      setLoading(false);
      showToast(isSucceed: false, message: 'Wrong Credent');
    }
  }

  void onSignUpAction(
    String email,
    String username,
    String password,
  ) async {
    if (!isValidateSignUpCreds(email, username, password)) {
      setErrorMessage('Please write valid creds');
    }

    setLoading(true);
    String? error;

    User? usedUsername = await _userRepository.getUserByUsername(username);
    if (usedUsername.isNotNull) {
      error = 'Username already taken';
    }

    User? usedEmail = await _userRepository.getUserByEmail(email);
    if (usedEmail.isNotNull) {
      error = 'Email already taken';
    }

    if (error.isNotNull) {
      setLoading(false);
      showToast(isSucceed: false, message: error!);

      return;
    }

    bool isSucceed = await _userRepository.createUser(
      User(
        email: email,
        username: username,
        password: password,
      ),
    );

    setLoading(false);

    var message =
        isSucceed ? 'Registration completed' : 'There are some problems';

    showToast(isSucceed: isSucceed, message: message);
  }

  bool isValidateLoginCreds(String username, String password) {
    bool isUsernameValid = validateUsername(username);
    bool isPasswordValid = validatePassword(password);

    return isUsernameValid && isPasswordValid;
  }

  bool isValidateSignUpCreds(
    String email,
    String username,
    String password,
  ) {
    bool isUsernameValid = validateUsername(username);
    bool isPasswordValid = validatePassword(password);
    bool isEmailValid = validateEmail(email);

    return isUsernameValid && isPasswordValid && isEmailValid;
  }

  bool validateUsername(String username) {
    return usernameRegExp.hasMatch(username);
  }

  bool validateEmail(String email) {
    return emailRegExp.hasMatch(email);
  }

  bool validatePassword(String password) {
    return passwordRegExp.hasMatch(password);
  }

  RegExp get usernameRegExp => RegExp(r'^[a-zA-Z0-9]{3,20}$');
  RegExp get emailRegExp => RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+\.[a-zA-Z]{2,}$');
  RegExp get passwordRegExp => RegExp(r'^(?=.*[a-zA-Z])(?=.*\d).{8,20}$');
}
