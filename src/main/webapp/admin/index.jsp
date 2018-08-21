<%
    String site = "../admin_category_list";
//    最简单的重定向方式就是使用response对象的sendRedirect()方法。
//    response.sendRedirect(site);
//    也可以使用setStatus()和setHeader()方法来得到同样的效果：
    response.setStatus(response.SC_MOVED_TEMPORARILY);
    response.setHeader("Location", site);
%>