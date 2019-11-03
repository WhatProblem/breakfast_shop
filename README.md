# breakfast_shop

### 开发背景
前段时间公司开发移动混合应用,开始选型mui,性能体验成了大问题，毕竟原生成本较高，只能将就，后期用户反映体验太差(我们也知道差，但是没法啊)，不得不重新选型，接着flutter来了，ios与android两个平台基本一致，与原生相比基本没他大差别，自己制作了一个小demo方便我们这群新手学习，复习使用~~~

项目效果如下（动图较大，在aseets文件夹内部）
![image](https://github.com/WhatProblem/breakfast_shop/blob/master/assets/1.jpg)
![image](https://github.com/WhatProblem/breakfast_shop/blob/master/assets/2.jpg)
![image](https://github.com/WhatProblem/breakfast_shop/blob/master/assets/3.jpg)
![image](https://github.com/WhatProblem/breakfast_shop/blob/master/assets/4.jpg)
![image](https://github.com/WhatProblem/breakfast_shop/blob/master/assets/5.jpg)
![image](https://github.com/WhatProblem/breakfast_shop/blob/master/assets/6.jpg)
![image](https://github.com/WhatProblem/breakfast_shop/blob/master/assets/7.jpg)
![image](https://github.com/WhatProblem/breakfast_shop/blob/master/assets/8.jpg)
![image](https://github.com/WhatProblem/breakfast_shop/blob/master/assets/9.jpg)

+ 项目中目前使用插件如下（目前都是静态数据后续会使用http请求的插件）
 - flutter_swiper
 - flutter_custom_clippers
 - cached_network_image
 - provider
 - font_awesome_flutter
 - flutter_screenutil
 - shimmer

flutter目前掌握程度有待于提高，项目功能后期会陆续补全  

附[dart基础语法总结文档](https://github.com/WhatProblem/breakfast_shop/blob/master/dart.md)

### 项目目录结构
```json
├─main.dart
│  
├─config
│      network_image.dart
│      
├─icons
│      icons.dart
│      
├─mock
│      mock.dart
│      
├─provider
│      fav_provider.dart
│      init_model_provider.dart
│      order_provider.dart
│      scroll_provider.dart
│      
└─view
    │  index_page.dart
    │  
    ├─cart
    │      cart.dart
    │      
    ├─detail
    │      detail.dart
    │      
    ├─home
    │      animate_bar.dart
    │      home.dart
    │      
    ├─profile
    │      fav_page.dart
    │      profile.dart
    │      
    ├─search
    │      search_page.dart
    │      
    └─sort
            sort.dart
            

```
