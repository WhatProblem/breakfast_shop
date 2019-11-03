## 1.const与final区别:

- final包括const的作用，但是final包括运行时常量的作用，final a = new DateTime(); 生效， 但是const a = new DateTime(); 报错
- const只能复制字面量，final可以修饰函数，函数返回值，字面量等

--------------

## 2.List数组：(list = ['001', '002'])

>>>新建List数组，定义List元素类型
- var list = new List<String>(); 定义list内的元素都是string类型
- list.add('123');正常
- list.add(456); 报错

>>>直接量的方式新建List
- var list = ['123', 456, '789'];
- list.length; 获取数组长度

>>>list.isEmpty()判断是否为空
>>>isNotEmpty()判断是否不为空

>>>list.reversed 翻转数组顺序：返回的是一个集合，需要通过 toList() 方法转换为数组
- List a = ['001', '002']; 
- a.reversed => ('002', '001')
- a.reversed.toList() => ['002', '001']

>>>list.add(value)新增元素
- list.add('003') => ['001', '002', '003']

>>>list.addAll([value...])新增一组元素
- list.addAll(['003', '004']) => ['001', '002', '003', '004']

>>>list.remove(value):移除元素
- list.remove('001') => ['002']

>>>list.removeAt(index): 移除指定位置元素
- list.removeAt(1) => ['001']

>>>list.indexOf(value):查找有没当前元素，有返回位置索引值，否则返回-1
- list.indexOf('002') => 1
- list.indexOf('123') => -1

>>>list.fillRange(startIndex, endIndex, replaceValue):从指定位置开始替换值，含头不含尾
- list.fillRange(0,1, 'abc') => ['abc', '002']
- list.fillRange(0,2, 'abc') => ['abc', 'abc']

>>>list.insert(index, value): 指定位置插入值
- list.insert(1, 'aaa') => ['001', 'aaa', '002']

>>>list.insertAll(index, [value...]): 指定位置插入一个数组
- list.insertAll(1, ['aaa', 'bbb']) => ['001', 'aaa', 'bbb', '002']

>>>list.join(str): 将数组转换为字符串，与javascript一致

>>>list.split(str): 字符串分割，与javascript一致

>>>take(n) 从数组里取 n 个元素
- arr.take(3).toList()

>>>skip(n) 跳过数组中的 n 个元素
- arr.skip(n).toList()

>>>list.sublist(start,end) 返回指定范围元素的数组，含头不含尾，返回新数组 end 大于数组长度会报错
- list.sublist(0,1) // ['001']

>>>list.getRange(start,end) 返回是一个集合，其余和sublist相同
- list.getRange(0,1) // ('001')

>>>list.retainWhere(callback) 修改原数组，保留满足条件的元素，删除不满足条件的元素
- list.retainWhere((item)=>item=='001') // ['001']

>>>list.indexOf(ele, [startPos]) 从指定位置向后查询，返回元素所在索引位置，ele在查询范围不存在返回-1
- list.indexOf('001', 1) // -1
- list.indexOf('002', 1) // 1

>>>list.lastIndexOf(ele, [endPos]) 从指定位置向前查询，与indexOf相同，只是查询范围中传入endPos后从开始位置查询

>>>for in：用于Map, Set, List，用法和javascript基本一致
>>>map(fn)：遍历方法，用于Map, Set, List，用法和javascript基本一直
>>>forEach(fn)：遍历方法，用于Map, Set, List，用法和javascript基本一直
>>>where(fn)：筛选满足条件的数据，和javascript的filter用法基本一致
>>>arr.removeWhere(fn) 移除满足条件的项
>>>any(fn)：返回boolean值，只要集合中的元素有一项满足条件返回true,否则返回false
>>>every(fn)：返回boolean值，集合中的每个元素都必须满足条件才能返回true，否则返回false

------------------

## 3.Map对象：( {name: '测试','age': 25} )

>>>直接量新建Map对象
- var map = {name: '测试',age: 25, data: [1,'2']}

>>>使用new方式创建
- var map = new Map();添加元素时只能使用 map['key'] 的形式
map['name'] = '测试';

>>>map.keys:获取key的列表，map.values: 获取value的列表
- map.keys.toList() => ['name', 'age']
- map.values.toList() => ['测试', 25]

>>>map.addAll(...{}):添加元素方法
- map.addAll({'sex': 'man'}) => {name: '测试','age': 25, 'sex': 'man'}

>>>map.remove(key):移除指定元素
- map.remove('name') => {'age': 25}

