class UserModel
{
  // Field
  String ID, Name, User, Password;

  // onstructor
  UserModel(this.ID, this.Name, this.User, this.Password);

  UserModel.parseJSON(Map<String, dynamic> parseJSON)
  {
    ID = parseJSON['ID'];
    Name = parseJSON['Name'];
    User = parseJSON['User'];
    Password = parseJSON['Password'];
  }
}