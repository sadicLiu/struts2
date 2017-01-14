## Struts2的一些有用的配置文件：
- `struts2-core.jar/struts-default.xml`
- `struts2-core.jar/struts-2.5.dtd`
- `struts2-core.jar/org.apache.struts2/default.properties`

## Index

## struts2_0100_Introduction
- 在struts2自带的例子程序中复制`struts.xml`、`web.xml`，运行第一个Hello World程序
- `<constant name="struts.devMode" value="true" />`开发者模式
- `http://localhost:8080/struts2_0100_Introduction/hello.action` (.action可省略)  
流程：当客户端浏览器发出此请求时，服务器首先读取`web.xml`配置文件，发现里面配置的struts2过滤器会过滤所有url，于是转到`struts.xml`，此url的namespace为/，则struts找到对应的包，此action为hello，则struts找到对应的action，在此action中，找到result标签中的`Hello.jsp`，于是转到此页面

## Struts2_0200_Namespace
- package与java的package起到同样的作用——避免重名（利用其name属性）
- package中namespace的作用就是在url中对应的那个路径
- result 默认`name="success"`

## Struts2_0300_Action
- 自定义action的三种方法
- 自己用的方法：`extends ActionSupport`

## Struts2_0400_Path
- struts2中的路径问题是根据action的路径而不是jsp路径来确定，所以尽量不要使用相对路径。
- 使用相对路径的两种方法：base标签或myeclipse中的`basePath`

## Struts2_0500_ActionMethod
- 可以在配置文件中配置Action的时候用`method=`来指定执行哪个方法
- 也可以在url地址中动态指定:`actionName!methodName`
- 前者会产生太多的action(配置文件中)，所以不推荐使用
- `<constant name="struts.enable.DynamicMethodInvocation" value="true" />`开启动态方法调用

## Struts2_0600_ActionWildcard
- 使用通配符 ` * ` 、`{1}` 可以简化配置
- 约定优于配置

## Struts2_0700_ActionAttrParamInput
- 给action传递参数：在对应的action中设置成员变量，并生成getter、setter，struts会自动赋值

## Struts2_0800_DomainModelParamInput
- 使用Domain Model传递参数
- 也可以使用VO（DO、DTO）先把参数传到action中，再根据这个对象构造出对应的领域对象

## Struts2_0900_ModelDrivenParamInput
- 在Action中实现`ModelDriven<T>`接口之后，在传递领域对象的参数时可以直接传递，struts会自动生成领域对象

## Struts2_1000_CharacterEncoding
- 这个demo在当前版本的struts2已经没有意义了，当时的bug已经解决
- 根据个人经验，你只要在所有地方统一编码，就不会出现乱码问题

## Struts2_1100_DataValidation&Error
- 在action中使用`addFieldError`方法可以将错误信息添加到值栈中
- struts标签库的使用
- `<s:fieldError>`标签的使用（带格式）
- `<s:debug>` 结合 `<s:property>` 获取值栈中的值，可以拿到不带格式的错误信息

## Struts2_1200_AccessWebElements
- 在action中获得Map类型的`request`、`session`、`application`（LoginAction1）
- 推荐使用的获取WebElements的方式：
实现`RequestAware`、`SessionAware`、`ApplicationAware`接口，并实现`set`方法。
这种方法的思想是IoC（控制反转），本应该由程序员完成的操作直接交给了struts去完成。
- 获取`HttpRequest`、`HttpSession`、`ServletContext`的两种方法

## Struts2_1300_IncludeModules
- 可以使用`<include file=”login.xml”/>`标签将struts配置文件分解成多个模块

## Struts2_1400_DefaultAction
- `<default-action-ref name="index"></default-action-ref>`
	用这个标签来设置默认的action

## Struts2_1500_ResultType
- `<result type="dispatcher | redirect | chain | redirectAction"`

##  Struts2_1600_GlobalResult
- `<global-results>`标签的使用
- 可以使用package中的extends属性继承其他package的配置

## Struts2_1700_DynamicResult
- `<result>${r}</result>`可以使用这种方式来引用action中的成员变量

## Struts2_1800_ResultWithParams
- 当时用redirect的方式时，可以向result中传递action的参数：
	`<result type="redirect">/user_success.jsp?t=${type}</result>`

## Struts2_1900_OGNL
- ognl的各种用法

## Struts2_2000_StrutsTags
- struts中的标签库

## Struts2_2100_Theme_1
- 在`struts.xml`中控制theme，默认为xhtml，可以设置为：`simple/css_html/ajax`

## Struts2_2100_Theme_2
- 用css去掉struts2中`fieldError`标签的格式

## Struts2_2100_Theme_3
- 通过覆盖struts2自带的格式文件来去掉`fieldError`的格式

## Struts2_2100_Theme_4
- 定义自己的template

***
> 下面5个demo是一个BBS的小项目，通过这个项目来介绍struts2的一些知识点

## struts2_0300_BBS_01_Frame
- struts 2.5之后在`<package>`中加了一个`strict-method-invocation`属性，只有把它设成false才可以使用通配符的方式调用方法
- 这个项目主要是把bbs的框架搭起来
- 建立数据库

## struts2_0300_BBS_02_Service
- 完成`CategoryService`层的功能
- 一定要注意，在参数化查询的时候 ？ 如果用中文字符会报错

## struts2_0300_BBS_03_Combine
- 将Action层与Service层联合起来

## struts2_0300_BBS_04_ExceptionHandling
- 声明式异常处理：  
所有异常直接抛出，然后在struts2的配置文件中进行处理
- 配置
```
<global-results>
      <result name="error">/error.jsp</result>
</global-results>
<global-exception-mappings>
      <exception-mapping result="error" exception="java.lang.Exception">
            /error.jsp
      </exception-mapping>
</global-exception-mappings
```

## struts2_3000_BBS_05_I18N
- Action级别和package级别的国际化几乎用不
- 应用级别的国际化：
  1. 先在src目录下建立资源文件
  1. 然后在struts配置文件中指明资源文件名：
  1. `<constant name="struts.custom.i18n.resources" value="bbs"></constant>`
  1. 最后通过Action转到相应页面，在页面中调用ActionSupport提供的getText（）方法即可:
    ```
    <s:property value="getText(\"login.username\")" /><input type="text"><br>
    ```
- 也可以用动态指定参数的方式获取国际化内容：
  1. `welcome.msg=welcome{0}``

  1. -
  ```
    <s:text name="welcome.msg">
        <s:param value="username" />
    </s:text>
  ```
- 动态语言切换
LanguageAction + login.jsp中的<a>标签  
`<a href="admin/language?request_locale=en_US">en</a>`

***
> BBS的demo结束，下面这几个demo相对来说不太重要

## struts2_3300_interceptor
- 这个项目是用来读Struts2的filter源码的

## struts2_3400_interceptor_simulation
- 这个项目是用来模拟struts2中拦截器的调用过程的

## struts2_3500_my_interceptor
- 自定义拦截器

## struts2_3600_token_interceptor
- 防止表单重复提交的token拦截器

## struts2_3700_type_conversion
- 介绍struts中自动完成的类型转换
- 自定义类型转换器
