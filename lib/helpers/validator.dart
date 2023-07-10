validateLogin(String email, String password) {
  if (email.isNotEmpty) {
    if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      throw 'This is not a valid email!';
    }
  } else {
    throw 'Email can\'t be empty!';
  }
  if (password.isNotEmpty) {
    if (password.length < 8) {
      throw 'Password length must be more than 8 characters!';
    }
  } else {
    throw 'Password can\'t be empty!';
  }
}

validateSignup(String email, String password, String passwordConfirm) {
  if (email.isNotEmpty) {
    if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      throw 'This is not a valid email!';
    }
  } else {
    throw 'Email can\'t be empty!';
  }
  if (password.isNotEmpty) {
    if (password.length < 8) {
      throw 'Password length must be more than 8 characters!';
    }
    if (password != passwordConfirm) {
      throw 'Password confirm does not match the above password';
    }
  } else {
    throw 'Password can\'t be empty!';
  }
}