>>>map.isEmpty(): 为空判断，map.isNotEmpty(): 不为空判断

----------------

## 4.Set对象：

>>>var set = new Set(); 创建对象,Set可以去重，类似java和javascript中的Set
- set.add('001'); set.add('001'); print(set) => {'001'}

>>>set.addAll(['001', '002', '001']).toList() => ['001', '002']

---------------------


## 5.??=赋值运算符：

- var a; a ??= 10; a => 10 ,如果a的值为空，会将值赋值给a，如果a的值存在，则a为原来的值：var a = 123; a ??= 10; a => 123

------------------

## 6.??运算符：

- var a; String b = a ?? 10; b => 10,如果a为空取值10，否则将a赋值给b

---------------

## 7.isEmpty():判断值是否为空 
## isNaN():判断值是否为NaN
## isEven(): 是否为偶数
## isOdd()：是否为奇数

------------------

## 8.数值常用处理方法

- abs()：绝对值
- round()：四舍五入
- floor()：向下取整
- ceil()：向上取整
- toInt()：转为int
- toDouble()：转为double

---------------------

## 9.is关键字：判断变量是什么类型

- var a = '测试'; print( a is String) => true

----------------------

## 10.自定义函数

>>>函数参数传递方式：可选参数，默认参数，命名参数，函数作为参数传递
- 可选参数：String fn(String name,[int age, String sex])：可选参数使用[]包裹
- 默认参数：String fn(String name, [int age=25, String sex])：默认参数也是使用[]包裹，定义时赋值
- 命名参数：String fn(String name, {int age, String sex = 'man'})：命名参数使用{}包裹，调用函数时不会有顺序问题，例如：fn('测试', age: 25)
- 函数当作参数传递：fn(fn1)，类似javascript的回掉函数

>>>函数类型：箭头函数，匿名函数（匿名函数自调），函数递归调用等
- 箭头函数：函数体只能写一行，var newList = list.map((value)=>return value*2;); var newList = list.map((value)=>{return value * 2;});
- 匿名函数：没有函数名，类似javascript的匿名函数，var fn = () {print('这是匿名函数')};
- 匿名函数自调：((n){print(n)})(123); => 123，类似javascript匿名函数自调
- 函数递归，与javascript基本一致

>>>函数闭包：与javascript基本一致

----------------------

## 11.Dart中的类：基于单继承的面向对象语言，所有对象都是类的实例，所有类都是Object的子类

>>>类的构造函数：
```Dart
    // 1.默认构造函数：类的构造函数和类名称一样，不同于ES6中的类
    class Person {
        String name;
        int age;
        Person(String name, int age){
            this.name = name;
            this.age = age;
        }
    }
    
    // 构造函数的简写形式，等价于上面的写法
    class Person {
        String name;
        int age;
        Person(this.name, this.age);
    }

    // 2.命名构造函数：可以有多个，类的实例化的时候调用
    class Person {
        String name;
        int age;
        Person(this.name, this.age);
        Person.setName(String newName) {
            this.name = newName;
        }
    }
    Person p = new Person('测试', 25);
    Person p = new Person.setName('命名构造函数');
```

>>>类的模块化：

- 使用 import 引用的方式实现模块化管理

>>>类的修饰符：
- Dart中没有private, public, protected修饰符，通过_value，实现方法或变量的私有化，附：只有在单独文件的单独类的私有方法，私有变量才能生效

```Dart
    // 必须放在单独方法中才能生效
    class Person {
        String _name;
        _run() {
            print('这是私有方法，可以使用公共方法访问，作为单独文件时，私有方法才能生效，才能不=不被子类或实例访问');
        }
        // 定义共有方法进行访问
        common() {
            this._run();
            print(this._name);
        }
    }
```

>>>Dart中的get set 属性

```Dart
    class Rect {
        int width;
        int height;

        Rect(this.width, this.height);
        get area {
            return this.width * this.height;
        }
        set areaHeight(value) {
            this.height = value;
        }
    }
    Rect r = new Rect(4,6);
    print(r.area); // => 24通过计算属性，打印出面积
    r.areaHeight = 4;
    print(r.area); // => 16
```

>>>Dart中的构造函数执行实例化之前进行赋值
```Dart
    class Rect {
        int width;
        int height;
        // Rect(this.width,this.height):width=6,height=6{} // 报错
        Rect():width=6,height=6{
            print('${this.width}------${this.height}');
        }
        area() {
            print('面积：${this.width*this.height}');
        }
    }
    Rect r = new Rect(); // 打印 6--------6
    r.area(); // 打印 面积：36
```

