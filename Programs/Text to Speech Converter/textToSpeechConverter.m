#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface ConversorTextoVoz : NSObject
@property (nonatomic, strong) AVSpeechSynthesizer *sintetizador;
- (void)falarTexto:(NSString *)texto;
@end

@implementation ConversorTextoVoz
- (instancetype)init {
    self = [super init];
    if (self) {
        _sintetizador = [[AVSpeechSynthesizer alloc] init];
    }
    return self;
}

- (void)falarTexto:(NSString *)texto {
    AVSpeechUtterance *fala = [[AVSpeechUtterance alloc] initWithString:texto];
    fala.rate = AVSpeechUtteranceDefaultSpeechRate;
    fala.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"pt-BR"];
    
    [self.sintetizador speakUtterance:fala];
    NSLog(@"Falando: %@", texto);
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        ConversorTextoVoz *conversor = [[ConversorTextoVoz alloc] init];
        
        NSLog(@"Digite um texto para converter em voz:");
        char input[256];
        fgets(input, 256, stdin);
        
        NSString *texto = [NSString stringWithCString:input encoding:NSUTF8StringEncoding];
        texto = [texto stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
        
        [conversor falarTexto:texto];
    }
    return 0;
}
