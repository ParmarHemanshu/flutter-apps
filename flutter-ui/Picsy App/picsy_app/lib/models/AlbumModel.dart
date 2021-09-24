

class AlbumModel {
  final Response? response;

  AlbumModel({
    this.response,
  });

  AlbumModel.fromJson(Map<String, dynamic> json)
      : response = (json['response'] as Map<String,dynamic>?) != null ? Response.fromJson(json['response'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'response' : response?.toJson()
  };
}

class Response {
  final bool? status;
  final String? message;
  final List<Data>? data;
  final int? recordcount;
  final int? totalRecords;

  Response({
    this.status,
    this.message,
    this.data,
    this.recordcount,
    this.totalRecords,
  });

  Response.fromJson(Map<String, dynamic> json)
      : status = json['status'] as bool?,
        message = json['message'] as String?,
        data = (json['data'] as List?)?.map((dynamic e) => Data.fromJson(e as Map<String,dynamic>)).toList(),
        recordcount = json['recordcount'] as int?,
        totalRecords = json['total_records'] as int?;

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message,
    'data' : data?.map((e) => e.toJson()).toList(),
    'recordcount' : recordcount,
    'total_records' : totalRecords
  };
}

class Data {
  final int? yearbookId;
  final int? userYearbookId;
  final String? yearbookName;
  final String? yearbookType;
  final Settings? settings;
  final String? createdDate;
  final String? lastModifiedDate;
  final int? productId;
  final double? productWidth;
  final double? productHeight;
  final dynamic ordersDate;
  final dynamic orderId;
  final int? bookType;
  final dynamic yearbookDescription;
  final List<int>? sizesAvailable;
  final int? yearbookSortOrder;
  final dynamic yearbookCategorySortOrder;
  final int? partnerId;
  final dynamic partnerName;
  final int? partnerBook;
  final dynamic expiryDate;
  final dynamic voucherCode;
  final List<Pages>? pages;
  final int? editableImageCount;
  final dynamic orderLink;
  final int? orderStatus;
  final int? noPages;
  final int? visiblePages;
  final int? formable;
  final int? flexible;
  final String? coverPage;
  final String? frontPageName;
  final String? backPageName;
  final List<ImageData>? imageData;
  final String? imgHttpThumb;
  final String? imgHttpLarge;
  final String previewThumb;
  final String? previewLarge;
  final bool? yearbookThumbnail;
  final String? imgHttpLargeFancybox;
  final String? thumbPageNameFancybox;
  final String? thumbPageName;
  final String? category;
  final dynamic yearbookBanner;
  final dynamic appPreviewDescription;
  final String? seoUrl;
  final Config? config;

  Data({
    this.yearbookId,
    this.userYearbookId,
    this.yearbookName,
    this.yearbookType,
    this.settings,
    this.createdDate,
    this.lastModifiedDate,
    this.productId,
    this.productWidth,
    this.productHeight,
    this.ordersDate,
    this.orderId,
    this.bookType,
    this.yearbookDescription,
    this.sizesAvailable,
    this.yearbookSortOrder,
    this.yearbookCategorySortOrder,
    this.partnerId,
    this.partnerName,
    this.partnerBook,
    this.expiryDate,
    this.voucherCode,
    this.pages,
    this.editableImageCount,
    this.orderLink,
    this.orderStatus,
    this.noPages,
    this.visiblePages,
    this.formable,
    this.flexible,
    this.coverPage,
    this.frontPageName,
    this.backPageName,
    this.imageData,
    this.imgHttpThumb,
    this.imgHttpLarge,
    required this.previewThumb,
    this.previewLarge,
    this.yearbookThumbnail,
    this.imgHttpLargeFancybox,
    this.thumbPageNameFancybox,
    this.thumbPageName,
    this.category,
    this.yearbookBanner,
    this.appPreviewDescription,
    this.seoUrl,
    this.config,
  });

  Data.fromJson(Map<String, dynamic> json)
      : yearbookId = json['yearbook_id'] as int?,
        userYearbookId = json['user_yearbook_id'] as int?,
        yearbookName = json['yearbook_name'] as String?,
        yearbookType = json['yearbook_type'] as String?,
        settings = (json['settings'] as Map<String,dynamic>?) != null ? Settings.fromJson(json['settings'] as Map<String,dynamic>) : null,
        createdDate = json['created_date'] as String?,
        lastModifiedDate = json['last_modified_date'] as String?,
        productId = json['product_id'] as int?,
        productWidth = json['product_width'] as double?,
        productHeight = json['product_height'] as double?,
        ordersDate = json['orders_date'],
        orderId = json['order_id'],
        bookType = json['book_type'] as int?,
        yearbookDescription = (json['yearbook_description'] != null
            ? new YearbookDescription.fromJson(json['yearbook_description'])
            : YearbookDescription(desc: "", size: "", price: "")),