>>>Dart中的静态属性，静态方法：
- 静态属性方法，实例访问不到，需要类直接访问
- 常规方法可以访问静态属性、静态方法；
- 静态方法也可以访问静态属性、静态方法；
- 静态属性不能访问常规方法、常规属性；

```Dart
    class Person {
        static String name = '测试';
        int age = 25;

        static staticRun() {
            print('这是静态方法');
        }

        run() {
            print(name); // 常规方法访问静态属性，直接量方式
            staticRun(); // 直接访问静态方法
            print(this.age);
        }

        static runTest() {
            print(name); // 常规方法访问静态属性，直接量方式
            staticRun(); // 直接访问静态方法
            // print(this.age); // 无法访问常规属性
            // this.run(); // 无法访问常规方法
        }
    }
    // 通过类直接访问静态属性和方法
    Person.staticRun();
    Person.name;
```

>>>Dart中的对象操作符：
- ?：条件运算符 -- 新版本添加
- is：类型判断符
- as：类型转换符
- ..：级联操作符
```Dart
    class Person {
        String name = '测试';

        getName() {
            print(this.name);
        }
    }
    var p = new Person();
    p?.getName(); // 测试
    p?.testName(); // 没有testName方法也不会报错

    if (p is Person) {
        print('类型判断符成立');
    }

    (p as Person).getName(); // 测试   老版本如果不说明类型会报错

    p..name = '测试123'
     ..getName(); // 测试123
```

>>>Dart中类的继承
- 子类通过extends继承父类
- 如果父类使用构造函数进行初始化，子类继承父类时构造函数执行实例化之前进行父类构造函数传值赋值

```Dart
    // 继承案例1--使用父类与子类的构造函数
    class Person {
        String name;
        int age;
        int id;
        Person(this.name, this.age, this.id);
        run() {
            print('这是父类方法');
        }
    }

    class P extends Person {
        String sex;
        // 使用super()对父类进行构造函数变量赋值
        P(name, age, id, {String sex}): super(name,age, id);
        
        // 重写父类方法
        @override
        run() {
            print('这是子类的方法，重写了父类的方法');
        }
        work() {
            super.run(); // 子类直接调用父类的方法
            print(this.id); // 子类调用父类的属性
        }
    }
    P p1 = new P('测试', 25, 123, sex:'男');
    p1.work();
    p1.run();
    // 这是父类方法
    // 123
    // 这是子类的方法，重写了父类的方法


    // 继承2--使用子类的命名构造函数
    class Person {
        String name;
        int age;
        int id;
        Person.noName(this.name, this.age, this.id);
        run() {
            print('这是父类方法');
        }
    }

    class P extends Person {
        String sex;
        // 使用super()对父类进行构造函数变量赋值
        // 给匿名构造函数传参
        P(name, age, id, {String sex}): super.noName(name,age, id);
        
        // 重写父类方法
        @override
        run() {
            print('这是子类的方法，重写了父类的方法');
        }
        work() {
            super.run(); // 子类直接调用父类的方法
            print(this.id); // 子类调用父类的属性
        }
    }
    P p1 = new P('测试', 25, 123, sex:'男');
    p1.work();
    p1.run();
    // 这是父类方法
    // 123
    // 这是子类的方法，重写了父类的方法



    // 继承3--同时使用父类与子类的命名构造函数
    class Person {
        String name;
        int age;
        int id;
        Person.noName(this.name, this.age, this.id);
        run() {
            print('这是父类方法');
        }
    }

    class P extends Person {
        String sex;
        // 使用super()对父类进行构造函数变量赋值
        // 给匿名构造函数传参
        P.setName(name, age, id, [String sex]): super.noName(name,age, id);
        
        // 重写父类方法
        @override
        run() {
            print('这是子类的方法，重写了父类的方法');
        }
        work() {
            super.run(); // 子类直接调用父类的方法
            print(this.id); // 子类调用父类的属性
        }
    }
    P p1 = new P('测试', 25, 123, '男');
    p1.work();
    p1.run();
    // 这是父类方法
    // 123
    // 这是子类的方法，重写了父类的方法
```

>>>抽象类：通过关键字abstract实现
- 子类必须重写实现抽象类中的抽象方法，非抽象方法继承可以直接实例调用

