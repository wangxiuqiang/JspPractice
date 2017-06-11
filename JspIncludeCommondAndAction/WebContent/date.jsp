<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<% 
   Date a=new Date();
   SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy/MM/dd");
   
   out.println(simpleDateFormat.format(a));
%>
