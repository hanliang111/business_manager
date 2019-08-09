<html>
<#include "common/header.ftl">


<body>


<div id="wrapper" class="toggled">

<#--边栏sidebar-->
<#include "common/nav.ftl">

<#--主要内容content-->
    <div id="page-content-wrapper">
        <div class="container-fluid">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <form action="" method="post" enctype="multipart/form-data">

                        <input type="hidden" name="id" value=""><br/>
                        名称<input type="text" name="name" value=""><br/>
                        类别ID:<select name="categoryId">
                        <option></option>
                        <#list categoryList as category>
                            <option value="${category.id}">${category.id}</option>
                        </#list>
                    </select><br/>
                        子图<input type="text" id="subImages" name="subImages" hidden="hidden" value=""><br/>

                        <input id="input-id" type="file">
                        <p class="help-block">支持jpg、jpeg、png、gif格式，大小不超过1M</p>

                        价格:<input type="text" name="price" value=""><br/>
                        库存:<input type="text" name="stock" value=""><br/>
                        状态:<input type="text" name="status" value=""><br/>
                        <input type="submit"  value="添加"><br/>

                    </form>

                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap-fileinput/4.4.8/js/fileinput.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap-fileinput/4.4.8/js/locales/zh.min.js"></script>
<script>

    $(function () {
        var initialPreview = [];
        if ('${(product.subImages)!""}' != '') {
            initialPreview = "<img class='kv-preview-data file-preview-image' src='${(product.subImages)!""}'>"
        }

        $("#input-id").fileinput({
            uploadUrl: '/sell/image/upload',
            language: 'zh',
            browseClass: "btn btn-primary btn-block",
            showCaption: false,
            showRemove: false,
            showUpload: false,
            allowedFileExtensions: [ 'jpg', 'jpeg', 'png', 'gif' ],
            maxFileSize: 1024,
            autoReplace: true,
            overwriteInitial: true,
            maxFileCount: 1,
            initialPreview: initialPreview,
        });
    });
    //上传完成设置表单内容
    $('#input-id').on('fileuploaded', function(event, data, previewId, index) {
        if (data.response.code != 0) {
            alert(data.response.msg)
            return
        }
        $('#subImages').val(data.response.data.fileName)
    });
</script>

</body>
</html>
