# Arduino教程：第二天
### 实验一：按钮控制LED开关
昨天制作了LED的闪烁之后，可能大家会觉得完全由程序控制的LED闪烁不够有趣，今天，我们尝试用按钮来对LED进行一些控制操作。
实验电路：

![arduino-day2-1-The-experimental-circuit](https://github.com/Tangchen329/ArduinoCourse/blob/master/Chapter2/image/arduino-day2-1-The-experimental-circuit.png)

实际电路：

![arduino-day2-2-The-experimental-circuit](https://github.com/Tangchen329/ArduinoCourse/blob/master/Chapter2/image/arduino-day2-2-The-experimental-circuit.png)

- 元器件：按钮、导线、电阻*2、LED
- 注意事项：有不少同学反映按键接触不良，造成无法使用，这个主要是因为按键没有完全插进面包板，所以才会有此问题。上两个按键正确插入面包板的图，大家可以参考一下，按入面包板的时候要左右用力均匀，完全压入面包板就可以了。如果往出拿呢，也很简单，可以使用面包板跳线盒中的圆头镊子，慢慢从中间槽中撬出来就可以了。

![arduino-day2-3](https://github.com/Tangchen329/ArduinoCourse/blob/master/Chapter2/image/arduino-day2-3.png)

![arduino-day2-4](https://github.com/Tangchen329/ArduinoCourse/blob/master/Chapter2/image/arduino-day2-4.png)

程序代码：
作用:当你按下按钮后1秒钟，灯会亮，然后维持5秒钟，熄灭

```
*/
 
void setup ()
{
  pinMode(4,INPUT);                 //将4号数字口设置为输入状态，13号数字口设置为输出状态
  pinMode(13,OUTPUT);
}
 
void loop()
{
  int n =digitalRead(4);                   //创建一个变量n，将4号数字口的状态采集出来赋值给他。
  if (n==HIGH)                             //判断n是否为高电平，如果是执行下面的语句，不是则跳过。
  {
 
	delay(1000);
	digitalWrite(13,HIGH);
	delay(5000);
	digitalWrite(13,LOW);
 
}
}

```

详细教程：http://www.geek-workshop.com/thread-1048-1-1.html

- 拓展：大家可以尝试不同的按钮控制操作
- 注意事项：按钮的连接方式
- 课后练习：用一个按键操作两个LED，当按键按下时有一个LED亮起，另一个LED熄灭。


















### 实验二：按钮PWM控制LED亮度
实验电路：

![arduino-day2-5-The-experimental-circuit](https://github.com/Tangchen329/ArduinoCourse/blob/master/Chapter2/image/arduino-day2-5-The-experimental-circuit.png)

- 元器件：电阻*3，LED，按钮*2，导线
- 从上图我们可以看到两个开关分别接到了数字接口，做输入检测，LED接到了板子上带有#号标识的数字接口上，注意只有带#号标识的接口才具备PWM输出功能。
程序代码：
- 作用:通过两个开关来控制led的亮度

```
 */
 
int n=0;
void setup ()
{
  pinMode(4,INPUT);
  pinMode(6,OUTPUT);      //该端口需要选择有#号标识的数字口
  pinMode(10,INPUT);
}
 
void loop()
{
  int up =digitalRead(4);          //读取4号口的状态
  int down = digitalRead(10);      //读取10号口的状态   
  if (up==HIGH)                    //判断4号口目前是否是高电平
  { 
   n=n+5;                         //每次累加值为5
	if (n>=255) {
	  n=255;
	}            //限定最大值为255   
analogWrite(6,n);               //使用PWM控制6号口输出，变量n的取值范围是0-255 
	delay (300);
  }
  if (down==HIGH)                    //减少亮度
  {
   n=n-5;
	if (n<=0) {
	  n=0;
	}
 analogWrite(6,n);
	delay (300);
  }
}

```
- 详细教程：http://www.geek-workshop.com/thread-1054-1-1.html

- 拓展：自行调节单位按钮的变化量度
- 课后练习：每次按1按键时，亮度增加速率变快，每次按2按键时，亮度减少速率变慢

# 扩展实验：脉冲计时
实验电路：
![arduino-day2-6-The-experimental-circuit](https://github.com/Tangchen329/ArduinoCourse/blob/master/Chapter2/image/arduino-day2-6-The-experimental-circuit.png.png)

元器件：电阻、按键、导线
程序代码：

```
int pin = 2;  //定义引脚为D2
unsigned long duration;  //定义duration变量为无符号长整数型变量
 
void setup()
{
  Serial.begin(9600);  //串口波特率为9600
  pinMode(pin, INPUT); //设置引脚为输入模式
}
 
void loop()
{
  duration = pulseIn(pin, HIGH,60000000); //读取引脚上的高电平脉冲，最大脉冲时间间隔为60秒，并且把结果赋值给duration变量
  Serial.println(duration); //通过串口输出duration变量
}

```

- 打开串口监视器后，按下按钮，就会返回每次按下松开这段时间有多长。比如第一条是196377，第二条是206748。他们对应的单位是微秒，单位换位秒以后分别是0.196377秒与0.206748秒。

![arduino-day2-7](https://github.com/Tangchen329/ArduinoCourse/blob/master/Chapter2/image/arduino-day2-7.png)

- pulseIn()函数用来读取一个引脚的脉冲（HIGH或LOW）。例如，如果value是HIGH，pulseIn()会等待引脚变为HIGH，开始计时，再等待引脚变为LOW并停止计时。返回脉冲的长度，单位毫秒。如果在指定的时间内无脉冲函数返回。

- 计时范围从10微秒至3分钟。（1秒=1000毫秒=1000000微秒）

语法：
```
pulseIn(pin, value) 
pulseIn(pin, value, timeout)
```


# 实验三：电位器PWM控制LED亮度
线性电位器是一个模拟量的电子元器件，模拟量和数字量有什么区别呢？简单的说，数字量只有0和1两种状态，对应的就是开和关，高电平和低电平。而模拟量则不一样，他的数据状态呈现线性状态例如1到1000。
所以，本次试验我们采用电位器对LED调光，这样不会像上一次按钮实验那样，亮度的变化有层级的跳跃，用电位器调光的话能够比较连贯柔和。
- 实验电路：

![arduino-day3-1-The-experimental-circuit](https://github.com/Tangchen329/ArduinoCourse/blob/master/chapter3/image/arduino-day3-1-The-experimental-circuit.png)

- 实际电路：

![arduino-day3-2-The-experimental-circuit](https://github.com/Tangchen329/ArduinoCourse/blob/master/chapter3/image/arduino-day3-2-The-experimental-circuit.png)

我们将电位器接入了arduino控制板的A0模拟量检测口，arduino的模拟接口能够测量0-5V的电压，对应的返回值为0-1024，对电压变化的测量精度相对较高。
- 程序代码：
- 作用:通过精密线性电位器PWM控制led亮度

```
*/
 
void setup()
{
  pinMode(11,OUTPUT);          //数字口要选择带#号的具有pwm功能的输出口
}
 
void loop()
{
  int n = analogRead(A0);     //读取A0模拟口的数值（0-5V 对应 0-1204取值）
  analogWrite(11,n/4);         //PWM最大取值255  所以将模拟口的取值n除以4
}

```


- 拓展：尝试控制不同变化速率

- 课后练习：一个电位器控制两个LED，一个随电位器数字增大而变亮，另一个随电位器数字增大而变暗

