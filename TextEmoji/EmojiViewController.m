//
//  EmojiViewController.m
//  TextEmoji
//
//  Created by 519968211 on 2019/12/3.
//  Copyright © 2019 sd3i. All rights reserved.
//

#import "EmojiViewController.h"
#import "MyCell1.h"

@interface EmojiViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, retain) NSArray<NSString *> *emojiArray;
@property (nonatomic, retain) UILabel *emojiLabel;
@property (nonatomic, retain) UISlider *slider;

@end

@implementation EmojiViewController

- (void)viewDidLoad
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initEmojiArray];
    
    NSArray *colorArray = @[[UIColor redColor],[UIColor greenColor],[UIColor blueColor],[UIColor orangeColor],[UIColor yellowColor],[UIColor grayColor],[UIColor blackColor],[UIColor purpleColor],[UIColor brownColor],[UIColor magentaColor]];
    
    for(int i=0;i<10;i++)
    {
        UIButton *colorButton = [UIButton buttonWithType:UIButtonTypeCustom];
        colorButton.frame = CGRectMake(10+30*i, [[UIApplication sharedApplication] statusBarFrame].size.height+self.navigationController.navigationBar.frame.size.height+10, 20, 20);
        colorButton.backgroundColor = [colorArray objectAtIndex:i];
        [colorButton addTarget:self action:@selector(colorButtonPress:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:colorButton];
    }
    
    _slider = [[UISlider alloc] initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width-30, 40, 20, [[UIScreen mainScreen] bounds].size.width/3.0*2-80)];
    _slider.transform = CGAffineTransformRotate(CGAffineTransformIdentity, -M_PI_2);
    _slider.frame = CGRectMake([[UIScreen mainScreen] bounds].size.width-30, [[UIApplication sharedApplication] statusBarFrame].size.height+self.navigationController.navigationBar.frame.size.height+40, 20, [[UIScreen mainScreen] bounds].size.width/3.0*2-80);
    _slider.tintColor = [UIColor lightGrayColor];
    _slider.value = 0.5;
    [_slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_slider];
    
    _emojiLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, [[UIApplication sharedApplication] statusBarFrame].size.height+self.navigationController.navigationBar.frame.size.height+40, [[UIScreen mainScreen] bounds].size.width-40, [[UIScreen mainScreen] bounds].size.width/3.0*2-40)];
    _emojiLabel.textAlignment = NSTextAlignmentCenter;
    _emojiLabel.textColor = [UIColor colorWithWhite:0.3 alpha:1];
    _emojiLabel.font = [UIFont fontWithName:@"Arial" size:40];
    _emojiLabel.text = [_emojiArray objectAtIndex:0];
    [self.view addSubview:_emojiLabel];
    
    UILabel *sizeLabel = [[UILabel alloc] initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width-40, [[UIApplication sharedApplication] statusBarFrame].size.height+self.navigationController.navigationBar.frame.size.height, 40, 40)];
    if([[UIScreen mainScreen] bounds].size.width-40<300)
    {
        sizeLabel.frame = CGRectMake(CGRectGetMinX(_slider.frame)-50, CGRectGetMinY(_slider.frame), 40, 40);
    }
    sizeLabel.textColor = [UIColor colorWithWhite:0.3 alpha:1];
    sizeLabel.textAlignment = NSTextAlignmentCenter;
    sizeLabel.font = [UIFont fontWithName:@"Arial" size:15];
    sizeLabel.text = @"size";
    [self.view addSubview:sizeLabel];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_emojiLabel.frame), [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height-CGRectGetMaxY(_emojiLabel.frame))];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.bounces = NO;
    tableView.allowsSelection = NO;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMinY(tableView.frame), [[UIScreen mainScreen] bounds].size.width, 0.5)];
    line.backgroundColor = [UIColor colorWithWhite:0.2 alpha:1];
    [self.view addSubview:line];
}

