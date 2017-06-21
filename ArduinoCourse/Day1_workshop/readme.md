# Arduino教程：第一天

## 什么是Arduino？  

> Arduino是一块基于开放原始代码的Simple i/o平台，并且具有开发语言和开发环境都很简单、易理解的特点。让您可以快速使用Arduino做出有趣的东西。 
它是一个能够用来感应和控制现实物理世界的一套工具。 它由一个基于单片机并且开放源码的硬件平台，和一套为Arduino板编写程序 的开发环境组成。 
Arduino可以用来开发交互产品，比如它可以读取大量的开关和传感器信号，并且可以控制各式各样的电灯、电机和其他物理设备。Arduino项目可以是单独的，也可以在运行时和你电脑中运行的程序（例如：Flash，Processing，MaxMSP）进行通讯。Arduino开源的IDE可以免费下载得到。


### 特色描述
- 开放原始码的电路图设计，开发界面免费下载，也可依需求自己修改!! 
- 下载程序简单、方便。 
- 可简单地与传感器、各式各样的电子元件连接（如：LED灯、蜂鸣器、按键、光敏电阻等等），做出各种各样有趣的东西。 
- 开发语言和开发环境都非常的简单、易理解，非常适合初学者学习

### 性能描述
- Digital I/O 数字输入/输出端口0—13。
- Analog I/O 模拟输入/输出端口0-5。
- 支持ISP下载功能。 
- 输入电压：接上USB时无须外部供电或外部5V~9V 直流电压输入。
- 输出电压：5V 直流电压输出和3.3V 直流电压输出和外部电源输入。

### Arduino安装
- http://www.arduino.cc/download  页面下载相应的arduino版本，解压并安装
- 将arduino通过USB连接至电脑，安装驱动
- 在控制面板-设备管理器中，检查端口（COM 和 LPT）是否有arduino安装成功提示
- 详细安装教程参考：http://jingyan.baidu.com/article/3c48dd345cc954e10be358e4.html

### 元器件
- Arduino板
- 面包板
- 导线
- 电阻
- 发光二极管


### 实验一：面包板LED闪烁实验
搭建我们的第一个电路，并且驱动他，拿出准备好的实验盒，按照试验器件取出需要的元器件。
元器件：电阻、导线、LED灯

首先我们认识一下LED（发光二极管），所谓LED其实就是一枚分极性的灯泡，通电就会亮。它的内阻很小所以在连接电路时需要配上一个电阻防止短路。LED有两个引脚，长的是正极，短的是负极。
电阻一般为四环电阻，颜色和数字对比为：
黑，棕，红，橙，黄，绿，蓝，紫，灰，白
0，	1， 2， 3， 4， 5， 6， 7， 8， 9
前两位是数字，第三位代表0的个数，最后一位指误差，倒数第二环，可以金色（代表×0.1）和银色的（代表×0.01），最后一环误差可以无色（20%）
面包板的构造：

![arduino-day1-1-The structure-of-the-bread-plate](https://github.com/Tangchen329/ArduinoCourse/blob/master/chapter1/image/arduino-day1-1-The%20structure-of-the-bread-plate.png)
的两边拥有4组8条横向相连的插孔，这4组我们称之为电源孔，一般是作为电源引入的通路，中间是上下两部分，纵向每5个孔为一个通道（这5个孔是联通的），这个就是我们的主工作区，用来插接原件和跳线。

面包板中间为什么要设计一条凹槽呢，中间的分隔部分这样子设计也是有讲究的。

示意上下两边是断开的。
加了凹槽后这个宽度，使得紧挨凹槽两面孔的距离刚好是7.62mm，这个间距正好插入标准窄体的DIP引脚IC。
IC插上后。。因为引脚很多，一般很难取下来，如果暴力拔很容易弄弯引脚，这个槽刚好可以让大家用镊子之类东西伸到IC下面，慢慢翘起来

实验电路：

![arduino-day1-2-The-experimental-circuit](https://github.com/Tangchen329/ArduinoCourse/blob/master/chapter1/image/arduino-day1-2-The-experimental-circuit.png)

程序代码：
```

/*
程序说明： 
 使一个Led亮一秒，灭一秒，如此往复。
 */
void setup() {                
  // 初始化数字引脚，使其为输出状态。
  // 大部分Arduino控制板上，数字13号引脚都有一颗Led。
  pinMode(13, OUTPUT);     
}
 
void loop() {
  digitalWrite(13, HIGH);   // 使Led亮
  delay(1000);              // 持续1秒钟
  digitalWrite(13, LOW);    // 使Led灭
  delay(1000);              // 持续1秒钟。
}


```
打开arduino程序，将代码复制进去
选择tools-board，选择正确的arduino控制板
选择tools-Serials Port，选择合适的端口
点击编译（打钩的图标），当下方显示Done Compiling说明编译成功
点击下载（箭头的图标），当下方显示Done uploading说明下载烧录成功
详细教程：http://www.geek-workshop.com/thread-993-1-1.html

拓展：可以更换不同颜色的LED，进行不同的闪烁方法、频率
- 课后练习：选择一种颜色的LED，让它亮3秒，灭1秒，再亮5秒，灭1秒，以此为循环反复闪烁。

### 实验二：多个LED的闪烁
当进行了多次实验后，大家肯定不满足于一盏灯的闪烁，因此我们现在来设计一下多个LED的闪烁
实验电路：

![arduino-day1-3-The-experimental-circuit](https://github.com/Tangchen329/ArduinoCourse/blob/master/chapter1/image/arduino-day1-3-The-experimental-circuit.png)

为什么空出了0和1两个接口呢？这两个接口其实共享了板子的串口，tx和rx，也就是说，如果在这两个接口上连接led的话，就无法进行正常的程序下载了。所以，一般我们会空出来不使用，一定要使用的情况下，也是先下载好程序然后再连接电路。
实际电路：

![arduino-day1-4-The-experimental-circuit](https://github.com/Tangchen329/ArduinoCourse/blob/master/chapter1/image/arduino-day1-4-The-experimental-circuit.png)

程序代码：
```
/*
作用:让六个led依次点亮熄灭

*/
void setup()
{
  for (int i=2; i<=7; i++)    //通过循环的方式设置2-7号引脚为输出状态
  {
    pinMode(i,OUTPUT);
  }
}
void loop()
{
  for (int x=2; x<=7; x++)   //通过循环的方式依次让每个引脚的led在1秒内完成明灭
  {
    digitalWrite(x,HIGH);
    delay(500);
    digitalWrite(x,LOW);
    delay(500);
  }
}


```

下载好后就可以看见led每半秒一个灯的速度依次闪动，这个就是传说中的流水灯，在大家熟悉了之后可以自己改变灯的闪烁方式，比如一起闪烁或是间隔闪烁等。
- 详细教程：http://www.geek-workshop.com/thread-1020-1-1.html
- 拓展：自己改变灯的闪烁方式，比如一起闪烁或是间隔闪烁等
- 注意事项：选择合适电阻，否则灯光会过亮或过暗

- 课后练习：用五个LED让它们同时亮起，然后逐个熄灭，再逐个亮起，最后同时熄灭
