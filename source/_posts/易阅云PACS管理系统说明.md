---
title: 易阅云PACS管理系统说明
abbrlink: 43099
date: 2026-02-05 10:50:58
tags:
---

### 易阅云PACS系统

#### 系统介绍
**易阅云PACS系统**是一套基于BS架构的PACS系统，在DICOMSCP项目上升级完善了相关功能，主体功能已完善，支持预约登记管理、影像管理、在线影像阅片、报告管理、报告模板管理、工作量统计、HIS系统检查信息接口快捷登记、打印管理、查询检索管理 等功能。系统占用资源十分轻量，适合各种医疗机构使用。

## 功能特性

- **HIS对接管理**
  - 根据HIS接口或者视图获取患者检查数据
  - 根据HIS信息快捷登记预约

- **报告管理**
  - 根据影像信息填写报告
  - 引用报告模板
  - 快捷打印报告

- **工作量统计管理**
  - 根据报告医生统计
  - 根据审核医生统计
  - 支持图表分析
  - 支持导出Excel文件

- **在线阅片**
  - 支持浏览器直接阅片
  - 支持本地客户端阅片
  - 支持MPR，三维渲染

- **预约登记管理**
  - 支持根据HIS接口信息预约登记
  - 支持根据影像信息补预约登记
  - 支持查看时间段已预约数量

