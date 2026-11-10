import 'package:flutter_test/flutter_test.dart';
import 'package:empresta_ai_app/controllers/sessao_controller.dart';


// Como as regras moram nos controllers, dá para testá-las sem abrir tela.
void main() {
  group('SessaoController', () {
    final sessao = SessaoController();

    test('aceita apartamento no formato bloco-número', () {
      expect(sessao.validarApartamento('A-302'), isNull);
      expect(sessao.validarApartamento('b104'), isNull);
    });

    test('recusa apartamento vazio ou fora do formato', () {
      expect(sessao.validarApartamento(''), isNotNull);
      expect(sessao.validarApartamento('302'), isNotNull);
    });

    test('senha precisa ter exatamente 4 números', () {
      expect(sessao.validarSenha('1234'), isNull);
      expect(sessao.validarSenha('12a4'), isNotNull);
      expect(sessao.validarSenha('123'), isNotNull);
    });

    test('entrar guarda o apartamento em maiúsculas', () {
      expect(sessao.entrar('a-302', '1234'), isTrue);
      expect(sessao.apartamento, 'A-302');
    });
  });
}