        sizesAvailable = (json['sizes_available'] as List?)?.map((dynamic e) => e as int).toList(),
        yearbookSortOrder = json['yearbook_sort_order'] as int?,
        yearbookCategorySortOrder = json['yearbook_category_sort_order'],
        partnerId = json['partner_id'] as int?,
        partnerName = json['partner_name'],
        partnerBook = json['partner_book'] as int?,
        expiryDate = json['expiry_date'],
        voucherCode = json['voucher_code'],
        pages = (json['pages'] as List?)?.map((dynamic e) => Pages.fromJson(e as Map<String,dynamic>)).toList(),
        editableImageCount = json['editable_image_count'] as int?,
        orderLink = json['order_link'],
        orderStatus = json['order_status'] as int?,
        noPages = json['no_pages'] as int?,
        visiblePages = json['visible_pages'] as int?,
        formable = json['formable'] as int?,
        flexible = json['flexible'] as int?,
        coverPage = json['cover_page'] as String?,
        frontPageName = json['front_page_name'] as String?,
        backPageName = json['back_page_name'] as String?,
        imageData = (json['image_data'] as List?)?.map((dynamic e) => ImageData.fromJson(e as Map<String,dynamic>)).toList(),
        imgHttpThumb = json['img_http_thumb'] as String,
        imgHttpLarge = json['img_http_large'] as String?,
        previewThumb = json['preview_thumb'] as String,
        previewLarge = json['preview_large'] as String?,
        yearbookThumbnail = json['yearbook_thumbnail'] as bool?,
        imgHttpLargeFancybox = json['img_http_large_fancybox'] as String?,
        thumbPageNameFancybox = json['thumb_page_name_fancybox'] as String?,
        thumbPageName = json['thumb_page_name'] as String?,
        category = json['category'] as String?,
        yearbookBanner = json['yearbook_banner'],
        appPreviewDescription = json['app_preview_description'],
        seoUrl = json['seo_url'] as String?,
        config = (json['config'] as Map<String,dynamic>?) != null ? Config.fromJson(json['config'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'yearbook_id' : yearbookId,
    'user_yearbook_id' : userYearbookId,
    'yearbook_name' : yearbookName,
    'yearbook_type' : yearbookType,
    'settings' : settings?.toJson(),
    'created_date' : createdDate,
    'last_modified_date' : lastModifiedDate,
    'product_id' : productId,
    'product_width' : productWidth,
    'product_height' : productHeight,
    'orders_date' : ordersDate,
    'order_id' : orderId,
    'book_type' : bookType,
    'yearbook_description' : yearbookDescription,
    'sizes_available' : sizesAvailable,
    'yearbook_sort_order' : yearbookSortOrder,
    'yearbook_category_sort_order' : yearbookCategorySortOrder,
    'partner_id' : partnerId,
    'partner_name' : partnerName,
    'partner_book' : partnerBook,
    'expiry_date' : expiryDate,
    'voucher_code' : voucherCode,
    'pages' : pages?.map((e) => e.toJson()).toList(),
    'editable_image_count' : editableImageCount,
    'order_link' : orderLink,
    'order_status' : orderStatus,
    'no_pages' : noPages,
    'visible_pages' : visiblePages,
    'formable' : formable,
    'flexible' : flexible,
    'cover_page' : coverPage,
    'front_page_name' : frontPageName,
    'back_page_name' : backPageName,
    'image_data' : imageData?.map((e) => e.toJson()).toList(),
    'img_http_thumb' : imgHttpThumb,
    'img_http_large' : imgHttpLarge,
    'preview_thumb' : previewThumb,
    'preview_large' : previewLarge,
    'yearbook_thumbnail' : yearbookThumbnail,
    'img_http_large_fancybox' : imgHttpLargeFancybox,
    'thumb_page_name_fancybox' : thumbPageNameFancybox,
    'thumb_page_name' : thumbPageName,
    'category' : category,
    'yearbook_banner' : yearbookBanner,
    'app_preview_description' : appPreviewDescription,
    'seo_url' : seoUrl,
    'config' : config?.toJson()
  };
}
class YearbookDescription {
  late String desc;
  late String size;
  late String price;

