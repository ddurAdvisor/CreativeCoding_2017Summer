# Arduino教程：第三天
## 实验一：程序PWM控制LED亮度[呼吸灯]
实验电路：

![arduino-day3-3-The-experimental-circuit](https://github.com/Tangchen329/ArduinoCourse/blob/master/chapter3/image/arduino-day3-3-The-experimental-circuit.png)

因为是PWM试验，所以LED的数字接口一定要选用带#号标识的数字口，只有带#号的数字输出口才具有硬件PWM输出功能。
实际电路：

![arduino-day3-4-The-experimental-circuit](https://github.com/Tangchen329/ArduinoCourse/blob/master/chapter3/image/arduino-day3-4-The-experimental-circuit.png)
- 程序代码：
- 作用:通过循环语句控制PWM来达到呼吸灯效果

```
*/
 
void setup ()
{
  pinMode(11,OUTPUT);
}
 
void loop()
{
  for (int a=0; a<=255;a++)                //循环语句，控制PWM亮度的增加
  {
	analogWrite(11,a);
	delay(8);                             //当前亮度级别维持的时间,单位毫秒            
  }
	for (int a=255; a>=0;a--)             //循环语句，控制PWM亮度减小
  {
	analogWrite(11,a);
	delay(8);                             //当前亮度的维持的时间,单位毫秒  
  }
  delay(800);                             //完成一个循环后等待的时间,单位毫秒
}

```


- 拓展：用程序做出多个呼吸灯
- 课后练习：同时使用2组LED，1组为三色交替呼吸灯，1组为三色交替亮度递增，凸显两者的区别对比

- 扩展实验：三个电位器控制RGB灯

实验电路：

![arduino-day3-5-The-experimental-circuitpng](https://github.com/Tangchen329/ArduinoCourse/blob/master/chapter3/image/arduino-day3-5-The-experimental-circuitpng.png)

程序代码：

```
//变量声明
int ledPin1 = 9;
int ledPin2 = 10;
int ledPin3 = 11;//RGB灯的三个接脚分别接到9、10、11pwm处
int switchPin1 = 0;
int switchPin2 = 1;
int switchPin3 = 2;//三个电位计分别接入analog0,、1、2处
int value1;
int value2;
int value3;//定义三个变量用于控制灯泡变化

void setup() {
pinMode(ledPin1, OUTPUT);
pinMode(ledPin2, OUTPUT);
pinMode(ledPin3, OUTPUT);
pinMode(switchPin1, INPUT);
pinMode(switchPin2, INPUT);
pinMode(switchPin3, INPUT);
Serial.begin(9600);
}

void loop() {
value1 = analogRead(0);//读取模拟接口0的值
int v1 = map(value1,0,1023,0,255);//map缩放函数将模拟值0—1023缩放为0—255
value2 = analogRead(1);//读取模拟接口1的值
int v2 = map(value2,0,1023,0,255);
value3 = analogRead(2);//读取模拟接口2的值
int v3 = map(value3,0,1023,0,255);
Serial.println(v1,DEC);
analogWrite(ledPin1, v1);
analogWrite(ledPin2, v2);
analogWrite(ledPin3, v3);//将模拟值赋给LED
}

```


## 实验二：用蜂鸣器模拟警报器
今天我们做的是用蜂鸣器来做一个防控警报类似的报警器。
- 实验电路：

![arduino-day4-1-The-experimental-circuit](https://github.com/Tangchen329/ArduinoCourse/blob/master/chapter4/image/arduino-day4-1-The-experimental-circuit.png)

- 实际电路：

![arduino-day4-2-The-experimental-circuit](https://github.com/Tangchen329/ArduinoCourse/blob/master/chapter4/image/arduino-day4-2-The-experimental-circuit.png)

- 元器件：导线、蜂鸣器

程序代码：

```
作用:使用tone（）函数产生声音，模拟防控警报的响声
 
*/
void setup()
{
}
 
void loop()
{
for(int i=200;i<=800;i++)                    //用循环的方式将频率从200HZ 增加到800HZ
{
  pinMode(4,OUTPUT);
  tone(4,i);                            //在四号端口输出频率
 delay(5);                              //该频率维持5毫秒   
}
delay(4000);                            //最高频率下维持4秒钟
for(int i=800;i>=200;i--)
{
  pinMode(4,OUTPUT);
  tone(4,i);
 delay(10);
}
}

```

- 拓展：做出各种报警效果



## 实验三：用蜂鸣器模拟音乐
蜂鸣器除了做警报之外，还可以制作成更加精细的音乐效果。
- 实验电路：

![arduino-day4-3-The-experimental-circuit](https://github.com/Tangchen329/ArduinoCourse/blob/master/chapter4/image/arduino-day4-3-The-experimental-circuit.png)

- 元器件：蜂鸣器、导线

首先讲下简单的乐理知识，知道音乐是怎么演奏出来的自然就可以通过代码来进行编排了。
- 1.	演奏单音符  一首乐曲有若干音符组成，一个音符对应一个频率。我们知道到相对应的频率 让arduino输出到蜂鸣器 蜂鸣器就会放出相应的声音，这里有个表供大家参考：

![arduino-day4-4-list](https://github.com/Tangchen329/ArduinoCourse/blob/master/chapter4/image/arduino-day4-4-list.png)

- 音符的演奏时间  我们知道了音符是如何演奏出来的，下一步就是控制音符的演奏时间。每个音符都会播放一定的时间，这样才能构成一首优美的曲子，而不是生硬的一个调的把所有的音符一股脑的都播放出来。如何确定每个音符演奏的单位时间呢？
我们知道，音符节奏分为一拍、半拍、1/4拍、1/8拍，我们规定一拍音符的时间为1；半拍为0.5；1/4拍为0.25；1/8拍为0.125……，所以我们可以为每个音符赋予这样的拍子播放出来，音乐就成了。
- 我们看看如何将简谱翻译成对应频率和拍子。
以葫芦娃为例：

![arduino-day4-5-hulubaby](https://github.com/Tangchen329/ArduinoCourse/blob/master/chapter4/image/arduino-day4-5-hulubaby.png)

先看下左上角1=D这里，用的是D调，好那我们就看《音符频率表》中的D行（红色部分）
，
- 第一个音符是1 但上面有个点，所以对应的就是589，时间是一拍=1，
- 第二个音符6（没有点）就是495，时间也是一拍=1，
- 第三个音符5 即441，因为有下划线所以是半拍=0.5，
……以此类推
- 第四0这里要注意下，这里是没有声音，但是要是用频率0表示还是会有声音（这个不懂），所以我们用一个很高频率的声音，这样人耳听不到就达到了没有声音的效果，所以频率为-1。拍子=1拍
- 第五，再接着看到第一句歌词葫芦娃 这个娃的音是3—，这表示是两拍，后面每加一个“-”，表示拍子+1（1+1），本例中最多是加到4.
- 第六，第二句歌词葫芦娃这个娃，3•带个点，点的意思是去3的拍子的一半，即3•的拍子是1+0.5
- 第七，大家可能会问那弧线怎么表示，这在音乐中属于连音，我们要表示的话，可以稍微改下连音后面那个音的频率，比如减少或增加一些数值（需自己调试），这样表现会更流畅，但操作上更复杂了，本例没有做连音的处理，大家有兴趣可以自己调整下。
所以说了一大堆，规律就是时间上单个音符没有下划线，就是一拍（1），有下划线是半拍（0.5），两个下划线是四分之一拍（0.25），有“—”=前面音符的拍子+1；频率上就是按照音符是否带点，点在上还是在下到表中查找就可以了。
至此原理清楚，随便拿个简谱来我们都可以翻译成代码了。

程序代码：

```

#define NOTE_D0 -1
#define NOTE_D1 294
#define NOTE_D2 330
#define NOTE_D3 350
#define NOTE_D4 393
#define NOTE_D5 441
#define NOTE_D6 495
#define NOTE_D7 556

#define NOTE_DL1 147
#define NOTE_DL2 165
#define NOTE_DL3 175
#define NOTE_DL4 196
#define NOTE_DL5 221
#define NOTE_DL6 248
#define NOTE_DL7 278

#define NOTE_DH1 589
#define NOTE_DH2 661
#define NOTE_DH3 700
#define NOTE_DH4 786
#define NOTE_DH5 882
#define NOTE_DH6 990
#define NOTE_DH7 1112
//以上部分是定义是把每个音符和频率值对应起来，其实不用打这么多，但是都打上了，后面可以随意编写D调的各种歌，我这里用NOTE_D+数字表示音符，NOTE_DH+数字表示上面有点的那种音符，NOTE_DL+数字表示下面有点的那种音符。这样后面写起来比较好识别。
#define WHOLE 1
#define HALF 0.5
#define QUARTER 0.25
#define EIGHTH 0.25
#define SIXTEENTH 0.625
//这部分是用英文对应了拍子，这样后面也比较好看
int tune[] = 
{
  NOTE_DH1,NOTE_D6,NOTE_D5,NOTE_D6,NOTE_D0,
  NOTE_DH1,NOTE_D6,NOTE_D5,NOTE_DH1,NOTE_D6,NOTE_D0,NOTE_D6,
  NOTE_D6,NOTE_D6,NOTE_D5,NOTE_D6,NOTE_D0,NOTE_D6,
  NOTE_DH1,NOTE_D6,NOTE_D5,NOTE_DH1,NOTE_D6,NOTE_D0,
  
  NOTE_D1,NOTE_D1,NOTE_D3,
  NOTE_D1,NOTE_D1,NOTE_D3,NOTE_D0,
  NOTE_D6,NOTE_D6,NOTE_D6,NOTE_D5,NOTE_D6,
  NOTE_D5,NOTE_D1,NOTE_D3,NOTE_D0,
  NOTE_DH1,NOTE_D6,NOTE_D6,NOTE_D5,NOTE_D6,
  NOTE_D5,NOTE_D1,NOTE_D2,NOTE_D0,
  NOTE_D7,NOTE_D7,NOTE_D5,NOTE_D3,
  NOTE_D5,
  NOTE_DH1,NOTE_D0,NOTE_D6,NOTE_D6,NOTE_D5,NOTE_D5,NOTE_D6,NOTE_D6,
  NOTE_D0,NOTE_D5,NOTE_D1,NOTE_D3,NOTE_D0,
  NOTE_DH1,NOTE_D0,NOTE_D6,NOTE_D6,NOTE_D5,NOTE_D5,NOTE_D6,NOTE_D6,
  NOTE_D0,NOTE_D5,NOTE_D1,NOTE_D2,NOTE_D0,
  NOTE_D3,NOTE_D3,NOTE_D1,NOTE_DL6,
  NOTE_D1,
  NOTE_D3,NOTE_D5,NOTE_D6,NOTE_D6,
  NOTE_D3,NOTE_D5,NOTE_D6,NOTE_D6,
  NOTE_DH1,NOTE_D0,NOTE_D7,NOTE_D5,
  NOTE_D6,
};//这部分就是整首曲子的音符部分，用了一个序列定义为tune，整数

float duration[]=
{
  1,1,0.5,0.5,1,
  0.5,0.5,0.5,0.5,1,0.5,0.5,
  0.5,1,0.5,1,0.5,0.5,
  0.5,0.5,0.5,0.5,1,1,
  
  1,1,1+1,
  0.5,1,1+0.5,1,
  1,1,0.5,0.5,1,
  0.5,1,1+0.5,1,
  0.5,0.5,0.5,0.5,1+1,
  0.5,1,1+0.5,1,
  1+1,0.5,0.5,1,
  1+1+1+1,
  0.5,0.5,0.5+0.25,0.25,0.5+0.25,0.25,0.5+0.25,0.25,
  0.5,1,0.5,1,1,
  0.5,0.5,0.5+0.25,0.25,0.5+0.25,0.25,0.5+0.25,0.25,
  0.5,1,0.5,1,1,
  1+1,0.5,0.5,1,
  1+1+1+1,
  0.5,1,0.5,1+1,
  0.5,1,0.5,1+1,
  1+1,0.5,0.5,1,
  1+1+1+1
};//这部分是整首曲子的接拍部分，也定义个序列duration，浮点（数组的个数和前面音符的个数是一样的，一一对应么）
int length;//这里定义一个变量，后面用来表示共有多少个音符
int tonePin=8;//蜂鸣器的pin

void setup()
{
  pinMode(tonePin,OUTPUT);//设置蜂鸣器的pin为输出模式
  length = sizeof(tune)/sizeof(tune[0]);//这里用了一个sizeof函数，可以查出tone序列里有多少个音符
}

void loop()
{
  for(int x=0;x<length;x++)//循环音符的次数
  {
	tone(tonePin,tune[x]);//此函数依次播放tune序列里的数组，即每个音符
	delay(400*duration[x]);//每个音符持续的时间，即节拍duration，400是调整时间的越大，曲子速度越慢，越小曲子速度越快，自己掌握吧
	noTone(tonePin);//停止当前音符，进入下一音符
  }
  delay(5000);//等待5秒后，循环重新开始
}


```


- 扩展实验：Arduino超声波测距模块控制蜂鸣器

## 实验电路：

![arduino-day4-6-The-experimental-circuit](https://github.com/Tangchen329/ArduinoCourse/blob/master/chapter4/image/arduino-day4-6-The-experimental-circuit.png)

- 程序代码：

```
const int TrigPin = 2; 
const int EchoPin = 3; 
float cm; 
void setup() 
{ 
Serial.begin(9600); 
pinMode(TrigPin, OUTPUT); 
pinMode(EchoPin, INPUT); 
pinMode(8,OUTPUT);
} 
void loop() 
{ 
digitalWrite(8, LOW);

digitalWrite(TrigPin, LOW); //低高低电平发一个短时间脉冲去TrigPin 
delayMicroseconds(2); 
digitalWrite(TrigPin, HIGH); 
delayMicroseconds(10); 
digitalWrite(TrigPin, LOW); 

cm = pulseIn(EchoPin, HIGH) / 58.8; //将回波时间换算成cm 
cm = (int(cm * 100.0)) / 100.0; //保留两位小数 
if (cm>=2 && cm<=10)
digitalWrite(8, HIGH);
} 
```

- 目前暂无超声传感器

