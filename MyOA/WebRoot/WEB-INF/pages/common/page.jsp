<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <style type="text/css">
  .cur_pointer {
	cursor: pointer;
}
  </style>
    <title>分页</title>
  <script type="text/javascript">
	function firstPage(){  //首页
		var myFrom = document.getElementById("mf");
		var pageNumObj = document.getElementById("pageNum");
			if(pageNumObj.value <= 1 ){
			 myFrom.onsubmit("return false");
			}
			pageNumObj.value = 1;
		myFrom.submit();
	}
	function upPage(){   //上一页
		var myFrom = document.getElementById("mf");
		var pageNumObj = document.getElementById("pageNum");
		if(pageNumObj.value <= 1 ){
			pageNumObj.value = 1;
			 myFrom.onsubmit("return false");
		}
		else{
			pageNumObj.value = parseInt(pageNumObj.value)-1;
		}
		myFrom.submit();
	}
	function nextPage(){  //下一页
		var myFrom = document.getElementById("mf");
		var pageNumObj = document.getElementById("pageNum");
		pageNumObj.value = parseInt(pageNumObj.value)+1;
	
		if(pageNumObj.value > ${pager.pageCount}){
			pageNumObj.value = ${pager.pageCount};
			 myFrom.onsubmit("return false");
		}
		myFrom.submit();
	}
	
	function lastPage(){  //末页
		var myFrom = document.getElementById("mf");
		var pageNumObj = document.getElementById("pageNum");
		 if(pageNumObj.value >= ${pager.pageCount}){
			myFrom.onsubmit("return false");
			}
		 pageNumObj.value=${pager.pageCount};
		myFrom.submit();
	}
	function jumpPage(){   //跳转到 指定页数
		var myFrom = document.getElementById("mf");
		var pageNum = document.getElementById("pageNum");
		var  pageText = document.getElementById("pager");
		var pageTextNum=pageText.value;
		var c=pageTextNum.split(".");   //截取小数点 判断输入的 是否为整数
     if(pageTextNum>${pager.pageCount}){
     alert("请输入正确的页数！");
    pageText.select();
       myFrom.onsubmit("return false");
     }
     else if(isNaN(pageTextNum)){
     alert("请输入数字!");
      pageText.select();
       myFrom.onsubmit("return false");
     }
     else if(c.length>=2){
       alert("请输入整数!");
      pageText.select();
       myFrom.onsubmit("return false");
     }
		else if(parseInt(pageTextNum)>${pager.pageCount}){
		pageNum.value =${pager.pageCount};
	}
		else{
		pageNum.value = parseInt(pageTextNum);
		}
		myFrom.submit();
	}
  
  </script>
  <body>
   <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td class="STYLE4">&nbsp;&nbsp;共有 ${pager.totalCount}条记录，当前第 ${pager.pageNumber}/${pager.pageCount} 页</td>
            <td><table border="0" align="right" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="40"><img src="images/first.gif" width="37" height="15" class="cur_pointer" onclick="firstPage()" /></td>
                  <td width="45"><img src="images/back.gif" width="43" height="15" class="cur_pointer" onclick="upPage()"/></td>
                  <td width="45"><img src="images/next.gif" width="43" height="15" class="cur_pointer" onclick="nextPage()" /></td>
                  <td width="40"><img src="images/last.gif" width="37" height="15" class="cur_pointer" onclick="lastPage()" /></td>
                  <td width="100"><div align="center"><span class="STYLE1">转到第
                    <input name="textfield" id="pager" type="text" size="4" style="height:15px; width:20px; border:1px solid #999999;" /> 
                    页 </span></div></td>
                
                  <td width="40"><img src="images/go.gif" width="37" height="15" class="cur_pointer" onclick="jumpPage()" />
                </tr>
            </table></td>
          </tr>
        </table>
  </body>
</html>
