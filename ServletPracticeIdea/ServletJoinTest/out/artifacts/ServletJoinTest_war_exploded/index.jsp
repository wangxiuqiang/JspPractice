
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Join</title>
  </head>
  <body>
  <form method="post" action="servlet/Servlet" name="f">
    <table>
      <tr>
        <td>
          用户名
        </td>
        <td>
          <input value="" type="text" name="user"/>
        </td>
      </tr>
      <tr>
        <td>
           密码
        </td>
        <td>
          <input value="" type="password" name="password"/>
        </td>
      </tr>
      <tr>
        <td colspan="2" align="center">
          <input name="join" type="submit" value="join"/>
        </td>
      </tr>
    </table>
  </form>
  </body>
</html>