  YearbookDescription({
    required this.desc,
    required this.size,
    required this.price,
  });

  YearbookDescription.fromJson(Map<String, dynamic> json) {
    desc = json['Desc'];
    size = json['Size'];
    price = json['Price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Desc'] = this.desc;
    data['Size'] = this.size;
    data['Price'] = this.price;

    return data;
  }
}
class Settings {
  final String? calendarLayout;

  Settings({
    this.calendarLayout,
  });

  Settings.fromJson(Map<String, dynamic> json)
      : calendarLayout = json['calendar_layout'] as String?;

  Map<String, dynamic> toJson() => {
    'calendar_layout' : calendarLayout
  };
}

class Pages {
  final int? masterYearbookPageId;
  final int? pageIndex;
  final int? pageEditable;
  final int? masterTemplateId;
  final String? createdDate;
  final String? lastModifiedDate;
  final List<ImageData>? imageData;
  final int? width;
  final int? height;
  final String? pageName;

  Pages({
    this.masterYearbookPageId,
    this.pageIndex,
    this.pageEditable,
    this.masterTemplateId,
    this.createdDate,
    this.lastModifiedDate,
    this.imageData,
    this.width,
    this.height,
    this.pageName,
  });

  Pages.fromJson(Map<String, dynamic> json)
      : masterYearbookPageId = json['master_yearbook_page_id'] as int?,
        pageIndex = json['page_index'] as int?,
        pageEditable = json['page_editable'] as int?,
        masterTemplateId = json['master_template_id'] as int?,
        createdDate = json['created_date'] as String?,
        lastModifiedDate = json['last_modified_date'] as String?,
        imageData = (json['image_data'] as List?)?.map((dynamic e) => ImageData.fromJson(e as Map<String,dynamic>)).toList(),
        width = json['width'] as int?,
        height = json['height'] as int?,
        pageName = json['page_name'] as String?;

  Map<String, dynamic> toJson() => {
    'master_yearbook_page_id' : masterYearbookPageId,
    'page_index' : pageIndex,
    'page_editable' : pageEditable,
    'master_template_id' : masterTemplateId,
    'created_date' : createdDate,
    'last_modified_date' : lastModifiedDate,
    'image_data' : imageData?.map((e) => e.toJson()).toList(),
    'width' : width,
    'height' : height,
    'page_name' : pageName
  };
}

class ImageData {
  final String? pageId;
  final String? thumb;
  final String? large;

  ImageData({
    this.pageId,
    this.thumb,
    this.large,
  });

  ImageData.fromJson(Map<String, dynamic> json)
      : pageId = json['page_id'] as String?,
        thumb = json['thumb'] as String?,
        large = json['large'] as String?;

  Map<String, dynamic> toJson() => {
    'page_id' : pageId,
    'thumb' : thumb,
    'large' : large
  };
}

class ImageDatas {
  final String? pageId;
  final String? thumb;
  final String? large;

  ImageDatas({
    this.pageId,
    this.thumb,
    this.large,
  });

  ImageDatas.fromJson(Map<String, dynamic> json)
      : pageId = json['page_id'] as String?,
        thumb = json['thumb'] as String?,
        large = json['large'] as String?;

  Map<String, dynamic> toJson() => {
    'page_id' : pageId,
    'thumb' : thumb,
    'large' : large
  };
}

class Config {
  final ImageQuality? imageQuality;

  Config({
    this.imageQuality,
  });

  Config.fromJson(Map<String, dynamic> json)
      : imageQuality = (json['imageQuality'] as Map<String,dynamic>?) != null ? ImageQuality.fromJson(json['imageQuality'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'imageQuality' : imageQuality?.toJson()
  };
}

class ImageQuality {
  final bool? enabled;
  final String? minDpi;
  final String? maxDpi;

  ImageQuality({
    this.enabled,
    this.minDpi,
    this.maxDpi,
  });

  ImageQuality.fromJson(Map<String, dynamic> json)
      : enabled = json['enabled'] as bool?,
        minDpi = json['minDpi'] as String?,
        maxDpi = json['maxDpi'] as String?;

  Map<String, dynamic> toJson() => {
    'enabled' : enabled,
    'minDpi' : minDpi,
    'maxDpi' : maxDpi
  };
}