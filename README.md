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

