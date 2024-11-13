abstract class PaymentStrategy {
  void pay(double amount);
}
class CreditCardPayment implements PaymentStrategy {
  final String cardNumber;

  CreditCardPayment(this.cardNumber);

  @override
  void pay(double amount) {
    print('Paid \$${amount.toStringAsFixed(2)} using Credit Card: $cardNumber');
  }
}

class PayPalPayment implements PaymentStrategy {
  final String email;

  PayPalPayment(this.email);

  @override
  void pay(double amount) {
    print('Paid \$${amount.toStringAsFixed(2)} using PayPal: $email');
  }
}

class BitcoinPayment implements PaymentStrategy {
  final String walletAddress;

  BitcoinPayment(this.walletAddress);

  @override
  void pay(double amount) {
    print('Paid \$${amount.toStringAsFixed(2)} using Bitcoin: $walletAddress');
  }
}
class PaymentContext {
  PaymentStrategy? _paymentStrategy;

  void setPaymentStrategy(PaymentStrategy strategy) {
    _paymentStrategy = strategy;
  }

  void pay(double amount) {
    if (_paymentStrategy == null) {
      print('No payment strategy selected!');
      return;
    }
    _paymentStrategy!.pay(amount);
  }
}
void main() {
  PaymentContext paymentContext = PaymentContext();

  // Using Credit Card Payment
  paymentContext.setPaymentStrategy(CreditCardPayment('1234-5678-9012-3456'));
  paymentContext.pay(100.0);

  // Using PayPal Payment
  paymentContext.setPaymentStrategy(PayPalPayment('user@example.com'));
  paymentContext.pay(200.0);

  // Using Bitcoin Payment
  paymentContext.setPaymentStrategy(BitcoinPayment('1A1zP1eP5QGefi2DMPTfTL5SLmv7DivfNa'));
  paymentContext.pay(0.05);
}
// Paid $100.00 using Credit Card: 1234-5678-9012-3456
// Paid $200.00 using PayPal: user@example.com
// Paid $0.05 using Bitcoin: 1A1zP1eP5QGefi2DMPTfTL5SLmv7DivfNa