```Dart
    abstract class Animate {
        eat();
        run() {
            print('这是抽象类中的普通方法');
        }
    }
    class Dog extends Animate {
        @overrid
        eat() {
            print('这是子类继承的抽象方法的重写');
        }
    }
    Dog dog = new Dog();
    dog.eat(); // 这是子类继承的抽象方法的重写
    dog.run(); // 这是抽象类中的普通方法
```

>>>Dart中的多态：父类定义一个方法不去实现，让子类分别去进行不同的实现就是多态

```Dart
    abstract class Animate {
        eat();
    }
    class Dog extends Animate {
        eat() {
            print('这是小狗');
        }
        run() {
            print('小狗');
        }
    }
    class Cat extends Animate {
        eat() {
            print('这是小猫');
        }
        run() {
            print('小猫');
        }
    }
    Animate dog = new Dog(); // dog实例只有eat方法(经过测试 run() 和 eat() 都有)
    Animate cat = new Cat(); // cat实例只有eat方法(经过测试 run() 和 eat() 都有)
```

>>>Dart中的接口：通过抽象类实现接口

```Dart
    abstract class DB {
        String url;
        add();
        delete();
        update();
    }
    
    class MySQL implements DB {
        @override
        String url;
        MySQL(this.url);
        @override
        add() {

        }
        @override
        delete() {

        }
        @override
        update() {

        }
    }
    class MongoDB implements DB {
        @override
        String url;
        MongoDB(this.url);
        @override
        add() {

        }
        @override
        delete() {

        }
        @override
        update() {

        }
    }
    MySQL mysql = new MySQL('127.0.0.1');
    MongoDB mongoDB = new MongoDB('127.0.0.1');
```

>>>mixins：类似多继承的实现，但不同于多继承

```Dart
    class Person {
        run() {
            print('Person');
        }
    }
    class A {
        printA() {
            print('A 类方法');
        }
        run() {
            print('a');
        }
    }
    class B {
        printB() {
            print('B 类方法');
        }
        run() {
            print('b');
        }
    }
    class C extends Person with A, B {

    }
    C c = new C();
    c.run(); // b  输出结果为排在最后一个类的方法的值
```

-------------------------

## 12.Dart中的泛型:

>>>泛型类似typescript中的泛型
```Dart
    class Person <T>{
        T test(T value) {
            return value;
        }
        void add(T value) {
            List list = new List<T>();
            list.add(value);
        }
    }
    Person p = new Person<String>();
    p.add('123');
```

>>>泛型接口
```Dart
    abstract class Cache<T> {
        setKeys(String key, T value);
        getKeys(String key, T value);
    }

    class Memory<T> implements Cache<T> {
        @override
        setKeys(String key, T value) {
            // TODO: implement setKeys
            return null;
        }

        @override
        getKeys(String key, T value) {
            // TODO: implement getKeys
            return null;
        }
    }

    class Files<T> implements Cache<T> {
        @override
        setKeys(String key, T value) {
            // TODO: implement setKeys
            return null;
        }

        @override
        getKeys(String key, T value) {
            // TODO: implement getKeys
            return null;
        }
    }
    Memory memory = new Memory<String>();
    memory.setKeys('key', '测试');
    Files files = new Files<Map>();
    files.setKeys('key', {'name': '测试'});
```

>>>Dart中库的引入
- 含有同名类的文件引入时，可以使用类似命名空间的方法
```Dart
    // A.dart
    class Person {
        run() {
            print('A类');
        }
    }
    // B.dart
    class Person {
        work() {
            print('B类');
        }
    }
// index.dart
import 'a.dart' as a;
import 'b.dart';

Person p = new Person();
a.Person p1 = new a.Person();
```

- 使用一个文件中的部分方法，使用show使用显示的方法，使用hide禁用指定方法
```Dart
    // test.dart
    run() {
        print('aaa');
    }
    work() {
        print('bbb');
    }
// index.dart
import 'test.dart' show run; // 只能使用run()方法
run(); // aaa

import 'test.dart' hide run; // 只能使用work方法
work(); // bbb
```

---------------

## 13.flutter公共路由方法
```dart
    onGenerateRoute: (RouteSettings: settings) {
        final String name = settings.name;
        final Function pageContentBuilder = this.routes[name];
        if (pageContentBuilder!=null) {
        if (settings.arguments !=null) {
            final Route route = MaterialPageRoute(
            builder: (context) =>
            pageContentBuilder(context, arguments:settings.arguments)
            );
            return route;
        } else {
            final Route: route=MaterialPageRoute(
            builder: (context)=>
                pageContentBuilder(context);
            );
        }
        }
  }
```