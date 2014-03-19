<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'fitnessapp.css')}" type="text/css">
        <title>Качки, качки</title>
    </head>
    <body>
        <div style="position:relative; float:left; width:100%">
            <g:each in="${competitions}" var="comp">
                <div class="competition">
                    <span>${comp.title}</span>
                    <br/>
                    <span><g:formatDate format="yyyy-MM-dd" date="${comp.date}"/></span>
                    <br/>
                    Открыть...
                </div>
            </g:each>
        </div>
        <span class="power">
            +Соревнование
        </span>
<!--h1>list of competition ${competitions.size()}</h1-->
    </body>
</html>
