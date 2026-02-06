---
title: 开源cloud-dicom-downloader-ex云胶片下载器使用说明
abbrlink: 34688
date: 2026-02-06 16:43:17
tags:
---


### 开源cloud-dicom-downloader-ex云胶片下载器使用说明

#### 一、下载exe可执行文件
下载地址(国内加速)：[GitHub](https://hk.gh-proxy.org/https://github.com/dandll/cloud-dicom-downloader-ex/releases/download/Release/Dicom.exe)
下载地址(国内)：[Gitee](https://foruda.gitee.com/attach_file/1770365250268418608/dicom%E4%B8%8B%E8%BD%BD%E5%99%A8.exe?token=f2cfd429ffd3f8d6e64b9c08a8a392de&ts=1770367632&attname=Dicom%E4%B8%8B%E8%BD%BD%E5%99%A8.exe)
下载地址(国外)：[GitHub](https://github.com/dandll/cloud-dicom-downloader-ex/releases/download/Release/Dicom.exe)


#### 二、运行exe可执行文件

![alt text](https://img.cdadoc.top/dicomdown/DicomDownUI.png)

双击打开软件，可以看到软件的提示信息如下：

请输入完整的云影像链接：

\-------示例-------

medicalimagecloud.com

海纳医信的云影像，URL 格式为https://*.medicalimagecloud.com:<port?>/t/<hex>，还需要一个密码。

mdmis.cq12320.cn

重庆卫健委在线报告查看网站，其中的影像查看器也是海纳医信。

URL 格式：https://mdmis.cq12320.cn/wcs1/mdmis-app/h5/#/share/detail?share_id=<hex>&content=<token>&channel=share

ylyyx.shdc.org.cn

上海申康医院发展中心的在线影像查看器，URL 格式支持以下两种：

https://ylyyx.shdc.org.cn/#/home?sid=<number>&token=<hex>

https://ylyyx.shdc.org.cn/code.html?appid=<xxx>&share_id=<uuid>&ctype=5

zs-hospital.sh.cn

复旦大学附属中山医院所使用的影像平台，URL 格式为https://zscloud.zs-hospital.sh.cn/film/#/shared?code=<code>。

ftimage.cn

飞图影像的医疗云影像平台，支持以下两种链接：

https://yyx.ftimage.cn/dimage/index.html?stm=<一长串>

https://app.ftimage.cn/dimage/index.html?accessionNumber=<hex>&hsCode=<number>&date=<number>

该爬虫依赖浏览器，在 Windows 上默认使用 Edge，如果启动失败请尝试运行playwright install改用捆绑的浏览器。

qr.szjudianyun.com

URL  格式为http://qr.szjudianyun.com/<xxx>/?a=<hospital_id>&b=<study>&c=<password>，可从报告单扫码得到。

ss.mtywcloud.com

明天医网的移动影像处理工作站，URL 格式为https://ss.mtywcloud.com/ICCWebClient/Image/Viewer?AllowQuery=0&DicomDirPath=<URL>&OrganizationID=xxx&Anonymous=true&Token=xxx。

m.yzhcloud.com

海纳医信的云影像，URL 格式为https://m.yzhcloud.com/w_viewer_2/?study_instance_uid=xxx&org_id=xxx

work.sugh.net

URL 格式为https://work.sugh.net:8002/pc/auth-viewer?clinicalShareToken=<token>

-------示例-------

这时候按照说明输入或粘贴 云影像链接 ，回车，即可下载Dicom文件