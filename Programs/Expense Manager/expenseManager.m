#import <Foundation/Foundation.h>

@interface Despesa : NSObject
@property (nonatomic, strong) NSString *descricao;
@property (nonatomic) float valor;
@property (nonatomic, strong) NSDate *data;
- (instancetype)initWithDescricao:(NSString *)descricao valor:(float)valor;
@end

@implementation Despesa
- (instancetype)initWithDescricao:(NSString *)descricao valor:(float)valor {
    self = [super init];
    if (self) {
        _descricao = descricao;
        _valor = valor;
        _data = [NSDate date];
    }
    return self;
}
@end

@interface GerenciadorDespesas : NSObject
@property (nonatomic, strong) NSMutableArray<Despesa *> *despesas;
- (void)adicionarDespesa:(NSString *)descricao valor:(float)valor;
- (void)listarDespesas;
- (float)calcularTotal;
@end

@implementation GerenciadorDespesas
- (instancetype)init {
    self = [super init];
    if (self) {
        _despesas = [NSMutableArray new];
    }
    return self;
}

- (void)adicionarDespesa:(NSString *)descricao valor:(float)valor {
    Despesa *novaDespesa = [[Despesa alloc] initWithDescricao:descricao valor:valor];
    [self.despesas addObject:novaDespesa];
    NSLog(@"Despesa adicionada: %@ - R$ %.2f", descricao, valor);
}

- (void)listarDespesas {
    NSLog(@"Lista de despesas:");
    for (Despesa *despesa in self.despesas) {
        NSLog(@"%@ - R$ %.2f", despesa.descricao, despesa.valor);
    }
}

- (float)calcularTotal {
    float total = 0.0;
    for (Despesa *despesa in self.despesas) {
        total += despesa.valor;
    }
    return total;
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        GerenciadorDespesas *gerenciador = [[GerenciadorDespesas alloc] init];
        
        [gerenciador adicionarDespesa:@"Almoço" valor:35.50];
        [gerenciador adicionarDespesa:@"Transporte" valor:15.00];
        [gerenciador adicionarDespesa:@"Café" valor:5.75];
        
        [gerenciador listarDespesas];
        
        float total = [gerenciador calcularTotal];
        NSLog(@"Total de despesas: R$ %.2f", total);
    }
    return 0;
}
