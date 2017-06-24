# Arduino教程：第四天
今天我们来尝试一下其他的传感器和显示器（温度传感器和数码管）
## 实验一：Arduino制作感温杯电路
实验电路：

![arduino-day5-1-The-experimental-circuit](https://github.com/Tangchen329/ArduinoCourse/blob/master/chapter5/image/arduino-day5-1-The-experimental-circuit.png)

实际电路：

![arduino-day5-2-The-experimental-circuit](https://github.com/Tangchen329/ArduinoCourse/blob/master/chapter5/image/arduino-day5-2-The-experimental-circuit.png)

- 程序代码：
作用:依据温度显示水杯制作同等功能的电路程序

```
*/
 
void setup() {
  pinMode(13, OUTPUT);
  pinMode(12, OUTPUT);
  pinMode(11, OUTPUT);
}
void loop() {
  int vol = analogRead(A0) * (5.0 / 1023.0*100);             //读取LM35温度值
if (vol<=31)                                               //低温区的温度值设置、以及led显示
{
  digitalWrite(13, HIGH);
  digitalWrite(12, LOW);
  digitalWrite(11, LOW);
}
else if (vol>=32 && vol<=40)                              //中温区温度范围设置  &&为“与”的意思，具体请查阅wiki
{
   digitalWrite(13, LOW);
  digitalWrite(12, HIGH);
  digitalWrite(11, LOW);
}
else if (vol>=41)                                           //高温区温度设置
{
   digitalWrite(13, LOW);
  digitalWrite(12, LOW);
  digitalWrite(11, HIGH);
}
 
}

```

- 扩展：学习温度传感器的代码知识









## 实验二：Arduino驱动数码管
数码管就是一堆led通过共阳并联在一起的小方块，用来显示数字和几个字母，是非常简单常见的显示器件。和学习笔记中的数码管代码不同，这次使用的代码单位时间只亮一个数码管上的灯，肉眼看到的1,2,3是因为高刷新率，大于肉眼分辨速度，使得肉眼看到1,2,3等。这样的好处是亮度高，而且亮度均匀。
实验电路：

![arduino-day5-3-The-experimental-circuit](https://github.com/Tangchen329/ArduinoCourse/blob/master/chapter5/image/arduino-day5-3-The-experimental-circuit.png)

实际电路：

![arduino-day5-4-The-experimental-circuit](https://github.com/Tangchen329/ArduinoCourse/blob/master/chapter5/image/arduino-day5-4-The-experimental-circuit.png)

- 元器件：数码管、导线、电阻
- 程序代码：

```
作用:arduino驱动数码管循环显示0,1,2,3,4几个数字
*/
 
void setup() {  
 
	 pinMode(13,OUTPUT);     //激活13号引脚，我们需要用它供电             
 
	for(int n=2;n<=9;n++)
   {
   pinMode(n,OUTPUT);
   }
}
 
 
void loop() 
{
 
digitalWrite(13,1); //这个就是HIGH  和LOW 的另一种写法  0代表LOW   1代表HIGH
 
 
  /*==========显示0=============*/  
int n0[8]={0,0,0,0,0,0,1,1};       //定义数组 通过0，1定义各数码管的明灭，
  int z=0;
  for(int x=2;x<=9;x++)          //采用循环方式依次点亮指定的数码管led（数组中0为点亮），单位时间只点亮1个led
  {
	digitalWrite(x,n0[z]);         //点亮led语句  X为引脚数  n0[z]为数组z为0-8的变量，来依次读取数组中的值
	z++;
	if (z>=9)                    //防止变量z累加超过了8
	z=0;
  }
  delay(1000);
/*==========显示1=============*/  
int n1[8]={1,0,0,1,1,1,1,1};
  z=0;
  for(int x=2;x<=9;x++)
  {
	digitalWrite(x,n1[z]);
	z++;
	if (z>=9)
	z=0;
  }
  delay(1000);
/*==========显示2=============*/  
 int n2[8]={0,0,1,0,0,1,0,1};
  z=0;
  for(int x=2;x<=9;x++)
  {
	digitalWrite(x,n2[z]);
	z++;
	if (z>=9)
	z=0;
  } 
delay(1000);  
/*==========显示3=============*/  
 int n3[8]={0,0,0,0,1,1,0,1};
  z=0;
  for(int x=2;x<=9;x++)
  {
	digitalWrite(x,n3[z]);
	z++;
	if (z>=9)
	z=0;
  } 
delay(1000);  
/*==========显示4=============*/  
 int n4[8]={1,0,0,1,1,0,0,1};
 z=0;
  for(int x=2;x<=9;x++)
  {
	digitalWrite(x,n4[z]);
	z++;
	if (z>=9)
	z=0;
  } 
delay(1000); 
}

```

- 拓展：自己尝试显示10种数字

- 扩展实验：红外遥控器

实验电路：

![arduino-day5-5-The-experimental-circuit](https://github.com/Tangchen329/ArduinoCourse/blob/master/chapter5/image/arduino-day5-5-The-experimental-circuit.png)

实际电路：

![arduino-day5-6-The-experimental-circuit](https://github.com/Tangchen329/ArduinoCourse/blob/master/chapter5/image/arduino-day5-6-The-experimental-circuit.png)

- 程序代码：

```
#include <IRremote.h>  // 使用IRRemote函数库
 
const int irReceiverPin = 2;  // 红外接收器的 OUTPUT 引脚接在 PIN2 接口 定义irReceiverPin变量为PIN2接口
 
IRrecv irrecv(irReceiverPin); // 设置irReceiverPin定义的端口为红外信号接收端口
decode_results results;    // 定义results变量为红外结果存放位置
 
void setup()
{
  Serial.begin(9600);   // 开启串口，波特率为9600
  irrecv.enableIRIn();   // 启动红外解码
}
 
void loop() 
{
  if (irrecv.decode(&results)) {   // 解码成功，把数据放入results变量中
	// 把数据输入到串口
	Serial.print("irCode: ");            
	Serial.print(results.value, HEX); // 显示红外编码
	Serial.print(",  bits: ");           
	Serial.println(results.bits); // 显示红外编码位数
	irrecv.resume();    // 继续等待接收下一组信号
  }  
  delay(600); //延时600毫秒，做一个简单的消抖
}

```

- 打开串口监视器，波特率设置为9600，使用遥控器对着红外头按下按键，串口监视器上就会出来当前按键的红外编码与位数。
