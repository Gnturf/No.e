class User {
  const User({
    required this.firstName,
    required this.lastName,
    this.profileURL,
  });

  final String firstName;
  final String lastName;
  final String? profileURL;
}
