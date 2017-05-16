<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
		<title>上传图片，并预览</title>
		<script type="text/javascript" src="/js/jquery-1.12.3.min.js"></script>
		<!-- 设置图片上传后预览的div样式 -->
		<style type="text/css">
			#preview, .img, img
			{
			width:200px;
			height:200px;/*删除height的设置，则显示图像会保存原图像的宽高比  */
			}
			#preview
			{
			border:1px solid #000;
			}
		</style>
	</head>
	<body>
		<div id="preview"></div>
		<input type="file" onchange="preview(this)" />
		<!-- 图片上传和预览 -->
		<script type="text/javascript">
			function preview(file){
				var prevDiv = document.getElementById('preview');
				if (file.files && file.files[0]){
					var reader = new FileReader();
					reader.onload = function(evt){
						prevDiv.innerHTML = '<img src="' + evt.target.result + '" />';
					};
					reader.readAsDataURL(file.files[0]);
				}else{
					prevDiv.innerHTML = '<div class="img" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'"></div>';
				}
			}
		</script>
	</body>
</html> 