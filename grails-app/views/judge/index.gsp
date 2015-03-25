
<%@ page import="fitnessapp.Judge" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'judge.label', default: 'Judge')}" />
        <title>Список судей</title>
    </head>
    <body>
            <!--a href="#list-judge" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a-->
        <div class="nav" role="navigation">
            <ul>
                <!--li><a class="home" href="${createLink(uri: '/')}">На главную</a></li-->
                <li><g:link controller="competition" action="show" id="${session['competition'].id}">К соревнованию</g:link></li>
                <li><g:link class="create" action="create">Добавить судью</g:link></li>
                </ul>
            </div>
            <div id="list-judge" class="content scaffold-list" role="main">
                <h1>Судьи соревнования: ${session["competition"]?.title} 
                <g:formatDate format="yyyy-MM-dd" date="${session["competition"]?.date}" /></h1>
                <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table>
                <thead>
                    <tr>

                        <!--th><g:message code="judge.competition.label" default="Competition" /></th-->
                        <g:sortableColumn property="num" title="Номер" />

                        <g:sortableColumn property="firstName" title="Имя" />

                    </tr>
                </thead>
                <tbody>
                    <g:each in="${judgeInstanceList}" status="i" var="judgeInstance">
                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                            <td>${fieldValue(bean: judgeInstance, field: "num")}</td>

                            <!--td>${fieldValue(bean: judgeInstance, field: "competition")}</td-->

                            <td><g:link action="show" id="${judgeInstance.id}">${fieldValue(bean: judgeInstance, field: "firstName")}</g:link></td>

                        </tr>
                    </g:each>
                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${judgeInstanceCount ?: 0}" />
            </div>
        </div>
    </body>
</html>
