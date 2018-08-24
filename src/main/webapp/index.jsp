<%@ page import="javafx.scene.shape.Circle" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.GregorianCalendar" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.util.Date" %>
<%--<html>--%>
<%--<head></head>--%>
<%--<body>--%>
<%--<h2>Hello World!</h2>--%>
<%--</body>--%>
<%--</html>--%>

<%--
<%@ page ... %>	定义页面的依赖属性，比如脚本语言、error页面、缓存需求等等
<%@ include ... %>	包含其他文件
<%@ taglib ... %>	引入标签库的定义，可以是自定义标签
--%>

<%--解决中文的显示问题--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>

<html>
<head>
    <meta charset="utf-8">
    <title>Hello 菜鸟教程(runoob.com)</title>
</head>
<body>
world!</br>
<%--脚本程序--%>
<%
    out.println("你的 IP 地址 " + request.getRemoteAddr());
%>
<%--声明--%>
<%!
    int a = 3;
    int b = 99;
    Circle circle = new Circle(2.0);
%>
<%--表达式--%>
<p>数字是：<%=a%>
</p>
<p><%=day%>
</p>
<p><%=circle%>
</p>
<p>今天的日期是<%=(new java.util.Date().toLocaleString())%>
</p>
</br>
<%!
    int day = 7;
%>
<h3>IF...ELSE 实例</h3>

<% if (day == 1 | day == 7) { %>
<p>今天是周末</p>
<% } else { %>
<p>今天不是周末</p>
<% } %>

<%
    if (day == 7) {
        out.println("jint");
    }
%>
<%
    switch (day) {
        case 1:
            out.println(day);
        case 7:
            out.print(day + 3);
        case 8:
            out.println(day + day);
    }
%>

<h2>使用JavaBean实例</h2>
<jsp:useBean id="test" class="com.how2java.tmall.pojo.Category"/>
<jsp:setProperty name="test" property="id" value="5"/>
<jsp:setProperty name="test" property="name" value="你好"/>
<p>输出信息</p>
<jsp:getProperty name="test" property="id"/>
<br>
<jsp:getProperty name="test" property="name"/>
<br>
<jsp:getProperty name="test" property="class"/>

<h1>forward实例</h1>
<%--<jsp:forward page="date.jsp"/>--%>
<jsp:element name="xmlElement">
    <jsp:attribute name="xmlElementAttr">
        属性值
    </jsp:attribute>
    <jsp:body>
        XML 元素体
    </jsp:body>
</jsp:element>
<p>anidhd</p>
<boo>
    <jsp:text>你好啊</jsp:text>
</boo>

<h2>request头部请求指令</h2>
<table width="100%" border="1" align="center">
    <tr bgcolor="#ffd700">
        <th>Header Name</th>
        <th>Header Value(s)</th>
    </tr>
    <%
        Enumeration<String> headNames = request.getHeaderNames();
        while (headNames.hasMoreElements()) {
            String name = headNames.nextElement();
            out.println("<tr><td>" + name + "</td>\n");
            String paramValue = request.getHeader(name);
            out.println("<td>" + paramValue + "</td></tr>\n");
        }
    %>
</table>

<h2>response自动刷新示例</h2>
<%
    // 设置每隔5秒自动刷新
    response.setIntHeader("Refresh", 30);
    //获取当前时间
    Calendar calendar = new GregorianCalendar();

    String am_pm;
    int hour = calendar.get(Calendar.HOUR);
    int minute = calendar.get(Calendar.MINUTE);
    int second = calendar.get(Calendar.SECOND);
    if (calendar.get(Calendar.AM_PM) == 0) {
        am_pm = "AM";
    } else {
        am_pm = "PM";
    }
    String CT = hour + ":" + minute + ":" + second + " " + am_pm;
    out.println("当前时间" + CT + "\n");
%>
<%
    // 设置错误代码，并说明原因