![alt text](https://img.cdadoc.top/yyy/登录界面.png)
![alt text](https://img.cdadoc.top/yyy/预约登记界面.png)
![alt text](https://img.cdadoc.top/yyy/预约登记界面-选择时间段.png)
![alt text](https://img.cdadoc.top/yyy/影像管理界面.png)
![alt text](https://img.cdadoc.top/yyy/书写报告界面.png)
![alt text](https://img.cdadoc.top/yyy/阅片界面2.png)
![alt text](https://img.cdadoc.top/yyy/HIS检查申请登记界面.png)

- **存储服务 (C-STORE SCP)**
  - 按照4个级别的标签入库和归档
  - 按照级别标签自动组织存储目录结构
  - 支持 JPEG、JPEG2000、JPEG-LS、RLE 等压缩

- **工作列表服务 (Worklist SCP)**
  - 提供标准 DICOM Modality Worklist 服务
  - 支持多种查询条件（患者ID、检查号、日期等）
  - 支持请求字符集协商自动中英文转换

- **查询检索服务 (QR SCP)**
  - 提供 C-FIND、C-MOVE、C-GET 服务
  - 可配置多个目标节点
  - 支持多种查询级别（Study/Series/Image）
  - 支持JPEG、JPEG2000、JPEG-LS、RLE 传输语法实时转码

- **打印服务 (Print SCP)**
  - 打印任务队列管理
  - 打印任务状态跟踪
  - 归档打印的原始文件和标签

- **WADOURI 服务 (Web Access to DICOM Objects)**
  - 必需参数
    - `requestType`: 必须为 "WADO"
    - `studyUID`: 研究实例 UID
    - `seriesUID`: 序列实例 UID
    - `objectUID`: 实例 UID

  - 可选参数
    - `contentType`: 返回内容类型 不传默认 image/jpeg
      - `application/dicom`: 返回 DICOM 格式
      - `image/jpeg`: 返回 JPEG 格式
    
    - `transferSyntax`: DICOM 传输语法 UID 不传默认不转码
      - `1.2.840.10008.1.2`: Implicit VR Little Endian
      - `1.2.840.10008.1.2.1`: Explicit VR Little Endian
      - `1.2.840.10008.1.2.4.50`: JPEG Baseline
      - `1.2.840.10008.1.2.4.57`: JPEG Lossless
      - `1.2.840.10008.1.2.4.70`: JPEG Lossless SV1
      - `1.2.840.10008.1.2.4.90`: JPEG 2000 Lossless
      - `1.2.840.10008.1.2.4.91`: JPEG 2000 Lossy
      - `1.2.840.10008.1.2.4.80`: JPEG-LS Lossless
      - `1.2.840.10008.1.2.5`: RLE Lossless

    - `anonymize`: 是否匿名化
      - `yes`: 执行匿名化处理
      - 其他值或不传: 不进行匿名化

  - 完整请求参数例子
    ```
    http://localhost:5000/wado?requestType=WADO&studyUID=1.2.840.113704.1.111.5096.1719875982.1&seriesUID=1.3.46.670589.33.1.13252761201319485513.2557156297609063016&objectUID=1.3.46.670589.33.1.39304787935332940.2231985654917411587&contentType=application/dicom&transferSyntax=1.2.840.10008.1.2.4.70&anonymize=yes
    ```

- **CSTORE-SCU (CSTORE-SCU)**
  - 支持发送DICOM图像到DICOM SCP
  - 可配置多个目标节点

- **Print-SCU (Print-SCU)**
  - 支持将PRINTSCP接收到的图像打印到其他打印机或PRINTSCP服务
  - 构建打印图像会保留原始图像的标签信息

- **Log Service (日志服务)**
  - 支持查看、删除日志
  - 个服务日志独立配置
  - 多日志级别配置
  - 服务预置详细日志 方便对接查找问题

- **WADO-RS 服务 (Web Access to DICOM Objects - RESTful Services)**
  - 实例检索 (Instance Retrieval)
    ```
    GET /dicomweb/studies/{studyUID}
    GET /dicomweb/studies/{studyUID}/series/{seriesUID}
    GET /dicomweb/studies/{studyUID}/series/{seriesUID}/instances/{instanceUID}
    ```
    - 支持原始 DICOM 格式检索
    - 支持传输语法转换
    - 支持 multipart/related 响应
    - 支持 Accept 头指定返回格式
    - 支持检查/序列/实例三个级别的检索
    - 支持 transfer-syntax 参数指定传输语法

  - 元数据检索 (Metadata Retrieval)
    ```
    GET /dicomweb/studies/{studyUID}/series/{seriesUID}/metadata
    ```
    - 返回 DICOM JSON 格式
    - 包含完整的 DICOM 标签信息
    - 支持 VR 和 Value 的标准格式
    - 符合 DICOMweb 规范的空值处理

  - 帧检索 (Frame Retrieval)
    ```
    GET /dicomweb/studies/{studyUID}/series/{seriesUID}/instances/{instanceUID}/frames/{frames}
    ```
    - 支持单帧/多帧提取
    - 保持原始像素数据
    - 支持传输语法转换

  - 缩略图服务 (Thumbnail)
    ```
    GET /dicomweb/studies/{studyUID}/series/{seriesUID}/thumbnail?size={size}
    GET /dicomweb/studies/{studyUID}/series/{seriesUID}/thumbnail?viewport={viewport}
    ```
    - 支持自定义尺寸
      - size: 指定输出图像大小（可选，默认 128）
      - viewport: 指定视口大小（可选，与 size 参数互斥）
    - 保持图像宽高比
    - JPEG 格式输出
    - 示例：
      ```
      /dicomweb/studies/1.2.3/series/4.5.6/thumbnail?size=256
      /dicomweb/studies/1.2.3/series/4.5.6/thumbnail?viewport=512
      ```

- **QIDO-RS 服务 (Query based on ID for DICOM Objects - RESTful Services)**
  - 研究级查询 (Study Level Query)
    ```
    # DICOMweb 标准格式
    GET /dicomweb/studies?00100020={patientID}&00100010={patientName}&00080020={date}&00200010={accessionNumber}&0020000D={studyUID}&00080060={modality}&offset={offset}&limit={limit}&fuzzy=true
    
    # 友好格式（兼容）
    GET /dicomweb/studies?PatientID={patientID}&PatientName={patientName}&StudyDate={date}&AccessionNumber={accessionNumber}&StudyInstanceUID={studyUID}&Modality={modality}&offset={offset}&limit={limit}&fuzzy=true
    ```
    - 支持多种查询参数：
      - 标准 DICOM 标签格式：
        - 00100020: 患者 ID
        - 00100010: 患者姓名
        - 00080020: 检查日期
        - 00200010: 检查号
        - 0020000D: 检查实例 UID
        - 00080060: 检查类型/模态
      - 友好格式（等效）：
        - PatientID: 精确匹配或模糊匹配 (例如: "P123*" 匹配所有以 P123 开头的ID)
        - PatientName: 支持通配符 (例如: "*张*" 匹配包含"张"的姓名)
        - StudyDate: 支持日期范围 (例如: "20240101-20240131" 表示1月份的数据)
        - AccessionNumber: 检查号匹配
        - StudyInstanceUID: 检查实例 UID 精确匹配
        - Modality: 检查类型/模态 (例如: "CT" 或 "CT\MR" 支持多值)
        - fuzzy: 设置为 true 时启用模糊匹配
    - 支持分页功能（offset/limit）
    - 支持模糊匹配
    - 返回符合 DICOMweb 标准的 JSON 格式

  - 序列级查询 (Series Level Query)
    ```
    GET /dicomweb/studies/{studyUID}/series?SeriesInstanceUID={seriesUID}&Modality={modality}
    ```
    - 支持序列 UID 过滤
    - 支持模态过滤 (例如: "CT*" 匹配所有 CT 相关模态)
    - 返回序列详细信息
    - 符合 DICOMweb JSON 格式规范

  - 实例级查询 (Instance Level Query)
    ```
    GET /dicomweb/studies/{studyUID}/series/{seriesUID}/instances?SOPInstanceUID={instanceUID}
    ```
    - 支持 SOP 实例 UID 过滤
    - 返回实例详细信息
    - 包含图像参数信息

## 系统要求

- Windows 10/11 或 Windows Server 2016+
- .NET 8.0 或更高版本
- SQLite 3.x
- 8GB+ RAM
- 40GB+ 可用磁盘空间
- 现代浏览器（Chrome/Firefox/Edge）
