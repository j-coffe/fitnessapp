<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="layout" content="main">
        <title>Вход в систему</title>
    </head>
    <body>
        
        <g:form url="[action:'login',controller:'users']" method="POST" >
            <div class="fieldcontain">
                <label for="login">Логин:</label>
                <span class="required-indicator">*</span>
                <g:textField name="login" value=""/>
            </div>
            <div class="fieldcontain">
                <label for="password">Пароль:</label>
                <span class="required-indicator">*</span>
                <g:passwordField name="password" value=""/>
            </div>
            <fieldset class="buttons">
                <g:actionSubmit class="save" action="login" value="Войти" />
            </fieldset> 
        </g:form>
    </body>
</html>
