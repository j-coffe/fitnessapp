<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Соревнования</title>        
    </head>
    <body>   

        <g:link action="list" id="1">Список</g:link>

        <g:form name="addAthlete" url="[controller:'competition',action:'add']">
            <g:textField name="firstName" value="" />
            <g:actionSubmit value="Сохранить" action="add" />
        </g:form>

    </body>
</html>
