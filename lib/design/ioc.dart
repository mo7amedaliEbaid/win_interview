abstract class AuthService {
  void login(String username, String password);
}
class EmailAuthService implements AuthService {
  @override
  void login(String username, String password) {
    print('Logging in with email: $username');
  }
}

class GoogleAuthService implements AuthService {
  @override
  void login(String username, String password) {
    print('Logging in with Google account: $username');
  }
}
class LoginManager {
  final AuthService _authService;

  // Dependency is injected via constructor
  LoginManager(this._authService);

  void performLogin(String username, String password) {
    _authService.login(username, password);
  }
}
void main() {
  // Inject EmailAuthService
  LoginManager emailLoginManager = LoginManager(EmailAuthService());
  emailLoginManager.performLogin('user@example.com', 'password123');

  // Inject GoogleAuthService
  LoginManager googleLoginManager = LoginManager(GoogleAuthService());
  googleLoginManager.performLogin('user@gmail.com', 'password456');
}
// Logging in with email: user@example.com
// Logging in with Google account: user@gmail.com