//    response.sendError(404);
%>
<h2>使用get方法获取数据</h2>
<%--<ul>
    <li>
        <p>
            <b>Google:</b>
            <%=request.getParameter("google")%>
            &lt;%&ndash; 解决中文乱码的问题&ndash;%&gt;
        </p>
    </li>
    <li>
        <p>
            <b>runoob::</b>
            <%= request.getParameter("runoob")%>
        </p>
    </li>
    <li>
        <p><b>tao包：</b><%=request.getParameter("taobao")%>
        </p>
    </li>
    <li>
        <p><b>xaunz:</b><%=request.getParameter("选择网站")%>
        </p>
    </li>
</ul>--%>
<%--<%
    //编码，解决中文乱码问题
    String str = URLEncoder.encode(request.getParameter("name"), "utf-8");
    //设置name和URL cookie
    Cookie name = new Cookie("name", str);
    Cookie url = new Cookie("url", request.getParameter("url"));
    //设置cookie过期时间为24小时
    name.setMaxAge(60 * 60 * 24);
    url.setMaxAge(60 * 60 * 24);
    //在响应头部添加cookie
    response.addCookie(name);
    response.addCookie(url);
%>--%>
<h2>设置Cookie</h2>
<ul>
    <li>
        <p><b>网址名：</b><%=request.getParameter("name")%>
        </p>
    </li>
    <li>
        <p><b>网址：</b><%=request.getParameter("url")%>
        </p>
    </li>
</ul>
<%
    Cookie cookie = null;
    Cookie[] cookies = null;
    cookies = request.getCookies();
    if (cookies != null) {
        out.println("<h2>查找Cookies名与值<h2>");
        for (int i = 0; i < cookies.length; i++) {
            cookie = cookies[i];
            if ((cookie.getName()).equals("name")) {
                cookie.setMaxAge(0);
                response.addCookie(cookie);
                out.print("删除 Cookie: " +
                        cookie.getName() + "<br/>");
            }
            out.println("参数名：" + cookie.getName());
            out.println("<br/>");
            out.println("参数值：" + URLDecoder.decode(cookie.getValue(), "utf-8") + "<br/>");
            out.println("------------------<br/>");
        }
    } else {
        out.println("<h2>没有发现Cookies名与值<h2>");
    }
%>

<%
    Date createDate = new Date(session.getCreationTime());
    Date lastAccessTime = new Date(session.getLastAccessedTime());
    String title = "再次访问菜鸟教程实例";
    Integer visitCount = 0;
    String visitCountKey = "visitCount";
    String userIDKey = "userID";
    String userID = "ABCD";

    if (session.isNew()) {
        title = "访问菜鸟教程实例";
        session.setAttribute(userIDKey, userID);
        session.setAttribute(visitCountKey, visitCount);
    } else {
        visitCount = (Integer) session.getAttribute(visitCountKey);
//        visitCount++;
        userID = (String) session.getAttribute(userIDKey);
        session.setAttribute(visitCountKey, visitCount);
    }
%>
<h1>Session 跟踪</h1>
<table title="session666" border="1" align="center">
    <tr bgcolor="#9acd32">
        <th>Session信息</th>
        <th>值</th>
    </tr>
    <tr>
        <td>id</td>
        <td><%
            out.println(session.getId());
        %></td>
    </tr>
    <tr>
        <td>创建时间</td>
        <td><%
            out.println(createDate);
        %></td>
    </tr>
    <tr>
        <td>用户 ID</td>
        <td><% out.print(userID); %></td>
    </tr>
    <tr>
        <td>访问次数</td>
        <td><% out.print(visitCount); %></td>
    </tr>

</table>
<h1>页面重定向</h1>

<%
    // 重定向到新地址
    String site = "http://www.baidu.com";
//    response.setStatus(response.SC_MOVED_TEMPORARILY);
//    response.setHeader("Location", site);
//    response.sendRedirect(site);
%>

<h1>统计访问量</h1>
<%
    Integer hitCount = (Integer) application.getAttribute("hitCounter");
    if (hitCount == null || hitCount == 0) {
//        第一次访问
        out.println("欢迎");
        hitCount = 1;
    } else {
        out.println("欢迎再次");
        hitCount += 1;
    }
    application.setAttribute("hitCounter", hitCount);
%>
<p>页面访问量：<%=hitCount%>
</p>
</body>
</html>
