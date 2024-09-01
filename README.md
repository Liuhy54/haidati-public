# 海答题 - AI 答题应用平台

> 作者：[Liuhy](https://github.com/liyupi/)
>
>



## 项目简介

### 项目介绍

深入业务场景的企业级实战项目，基于 Vue 3 + Spring Boot + Redis + ChatGLM AI + RxJava + SSE 的 **AI 答题应用平台。**

用户可以基于 AI 快速制作并发布多种答题应用，支持检索和分享应用、在线答题并基于评分算法或 AI 得到回答总结；管理员可以审核应用、集中管理整站内容，并进行统计分析。



### 项目展示

本项目涉及 10 多个页面，前面已经展示部分页面。

应用详情页：

![](https://pic.yupi.icu/1/20240604145229915.png)

用户答题页面：

![](https://pic.yupi.icu/1/20240604145230156.png)

创建应用页：

![](https://pic.yupi.icu/1/20240604145230361.png)

创建题目页，涉及复杂动态嵌套表单的开发：

![](https://pic.yupi.icu/1/20240604145230557.png)

应用管理页面：

![](https://pic.yupi.icu/1/20240604145230731.png)

统计分析页面：

![](https://pic.yupi.icu/1/20240604145230905.png)

应用分享功能：

![](https://pic.yupi.icu/1/20240604145231269.png)






### 项目收获

- 如何拆解复杂业务，从 0 开始设计实现系统
- 如何快速开发小程序、响应式网站和后端项目
- 如何自己制作一套 Vue 3 万用前端模板
- 如何巧用 JSON 实现复杂评分策略
- 如何巧妙利用设计模式来优化代码
- 如何利用 AI 工具提高开发效率
- 如何利用 SSE 技术实时推送通知？
- 如何利用 Redis + Caffeine + 分布式锁实现稳定高效的缓存
- 如何通过 RxJava 反应式编程 + 分库分表提升服务性能
- 如何通过幂等设计、线程池隔离提升系统安全稳定性

此外，还能学会很多思考问题、对比方案、产品设计的方法，提升排查问题、自主解决 Bug、产品理解的能力，成为一个项目负责人。




## 架构设计

### 1、核心业务流程图

![](https://pic.yupi.icu/1/20240604145232082.png)

### 2、时序图

![](https://pic.yupi.icu/1/20240604145232239.png)

### 3、架构设计图

![](https://pic.yupi.icu/1/20240604145232474.png)



## 技术选型

### 后端

- 存储层：MySQL 数据库 + Redis 缓存 + 腾讯云 COS 对象存储
- MyBatis-Plus 及 MyBatis X 自动生成
- Redisson 分布式锁
- Caffeine 本地缓存
- 基于 ChatGLM 大模型的通用 AI 能力
- RxJava 响应式框架 + 线程池隔离实战
- SSE 服务端推送
- Shardingsphere 分库分表
- 幂等设计 + 分布式 ID 雪花算法
- 多种设计模式
- 多角度项目优化：性能、稳定性、成本优化、产品优化等



### 前端

#### Web 网页开发

- Vue 3
- Vue-CLI 脚手架
- Axios 请求库
- Arco Design 组件库
- 前端工程化：ESLint + Prettier + TypeScript
- 富文本编辑器
- QRCode.js 二维码生成
- Pinia 状态管理
- OpenAPI 前端代码生成

#### 小程序开发

- React
- Taro 跨端开发框架
- Taro UI 组件库

### 开发工具

- 前端 IDE：JetBrains WebStorm
- 后端 IDE：JetBrains IDEA

"# haidati-public" 
