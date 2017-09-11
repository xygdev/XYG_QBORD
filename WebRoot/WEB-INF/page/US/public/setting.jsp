<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="utf-8" %>
<html>
  <body>
    <%
        String rdTable=request.getParameter("rdtable");
        String odTable=request.getParameter("odtable");
        String pageframe=request.getParameter("pageframe");
        String alias = null;
        alias = request.getParameter("alias");
    %>    
    <div class="title">
      <span>Setting</span>
      <a class="close-setting">&#215;</a>
    </div>  
    <div class="line"></div>
    <div class="content">
      <ul>
        <li><a class="pointer" data-rowdefine="init" data-reveal-id="row-def" data-pageframe="row-def" data-table=<%=rdTable %>>Row</a></li>
        <li><a class="pointer">Line</a>
          <ul>
            <li>
              <a class="set_page_size pointer" data-pagetype="setpagesize" data-pageframe=<%=pageframe %>>
                <i class="fa fa-dot-circle-o hidden" data-value="5"></i>5
              </a>
            </li>
            <li>
              <a class="set_page_size pointer" data-pagetype="setpagesize" data-pageframe=<%=pageframe %>>
                <i class="fa fa-dot-circle-o" data-value="10"></i>10
              </a>
            </li>
            <li>
              <a class="set_page_size pointer" data-pagetype="setpagesize" data-pageframe=<%=pageframe %>>
                <i class="fa fa-dot-circle-o hidden" data-value="15"></i>15
              </a>
            </li>
            <li>
              <a class="set_page_size pointer" data-pagetype="setpagesize" data-pageframe=<%=pageframe %>>
                <i class="fa fa-dot-circle-o hidden" data-value="25"></i>25
              </a>
            </li>
            <li>
              <a class="set_page_size pointer" data-pagetype="setpagesize" data-pageframe=<%=pageframe %>>
                <i class="fa fa-dot-circle-o hidden" data-value="50"></i>50
              </a>
            </li> 
          </ul>
        </li>
        <li><a class="pointer" data-ordertable=<%=odTable %> data-alias=<%=alias %> data-reveal-id="orderby">Sorting</a></li>
        <li><a class="pointer" data-config="init" data-reveal-id="config">Config</a></li>
       </ul>
     </div>      
  </body>
</html>