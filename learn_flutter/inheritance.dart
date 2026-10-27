class User {
String username;
int age;

User(this.username, this.age);

void login() {
print('user logged in');
}
}

class SuperUser extends User {
SuperUser(String username, int age) : super(username, age);

void publish() {
print('published update');
}
}

void main() {
User user1 = User('Luigi', 25);
User user2 = User('Mario', 30);

print(user1.username);
print(user2.username);

SuperUser user3 = SuperUser('Yoshi', 20);
print(user3.username);
user3.publish();
user3.login();
}