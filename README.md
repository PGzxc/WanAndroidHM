## 一 开发环境

* 操作系统：Windows 11 专业版 22H2
* 开发工具：DevEco Studio 3.1.1 Release版本
* 开发语言：ArkTS
* node.js：v16.19.1

## 二 基础知识

* ArkTS语法(基本语法、状态管理、渲染控制)
* UI(ArkTS声明式开发)及预览
* HTTP数据请求

## 三 开发进度

### 3.1 v1.0

* 启动页+底部导航框架
* 底部导航框架使用：Tabs+tabBar
* 在entryability/EntryAbility.ts的windowStage.loadContent中表明启动显示页面
* 在resources/base/profile/main_pages.json添加Pages页面

### 3.2 v2.0

* 网络请求框架(HttpService(网络请求封装)+ResponseResult(返回结果)+HttpRequest(网络请求Promise)+HttpConfig(相关配置))
* Stage模型，在module.json5配置文件中声明权限(比如网络权限`ohos.permission.INTERNET`)
* bean包将接口返回结果封装成数据Bean
* viewmodel中Promise+async解析结果数据为Bean
* Page页面aboutToAppear(页面即将显示)方法中调用viewmodel中的接口

### 3.3 v3.0

* 使用UI容器(Scroll、Row、Column、List)和常用组件Text、Image搭建UI界面
* 自定义组件用于List-ListItem使用
* Swiper实现轮播图
* @State实现数据变化监听
* 样式文件实现复杂布局
* Resource：color-颜色命名文字不能大写，float-fp后缀对应文字，vp后缀对应宽度长度

### 3.4 v4.0

* ForEach循环生成多组件
* ListItemGroup分组列表组件
* Flex弹性布局组件
* 导航页面

### 3.5 v5.0

* Tabs+ForEach(TabContent(TreeList-数据列表)+tabBar)组件展示各Tab标题下对应的列表
* `@Watch装饰器`：状态变量更改通知。@Watch('changeTab')中声明changeTab方法
* `@Link装饰器`：父子双向同步。@Link currentIndex: number中父组件ProjectPage传递当前tabIndex给ProjectList用于展示列表数据
* 项目界面

### 3.6 v6.0

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