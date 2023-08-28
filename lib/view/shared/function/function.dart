String? vinputUsername(String input) {
  if (input.isEmpty) {
    return 'Please this felid is required';
  } else if (input.length < 4) {
    return 'This is short';
  }
  return null;
}

String? vinputpassword(String input) {
  if (input.isEmpty) {
    return 'Please this felid is required';
  } else if (input.length < 6) {
    return 'Must be grater than 6 latters';
  }
  return null;
}
