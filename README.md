## 一 项目演示

视频演示

<video width="640" height="360" controls>
    <source src="./video/wanandroidhm.mp4" type="video/mp4" /> 
</video></br>

B站链接：[https://www.bilibili.com/video/BV1Ku4y1w7St](https://www.bilibili.com/video/BV1Ku4y1w7St)

项目预览

| ![][waz-hm-1] | ![][waz-hm-2]  | ![][waz-hm-3]  | ![][waz-hm-4]  |
| :-----------: | :------------: | :------------: | :------------: |
| ![][waz-hm-5] | ![][waz-hm-6]  | ![][waz-hm-7]  | ![][waz-hm-8]  |
| ![][waz-hm-9] | ![][waz-hm-10] | ![][waz-hm-11] | ![][waz-hm-12] |
| ![][waz-hm-13]| ![][waz-hm-14] |![][waz-hm-15]  | ![][waz-hm-16] |


## 二 开发环境

* 操作系统：Windows 11 专业版 22H2
* 开发工具：DevEco Studio 4.0 Release版本
* 开发语言：ArkTS
* node.js：v16.20.1
* ohpm:1.2.5

## 三 基础知识

* ArkTS语法(基本语法、状态管理、渲染控制)
* UI(ArkTS声明式开发)及预览
* HTTP数据请求

## 四 开发进度

### 4.1 v1.0

* 启动页+底部导航框架
* 底部导航框架使用：Tabs+tabBar
* 在entryability/EntryAbility.ts的windowStage.loadContent中表明启动显示页面
* 在resources/base/profile/main_pages.json添加Pages页面

### 4.2 v2.0

* 网络请求框架(HttpService(网络请求封装)+ResponseResult(返回结果)+HttpRequest(网络请求Promise)+HttpConfig(相关配置))
* Stage模型，在module.json5配置文件中声明权限(比如网络权限`ohos.permission.INTERNET`)
* bean包将接口返回结果封装成数据Bean
* viewmodel中Promise+async解析结果数据为Bean
* Page页面aboutToAppear(页面即将显示)方法中调用viewmodel中的接口

### 4.3 v3.0

* 使用UI容器(Scroll、Row、Column、List)和常用组件Text、Image搭建UI界面
* 自定义组件用于List-ListItem使用
* Swiper实现轮播图
* @State实现数据变化监听
* 样式文件实现复杂布局
* Resource：color-颜色命名文字不能大写，float-fp后缀对应文字，vp后缀对应宽度长度

### 4.4 v4.0

* ForEach循环生成多组件
* ListItemGroup分组列表组件
* Flex弹性布局组件
* 导航页面

### 4.5 v5.0

* Tabs+ForEach(TabContent(TreeList-数据列表)+tabBar)组件展示各Tab标题下对应的列表
* `@Watch装饰器`：状态变量更改通知。@Watch('changeTab')中声明changeTab方法
* `@Link装饰器`：父子双向同步。@Link currentIndex: number中父组件ProjectPage传递当前tabIndex给ProjectList用于展示列表数据
* 项目界面

### 4.6 v6.0

1- 布局

* 消息
* 我的
* 登录、注册
* 设置
* 导航-知识体系下的文章
* WebView显示网页内容

2-技术点

* Preferences、PersistentStorage保存永久性数据
* 组件：GridRow、GridCol、webview等
* 页面间转场动画：pageTransition
* 登录和注册成功后，保存cookie到PersistentStorage中，再次请求时，从AppStorage中获取cookie
* 页面间导航：
  - 1-router(router.pushUrl({url: 'pages/Detail',urlparams: paramsInfo})；
  - 2-Navigator({ target:url, type: NavigationType.Push }) {}.params({key:value}
* 参数获取
  - const params = router.getParams(); // 获取传递过来的参数对象
  - const id = params['id']; // 获取id属性的值

### 4.7 v7.0(版本升级)
* OpenHarmony 3.1.1 Release 升级到OpenHarmony 4.0 Release
* hvigor中hvigorVersion从2.4.2升级到3.0.9

### 4.8 v8.0
* 导入下拉刷新库@ohos/pulltorefresh (V2.0.1)——说明，最新版本适配api10，不适用于当前项目
* home页面添加下拉刷新和上拉加载功能

### 4.9 v9.0

* 项目/导航 页添加刷新和加载更多功能
* 去掉module.json5中为了预览添加的@Entry装饰器

### 4.10 v10.0

* 我的-积分，跳转积分页面
* 我的-排行，跳转排行页面

### 4.11 v11.0
* api9升级到api10
* api升级过程中出现的问题及解决办法

```
1. 'params' is possibly 'undefined'. \<ArkTSCheck>
2. Not all code paths return a value. \<ArkTSCheck>
3. Use explicit types instead of "any", "unknown" (arkts-no-any-unknown)
4. Argument of type 'Tag[]' is not assignable to parameter of type 'string'.
5. Object literal must correspond to some explicitly declared class or interface (arkts-no-untyped-obj-literals)
6. Array literals must contain elements of only inferrable types (arkts-no-noninferrable-arr-literals) \<ArkTSCheck>
7. Type 'null' is not assignable to type 'UserData'. \<ArkTSCheck>
8. try catch报错
9. 传值null问题
```

### v4.12 v12.0 (2025.10.30)

* sdk由4.0.0(api 10) 升级到 6.0.0(api 20)
* 借助CodeGenie进行版本升级

<!--hm-waz-->

[waz-hm-1]:https://jsd.onmicrosoft.cn/gh/PGzxc/CDN/blog-resume/waz-hm-splash-0.png
[waz-hm-2]:https://jsd.onmicrosoft.cn/gh/PGzxc/CDN/blog-resume/waz-hm-home-1.png
[waz-hm-3]:https://jsd.onmicrosoft.cn/gh/PGzxc/CDN/blog-resume/waz-hm-nav-2.png
[waz-hm-4]:https://jsd.onmicrosoft.cn/gh/PGzxc/CDN/blog-resume/waz-hm-navlist-3.png
[waz-hm-5]:https://jsd.onmicrosoft.cn/gh/PGzxc/CDN/blog-resume/waz-hm-project-4.png
[waz-hm-6]:https://jsd.onmicrosoft.cn/gh/PGzxc/CDN/blog-resume/waz-hm-msg-5.png
[waz-hm-7]:https://jsd.onmicrosoft.cn/gh/PGzxc/CDN/blog-resume/waz-hm-msg-6.png
[waz-hm-8]:https://jsd.onmicrosoft.cn/gh/PGzxc/CDN/blog-resume/waz-hm-me-7.png
[waz-hm-9]:https://jsd.onmicrosoft.cn/gh/PGzxc/CDN/blog-resume/waz-hm-me-8.png
[waz-hm-10]:https://jsd.onmicrosoft.cn/gh/PGzxc/CDN/blog-resume/waz-hm-login-9.png
[waz-hm-11]:https://jsd.onmicrosoft.cn/gh/PGzxc/CDN/blog-resume/waz-hm-register-10.png
[waz-hm-12]:https://jsd.onmicrosoft.cn/gh/PGzxc/CDN/blog-resume/waz-hm-me-set-11.png
[waz-hm-13]:https://jsd.onmicrosoft.cn/gh/PGzxc/CDN/blog-resume/waz-hm-home-refresh-12.png
[waz-hm-14]:https://jsd.onmicrosoft.cn/gh/PGzxc/CDN/blog-resume/waz-hm-home-loadmore-13.png
[waz-hm-15]:https://jsd.onmicrosoft.cn/gh/PGzxc/CDN/blog-resume/waz-hm-rank-14.png
[waz-hm-16]:https://jsd.onmicrosoft.cn/gh/PGzxc/CDN/blog-resume/waz-hm-coin-15.png