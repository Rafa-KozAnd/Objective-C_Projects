#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>

@interface GameScene : SKScene
@end

@implementation GameScene {
    SKSpriteNode *paddle;
    SKSpriteNode *ball;
}

- (void)didMoveToView:(SKView *)view {
    self.backgroundColor = [UIColor blackColor];
    
    paddle = [SKSpriteNode spriteNodeWithColor:[UIColor whiteColor] size:CGSizeMake(100, 20)];
    paddle.position = CGPointMake(self.size.width / 2, 50);
    paddle.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:paddle.size];
    paddle.physicsBody.dynamic = NO;
    [self addChild:paddle];
    
    ball = [SKSpriteNode spriteNodeWithColor:[UIColor whiteColor] size:CGSizeMake(15, 15)];
    ball.position = CGPointMake(self.size.width / 2, 100);
    ball.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:7.5];
    ball.physicsBody.restitution = 1.0;
    ball.physicsBody.friction = 0.0;
    ball.physicsBody.linearDamping = 0.0;
    ball.physicsBody.allowsRotation = NO;
    [self addChild:ball];
    
    [ball.physicsBody applyImpulse:CGVectorMake(10, 10)];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    paddle.position = CGPointMake(location.x, paddle.position.y);
}
@end

@interface GameViewController : UIViewController
@end

@implementation GameViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    SKView *skView = (SKView *)self.view;
    GameScene *scene = [[GameScene alloc] initWithSize:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    [skView presentScene:scene];
}
- (BOOL)prefersStatusBarHidden {
    return YES;
}
@end
