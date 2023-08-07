---
title: 小米MIUI疑似监听
---

# 转自知乎<https://zhuanlan.zhihu.com/p/647710718>

## [小米MIUI系统组件监听用户隐私](https://zhuanlan.zhihu.com/p/647710718)



[![CAL1C0](https://pica.zhimg.com/50/v2-6c021fb35f20273dacb79c24ec62f893_l.jpg?source=b6762063)](https://www.zhihu.com/people/net-graph-1)

[CAL1C0](https://www.zhihu.com/people/net-graph-1)

t.me/moyunvzhuang 某人小号¹⁴。

1,266 人赞同了该文章

**​01开门见山**

近日，酷安论坛的用户MinaMichita发现MIUI 14内置了AntiDefraud功能，会不断向小米服务器上传用户已安装的应用列表。

![](https://pic2.zhimg.com/v2-a73381a6fb61e7b11db18d5679e6b18b_b.jpg)

原文地址： [https://www.coolapk.com/feed/42944139](https://link.zhihu.com/?target=https%3A//www.coolapk.com/feed/42944139)

**文章底部附上三种解决方案。**

**该文有部分细节引发争议，于2023年02月05日18:14分更新：**

**来源一：酷安论坛用户syn123**

原文链接：[https://www.coolapk1s.com/feed/43029791](https://link.zhihu.com/?target=https%3A//www.coolapk1s.com/feed/43029791)

4.用户MinaMichita发布动态声称自Miui开始，MIUI安全组件会在未询问用户的情况下，将设备上的已安装应用列表等信息上传至小米的服务器。并开发了AntiAntiDefraud插件用于拦截上传行为。同时用户TigerBeanst在评论区中指出，小米并没有未经用户同意就上传应用列表等行为，在用户首次开机时必须同意的隐私政策中就已经提醒用户会收集这些信息。

5.用户向晚今天吃了咩发布动态声称MIUI的应用包安装程序在关闭了所有安全检查的情况下仍会上传安装包信息。

**来源二：神秘代码[ZGQincLiqun/2604]**

备注1：EU 版在官改里属于“波兰版”，真正的欧版是Global EEA。

备注2：制作屏蔽反诈组件Xposed模块的作者也是MIUI EU本地化补丁包的作者。

笔者总结：MIUI系统内置某反诈中心组件引发争议，似乎为不实消息，而内置其他安全组件是事实。还有，MIUI系统分国产版和国际版，部分搞机玩家指出，某些国产版本似乎已从硬件上做了某些限制，刷机无法刷成国际版的系统。

**2023年05月12日17:42分更新：**

据可靠消息称，VIVO和IQOO手机已将国家反诈中心接入其OriginOS浏览器中。

用户可以在手机浏览器-设置-安全中心中查看相关信息。

---

**02偷梁换柱**

关于隐私保护

A国：数据上交给国家。

B国：防止个人信息被政府和私有企业滥用。

---

**03凿壁偷光**

**估计三言两语难以服众，那我们再来看看酷安另外一位大佬在今年春节时对MIUI安全组件的分析报告。**

**下面是文章原文，已经过笔者排版整理。**

**作者ID： cesky667**

**typedef16大佬在21年指出MIUI安全组件使用的腾讯天御组件会监视用户行为，**

**到目前为止似乎还没有人查证过，春节在家闲来无事，所以我来分析一下这个组件。**

![](https://pic3.zhimg.com/v2-ecfc4238c6c89503f786a5c23c873172_b.jpg)

**首先，QQ同样使用了腾讯天御安全组件，所以也会生成.tmfs

turing.dat，准确来说，所有使用相关腾讯安全组件的都会生成这些文件，仅作为标识符识别用户，并无其他作用，而在旧版存储空间隔离中，创建/打开文件
 记录不准确，导致一些系统组件也显示创建该文件，例如： 垃圾清理。**

**环境：**

**MIUI13.0.6 EU版**

**MIUI安全组件版本1.3.8**

**包名： com.miui.guardprovider(该应用在MIUI EU欧洲版中仍然保留)**

![](https://pica.zhimg.com/v2-1a483ee23b2bd7f9254e73a0e9e2c464_b.jpg)

**查看app组件 可以发现确实使用了天御组件**

![](https://pic2.zhimg.com/v2-b02b62e9b64a3c41ba1113a1d0d5ebbb_b.jpg)

**data目录文件如下：**

![](https://pic2.zhimg.com/v2-476dec7ba04881e73510f8a07c0b6371_b.jpg)

![](https://pic4.zhimg.com/v2-6d5cad2ec1a4ae26da5a3939be484b19_b.jpg)

**有趣的是，在databases文件夹里一个riskscan开头的文件里找到了这样一段话，**

**而下面则是一些app包名，大多是一些Xposed模块，推断这些应该是风险扫描app结果。**

![](https://picx.zhimg.com/v2-d9546905f414c41e6caf1954afe4f175_b.jpg)

**对MIUI安全组件进行抓包，发现每次开关WiFi都连接一个位于广东的IDC机房，**

**第一条是保活，第二条内容经过加密，受限于本人技术水平暂时无法解密。**

![](https://pic3.zhimg.com/v2-1456a921d8e076fd32cb0c0c12ad43f6_b.jpg)

![](https://pic3.zhimg.com/v2-f693dc5d89ae509becb0df2cd7530f6e_b.jpg)

**这个IP开放了不少端口，仅有8002端口为tcp协议**

**[由于作者上传长图，且较为模糊]** **因此笔者在这里提供PC端的微步情报截图。**

![](https://pic4.zhimg.com/v2-a3c396ae9d0ead423e6a681f0611ebe5_b.jpg)

![](https://pic4.zhimg.com/v2-5d9277c9586001fdbe5d4347620de1cb_b.jpg)

![](https://pic2.zhimg.com/v2-a79178b606086592909cde130a240ca5_b.jpg)

**在应用商店里下了一个某中心，查询库文件如图，使用了腾讯乐固。**

![](https://picx.zhimg.com/v2-9cf37d1e105b8bf2148b04652a883dcb_b.jpg)

![](https://pic3.zhimg.com/v2-45b8001902782794a86bf47f913c2882_b.jpg)

![](https://picx.zhimg.com/v2-b7b4d74940695a1cc8df2b89a2218557_b.jpg)

**两个库都指向了同一个腾讯安全产品，而这是产品页的描述，细品一下令人后背发凉。**

**[由于作者上传长图，且较为模糊]** **因此笔者在不影响原文内容的情况下， 再次提供PC网页的截图。**

![](https://pic2.zhimg.com/v2-728653bdfc01769b79ba1174c7e54eb9_b.jpg)

![](https://pic3.zhimg.com/v2-6cadf469815cab1e950a168c60c5cb46_b.jpg)

**已证实的内容：**

**会扫描应用列表并上报，与手机管家病毒扫描有关，采用与某中心app一致的腾讯安全组件。**

**作为普通搞机用户能做什么？**

**1.使用安装狮 r安装组件替代MIUI安装器**

**2.冻结MIUI安全组件(不是安卓包管理器 这个冻了卡第一屏)**

**3.不要点击手机管家病毒扫描！ ！**

**4.关闭qq的读取应用列表权限或者用hide my app list对qq开启白名单 仅获取系统应用**

**希望诸位安装修改版app的时候，不要出现被请喝茶的悲剧捂脸。**

**业余菜只因geek，技术水平实属有限，希望有兴趣的大佬能对MIUI安全组件逆向分析。**

**文件： MIUI安全组件_1.3.8.apk**  

**下载地址：** **[https://www.123pan.com/s/ZTfrVv-ArRP3](https://link.zhihu.com/?target=https%3A//www.123pan.com/s/ZTfrVv-ArRP3)**

**文章仅供参考，若有误还望评论区指正**

**我们终将在没有黑暗的地方相见。**

原文地址： [https://www.coolapk.com/feed/42719865](https://link.zhihu.com/?target=https%3A//www.coolapk.com/feed/42719865)

---

**04声名远扬**

**据悉，该组件名为腾讯天御，在中国大陆版和海外版本的MIUI系统中均存在该组件。 另外，QQ、华为安全中心、vivo部分应用中也使用了同样或类似的安全组件。 另有网友表示，该组件至少可以追溯到MIUI12.5版本的系统。**

![](https://pic3.zhimg.com/v2-f85532ca9256f255eb656cf010b245fc_b.jpg)

![](https://picx.zhimg.com/v2-6dc8409b7846603153c960f102a4c49f_b.jpg)

**“你说隐私我都觉得有点好笑”**  

**由此得知，腾讯天御模块主要是在后台分析手机内置APP、记录设备UUID，并且回传到中国广东IDC机房。**

**另外，评论区多名酷安网友回帖称，使用MIUI系统安装软件被警察传讯。**

---

**05白壁三献**

**三种解决方案，欢迎参考。**

**第一种**安装屏蔽模块！

![](https://pic3.zhimg.com/v2-c5fc18163774fbecf5b4b54e5b867b3e_b.jpg)

**也就是文章前言所提到的，用于屏蔽MIUI安全组件的Xposed模块。**

**模块项目地址：**[https://github.com/MinaMichita/AntiAntiDefraud/](https://link.zhihu.com/?target=https%3A//github.com/MinaMichita/AntiAntiDefraud/)

**第二种**ADB模式卸载模块！

![](https://pic1.zhimg.com/v2-e8c3ff5d902e4b5f42d0f2ff1f5bc598_b.jpg)

adb shell pm list package | grep com.miui.guardprovider

adb uninstall --user 0 com.miui.guardprovider

**如果有分身系统需要查看一下设备用户资料ID：**adb shell pm list users

**第三种**DNS/HOST屏蔽模块！

![](https://pic1.zhimg.com/v2-e571b03c98d49c37494e1be9c47ebc6e_b.jpg)

**经过本频道[神秘代码:DNSPOTD]的流量分析：确定了后台扫描及病毒库由 腾讯安天/AVL 组件提供，通过实现DNS上游屏蔽可以暂时无效化该功能［当前只针对于小米品牌手机］此操作无需你对手机系统文件进行任何更改。**

**注意： 本频道并未确定该组件一定上传数据到某某反诈数据中心服务器中，**

**以下只是针对于扫描功能以及应用包安装功能检测的屏蔽。**

**屏蔽列表：**

[http://miav-cse.avlyun.com](https://link.zhihu.com/?target=http%3A//miav-cse.avlyun.com)［腾讯/安天］

[http://a0.app.xiaomi.com](https://link.zhihu.com/?target=http%3A//a0.app.xiaomi.com)［小米跟踪API］

[http://miui-fxcse.avlyun.com](https://link.zhihu.com/?target=http%3A//miui-fxcse.avlyun.com)［腾讯/安天］

[http://api.installer.xiaomi.com](https://link.zhihu.com/?target=http%3A//api.installer.xiaomi.com)［应用包扫描API］

其他完整列表：[https://raw.githubusercontent.com/LoopDns/Fuck-you-MIUI/main/MIhosts](https://link.zhihu.com/?target=https%3A//raw.githubusercontent.com/LoopDns/Fuck-you-MIUI/main/MIhosts)

```c
#此处主要屏蔽小米云扫描组件
0.0.0.0 log.avlyun.sec.intl.miui.com
0.0.0.0 update.avlyun.sec.miui.com
0.0.0.0 ixav-cse.avlyun.com
0.0.0.0 logupdate.avlyun.sec.miui.com
0.0.0.0 miui-fxcse.avlyun.com
0.0.0.0 sdkconf.avlyun.com
0.0.0.0 sdkconf.avlyun.com
0.0.0.0 miav-cse.avlyun.com
0.0.0.0 miav-cse.avlyun.com
0.0.0.0 api.installer.xiaomi.com
0.0.0.0 tmfsdk.m.qq.com
0.0.0.0 a0.app.xiaomi.com
#屏蔽后无法矫正流量，但是也用来下载白名单
#0.0.0.0 api.sec.miui.com
0.0.0.0 adv.sec.miui.com
0.0.0.0 xlmc.sec.miui.com
#禁用后将无法云扫描病毒
127.0.0.1 etl-xlmc-ssl.sandai.net
127.0.0.1 cn.app.chat.xiaomi.net
#疑似云盘，自行决定
#127.0.0.1 pdc.micloud.xiaomi.net
127.0.0.1 a.hl.mi.com
#禁用后可能会导致小米浏览器无法下载APK，因为有垃圾推广安装
127.0.0.1 idm.api.io.mi.com
127.0.0.1 api.jr.mi.com
127.0.0.1 ssl-cdn.static.browser.mi-img.com
127.0.0.1 flash.sec.miui.com
```

**注意： 该操作可能会导致小米安全中心等一系列应用产生不可知的使用风险，**

**包括但不限于部分软件的云设置、同步失效等一系列问题。**

**致谢： 以上解决方案来自互联网收集。**

---

**06恍然大悟**

**其实早在两个多月前，笔者在某交流群里就和群友们讨论过关于小米手机管家内置国家反诈中心APP扫描模块的相关话题。当时我还说，想要纯净的系统可以自己下载国际版的rom包进行刷机，想着国际版的应该轮不到那些人管，但是万万没想到，人在屋檐下不得不低头。**

**该文由苏雅图整理发布，素材均来自互联网。**

[小米MIUI系统组件监听用户隐私 - 苏雅图 - 博客园](https://link.zhihu.com/?target=https%3A//www.cnblogs.com/arrdres/p/17091764.html)
