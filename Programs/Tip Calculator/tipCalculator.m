#import <Foundation/Foundation.h>

@interface CalculadoraGorjeta : NSObject
- (float)calcularGorjetaComValorConta:(float)valorConta porcentagem:(float)porcentagem;
@end

@implementation CalculadoraGorjeta
- (float)calcularGorjetaComValorConta:(float)valorConta porcentagem:(float)porcentagem {
    return valorConta * (porcentagem / 100.0);
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        CalculadoraGorjeta *calculadora = [[CalculadoraGorjeta alloc] init];
        
        float valorConta;
        float porcentagem;
        
        NSLog(@"Digite o valor da conta:");
        scanf("%f", &valorConta);
        
        NSLog(@"Digite a porcentagem da gorjeta:");
        scanf("%f", &porcentagem);
        
        float gorjeta = [calculadora calcularGorjetaComValorConta:valorConta porcentagem:porcentagem];
        float total = valorConta + gorjeta;
        
        NSLog(@"Gorjeta: R$ %.2f", gorjeta);
        NSLog(@"Total a pagar: R$ %.2f", total);
    }
    return 0;
}
