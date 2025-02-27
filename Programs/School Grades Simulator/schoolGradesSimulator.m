#import <Foundation/Foundation.h>

@interface SimuladorNotas : NSObject
- (float)calcularMediaComNotas:(NSArray<NSNumber *> *)notas;
- (NSString *)verificarAprovacaoComMedia:(float)media;
@end

@implementation SimuladorNotas
- (float)calcularMediaComNotas:(NSArray<NSNumber *> *)notas {
    float soma = 0.0;
    for (NSNumber *nota in notas) {
        soma += [nota floatValue];
    }
    return soma / [notas count];
}

- (NSString *)verificarAprovacaoComMedia:(float)media {
    return media >= 6.0 ? @"Aprovado" : @"Reprovado";
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        SimuladorNotas *simulador = [[SimuladorNotas alloc] init];
        
        NSMutableArray<NSNumber *> *notas = [NSMutableArray new];
        float nota;
        int quantidade;
        
        NSLog(@"Digite a quantidade de notas:");
        scanf("%d", &quantidade);
        
        for (int i = 0; i < quantidade; i++) {
            NSLog(@"Digite a nota %d:", i + 1);
            scanf("%f", &nota);
            [notas addObject:[NSNumber numberWithFloat:nota]];
        }
        
        float media = [simulador calcularMediaComNotas:notas];
        NSString *status = [simulador verificarAprovacaoComMedia:media];
        
        NSLog(@"Média Final: %.2f", media);
        NSLog(@"Status: %@", status);
    }
    return 0;
}