- (void)initEmojiArray
{
    NSString *string1 = @"(⊙ᗜ⊙)、（‐＾▽＾‐）、 ٩(๑òωó๑)۶、 ヾ（≧?≦）〃、 o(>ω<)o、 (￣▽￣)ノ、 ๑乛◡乛๑ 、 （＾_＾）、 (＾▽＾) 、 ↖(ω)↗、 (=-ω-=)、 ٩(◕‿◕｡)۶ 、 ＼(☆o☆)／、 (.) 、 (-)、 ლ(⌒▽⌒ლ)、 ໒( ◔ ▽ ◔ )७、 (o⌒．⌒o) 、 ٩(ᴗ)۶ 、o(o)o、 ︿(￣︶￣)︿ 、 (๑¯∀¯๑)、 (～￣▽￣)～、 (☆▽☆)、 (p≧w≦q)、 (/≧▽≦)/、 ٩(๑❛ᴗ❛๑)۶、 Y(o)Y、 O(∩∩)O 、 =￣ω￣=、 (●＾o＾●) 、(★＞U＜★)、 (★ᴗ★)";
    NSString *string2 = @"(；´д｀)ゞ、(；д；)、(；へ：)、(╥╯╰╥)、╮(╯﹏╰）╭、╭(╯╰)╮、(╯︵╰)、(╯﹏╰)b、罒ω罒、( Ĭ ^ Ĭ )、(T＿T)、(Ｔ▽Ｔ)、(ㄒoㄒ)、╥﹏╥、o(╥﹏╥)o、〒▽〒、 (T_T) 、T^T、/(ㄒoㄒ)/~、(T ^ T) 、ε(┬┬﹏┬┬)3、 o(TωT)o 、(〒︿〒)、T_T\"、┭┮﹏┭┮、ε(┬┬﹏┬┬)3 、༼༎ຶᴗ༎ຶ༽、⊙︿⊙、⊙﹏⊙、(ó﹏ò｡)、￣へ￣、~~o(>_<)o ~~";
    NSString *string3 = @"ɖී؀ීϸ、 (」゜ロ゜)」、 (´⊙ω⊙`)！、 щ(゜ロ゜щ) 、 ༼∩•́ω•̀∩༽ 、 ໒( ◑ w ◑ )७、 ԅ༼ . º ʖ̯ º . ༽ง、 (⊹◕ʖ̯◕)、 ⊙▂⊙、 ⋋⁞ ◔ ﹏ ◔ ⁞⋌ 、 乁໒( ͒ ⌂ ͒ )७ㄏ、 Σ(っ°Д°;)っ、 ╰(⊹◕۝◕ )╯、 ╰[ ⁰﹏⁰ ]╯ 、 ʕ⊙ᴥ⊙ʔ、 〳 ◔ Ĺ̯ ◔ 〵、 (●´ω｀●) 、 ╰(”◕﹏◕”)つ、 o͡͡͡╮༼ • ʖ̯ • ༽╭o͡͡͡ 、＼(0)／、 ໒( ” ͠° ʖ̫ °͠ ” )७、 w(@。@;)w、 (／。＼) 、 ヽ༼ ʘ ∧ ʘ ༽ᓄ、 w(°ｏ°)w、 (°д°) 、(∩◕(oo)◕∩ ) 、 (゜ロ゜) 、 ༼ﾉ۞⌂۞༽ﾉ、(゜д゜)";
    NSString *string4 = @"༼ ಠ ▃ ಠೃ ༽ 、 ʕ ᓀ ᴥ ᓂ ʔ、 ⋋╏ ᓀ 〜 ᓂ ╏⋌、 ╚═| ~ ಠ ₒ ಠ ~ |═╝、 ╭(๑¯д¯๑)╮、 ୧( ಠ Д ಠ )୨、 ᕦ໒( ⊡ 益 ⊡ )७ᕤ、 (눈눈)、 <(－︿－)>、 ╰༼ ⋋ ‸ ⋌ ༽╯、 (◣◢)、 ╰| ⁰ ෴ ⁰ |╯ 、 (o˘д˘)o 、 (╬•᷅д•᷄╬)、 (๑‾᷆д‾᷇๑)、 o(≧o≦)o、 [ ಠ □ ಠೃ ] 、 （╯－＿－）╯╧╧ 、 ᕦ໒( ᴼ 益 ᴼ )७ᕤ、 c༼ ” ͡° ▃ °͡ ” ༽ᕤ、 ꒰╬•᷅д•᷄╬꒱、╰_ ╯、(艹皿艹)、(▼ヘ▼#)";
    NSString *string5 = @"c〳 ݓ ﹏ ݓ 〵੭、 o(╥﹏╥)o 、 ╭(ʘ̆◞౪◟ʘ̆)╮、 ┏། ﹒ _ ﹒ །┓、 ┌(▀Ĺ̯▀)┐ 、 ┌༼◉ل͟◉༽┐、 (▰˘︹˘▰)、 (ㄒoㄒ) 、 （ｉДｉ）、 c( ˵ ╥ ͟ʖ ╥ ˵ )੭、 ┭┮﹏┭┮、 ┌(▀Ĺ̯ ▀-͠ )┐、 ┌໒( : ⊘ ۝ ⊘ : )७┐、 ᗜੂͦ﹏ᗜੂͦ 、┌〳 ･ o ･ 〵┐、 ┌[ ◔ ͜ ʖ ◔ ]┐、 ੧║ ☯ ⌂ ☯ ║┐、 ┌། ☯ ʖ ☯ །┐、 ┌〳 ۞ ﹏ ۞ 〵┐ 、┌╏ º □ º ╏┐ 、 ༼ ╥ ل ╥ ༽ 、(︶︹︺) 、 ┏(--)┓、┏(--)┛┗(-- )┓、 ͼ(ݓ_ݓ)ͽ、 (╯︵╰,) 、 (⋟﹏⋞)";
    NSString *string6 = @"（-＾〇＾-）、 (▰˘o˘▰)、 ヾ(。￣□￣)ﾂ 、 ヾ(￣□￣;)ﾉ 、 (*-ω-) 、 (∪｡∪)｡｡｡zzz、 (ᴗ˳ᴗ)、 ＼(o￣∇￣o)/ 、 (≚ᄌ≚)ƶƵ 、＼（´Ｏ｀）／、 ✾꒡ .̮ ꒡✾、 ƪ(‾￣o￣”)ʃ 、 －O－、 ∑(￣□￣)、 π_π、 ［(－－)］zzz、 （￣o￣） . z Z、　(˴́³[▒]꒱⌕˚º꒰…꒱";
    NSString *string7 = @"凸( •̀•́ )凸、 ᕕ༼ ՞ ͜ʖ ՞ ༽凸、 ༼凸 ◉◔༽凸、 ໒( •̀ ◡ •́ )७┌∩┐、 ╭∩╮◕ل͜◕)╭∩╮、 凸༼ຈل͜ຈ༽凸、 ┌∩┐༼ ºل͟º ༽┌∩┐、 凸(⊙▂⊙✖ )、 ╭∩╮ʕ•ᴥ•ʔ╭∩╮、 凸( •̀ 3 •́ )凸、 凸〳 ಥ ڡ ಥ 〵凸、 ┌∩┐(◕◡◉)┌∩┐、 t( -_- t )、 ᕕ╏ ͡ᵔ ‸ ͡ᵔ ╏凸、 ٩║ ✿ ᴼ ل ᴼ ✿ ║┌∩┐、 ╭∩╮໒(✪ਊ✪)७╭∩╮、 ໒( ͡; 益 ͡; )७┌∩┐、 ᕕ໒( * ◕ ڡ ◕ * )७╭∩╮、 ╭∩╮( ͡° ل͟ ͡° )╭∩╮、 ╭∩╮(ಠ۝ಠ)╭∩╮";
    NSString *string8 = @"░ ∗ ◕ ں ◕ ∗ ░ 、 (V●ᴥ●V) 、 ༼ つ ◕◕ ༽つ、 ༼∩•́ω•̀∩༽ 、 ʕ ᓀ ᴥ ᓂ ʔ、 (⊙ᗜ⊙) 、 ╰། ❛ ڡ ❛ །╯ 、 ヽ༼ ் ▽ ் ༽╯ 、 ⋋| ՞ ‸ ՞ |⋌ 、ヽ(╯▽╰)ﾉ 、 (⊃｡•́‿•̀｡)⊃、 ⋋| ՞ ‸ ՞ |⋌、 ლ ( ◕ ᗜ ◕ ) ლ、 ʕ⊙ᴥ⊙ʔ、 (⊹つ•۝•⊹)つ、 ༼∩•́ω•̀∩༽ 、 ⋋( ◕ ∧ ◕ )⋌、 ʕ ⊃･ ◡ ･ ʔ⊃、 ʕ༼◕ ౪ ◕✿༽ʔ、 ୧ʕ ⇀ ⌂ ↼ ʔ୨、 [ ಠ (oo) ಠ ]、 s( ^ ‿ ^)-b、 ▓⚗⚗▓、 ୧། ☉ ౪ ☉ །୨、 ヽ໒(☯_☯✿)७ﾉ、 ╏ •́ – •̀ ╏、 @( ◕ x ◕ )@、 (°ヮ°)、 ༼☯﹏☯༽ 、 ୧| ⁰ ᴥ ⁰ |୨";
    NSString *string9 = @"ᕙ། ◕ – ◕ །ᕗ、 ᕦ[ ◔ (oo) ◔ ]ᕤ 、 ᕙ( * •̀ ᗜ •́ * )ᕗ、 ᕦʕ ° o ° ʔᕤ 、 ᕙ༼ຈل͜ຈ༽ᕗ 、 ᕙ[ ˵ ͡’ ω ͡’ ˵ ]ᕗ 、 ᕙ( ͡◉ ͜ ʖ ͡◉)ᕗ、 ᕙ( ͡° ͜ʖ ͡°)ᕗ、 ᕙʕ ◖ ڡ ◗ ʔᕗ、 ୧╏ ՞ _ ՞ ╏୨、 ᕙ༼◕◞౪◟◕༽ᕗ、 ᕦ╏ ¬ ʖ̯ ¬ ╏ᕤ、 ᕦ( ̿ ﹏ ̿ )ᕤ、 ᕦ( ⊙ ∧ ⊙ )ᕤ、 ᕙ(⇀∏↼)ᕗ、 ᕙ▐ ° ◯ ° ▐ᕗ、 ᕦ༼ ~ •́ ₒ •̀ ~ ༽ᕤ、 ᕦ| º ෴ º |ᕤ、 ᕦ( ⊙ ∧ ⊙ )ᕤ、 ᕙ▐ ° ◯ ° ▐ᕗ、 ᕙ༼◕ ᴥ ◕༽ᕗ、 ᕦ⊙෴⊙ᕤ、 ᕙ། – ڡ – །ᕗ";
    NSString *string10 = @"ヾ(=･ω･=)o、(￣.￣)、（￣︶￣）↗、￣ω￣=、o(￣▽￣)ｄ 、(￣３￣)a 、￣▽￣、╮(￣▽￣)╭、ｂ（￣▽￣）ｄ、(～o￣3￣)～ 、\\（￣︶￣）/ 、∠( °ω°)／ 、(灬°ω°灬) 、(o°ω°o)、┗(•ω•;)┛、ヽ(•ω•。)ノ、(๑•ω•๑)、(๑Ő௰Ő๑)、(❦ω❦)、ヽ(ω)ﾉ 、 (〃ω) 、(❁´3`❁)、ヾ(ΦωΦ)ツ、(๑╹っ╹๑)、(.ω.)、( :3 )、(•ᴗ•)、｡◕ᴗ◕｡、ლ(＾ω＾ლ)、ლ(❛◡❛✿)ლ、ლ(⁰⊖⁰ლ)、ლ(|||⌒εー|||)ლ";
    NSArray *stringArray = @[string1,string2,string3,string4,string5,string6,string7,string8,string9,string10];
    
    NSMutableArray *mutArray = [NSMutableArray array];
    NSString *string = [stringArray objectAtIndex:_index];
    for(NSString *emojiString in [string componentsSeparatedByString:@"、"])
    {
        NSString *emojiString1 = emojiString;
        if([emojiString1 hasPrefix:@" "])
        {
            emojiString1 = [emojiString1 substringFromIndex:1];
        }
        if([emojiString1 hasSuffix:@" "])
        {
            emojiString1 = [emojiString1 substringToIndex:emojiString1.length-1];
        }
        [mutArray addObject:emojiString1];
    }
    _emojiArray = [mutArray copy];
}

#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return (_emojiArray.count-1)/4+1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyCell1 *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(!cell)
    {
        cell = [[MyCell1 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    for(int i=0;i<4;i++)
    {
        NSUInteger emojiIndex = 4*indexPath.row+i;
        if(emojiIndex<_emojiArray.count)
        {
            UIButton *button = [cell.buttonArray objectAtIndex:i];
            [button setTitle:[_emojiArray objectAtIndex:emojiIndex] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(emojiButtonPress:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    return cell;
}

- (void)emojiButtonPress:(UIButton *)button
{
    _emojiLabel.text = button.currentTitle;
}

- (void)colorButtonPress:(UIButton *)button
{
    _emojiLabel.textColor = button.backgroundColor;
}

- (void)sliderValueChanged:(UISlider *)slider
{
    _emojiLabel.font = [UIFont fontWithName:@"Arial" size:15+50*slider.value];
}

@end
