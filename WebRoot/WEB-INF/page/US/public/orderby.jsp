<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="utf-8" %>
<html>
  <body>
    <!-- 多维排序区域 start -->
    <div id="orderby">
       <div class="title pointer">
         <span class="title_name">Sorting</span>
       </div>
       <a class="close-reveal-modal">&#215;</a>
       <div class="line"></div>
       <div class="contain" style="width:90%;padding:0 8%">
         <div class="item" id="col1" style="width:80%;">
           <span>Sorting 1：</span>
           <select class="select"></select>
		   <input type="radio" name="col1" class="col1" checked="checked" value="ASC" />ASC 
           <input type="radio" name="col1" class="col1" value="DESC" />DESC 
         </div>  
         <div class="item" id="col2" style="width:80%;">
           <span>Sorting 2：</span>
           <select class="select"></select>
		   <input type="radio" name="col2" class="col2" checked="checked" value="ASC" />ASC 
           <input type="radio" name="col2" class="col2" value="DESC" />DESC 
         </div> 
         <div class="item" id="col3" style="width:80%;">
           <span>Sorting 3：</span>
           <select class="select"></select>
		   <input type="radio" name="col3" class="col3" checked="checked" value="ASC" />ASC 
           <input type="radio" name="col3" class="col3" value="DESC" />DESC 
         </div> 
       </div>
       <div class="footer">
         <button class='right pointer' data-order=true >Confirm</button>
       </div>
     </div>
     <script>
         $("#orderby").draggable({ handle: ".title" });
     </script>
     <!-- 多维排序区域 end -->
  </body>
</html>