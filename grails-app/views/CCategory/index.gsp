
<%@ page import="fitnessapp.CCategory" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'CCategory.label', default: 'CCategory')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-CCategory" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <!--li><a class="home" href="${createLink(uri: '/')}">На главную</a></li-->
                <li><g:link controller="competition" action="show" id="${session['competition'].id}">К соревнованию</g:link></li>
                <li><g:link class="create" action="create">Добавить категорию к соревнованиям</g:link></li>
                </ul>
            </div>
            <div id="list-CCategory" class="content scaffold-list" role="main">
                <h1>Категории соревнования: ${session["competition"]?.title} 
                <g:formatDate format="yyyy-MM-dd" date="${session["competition"]?.date}" /></h1>
                <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table>
                <thead>
                    <tr>
                        <g:sortableColumn property="title" title="Название" />
                        <g:sortableColumn property="numForPass" title="Сколько проходит" />
                        <g:sortableColumn property="summarize" title="Суммировать" />
                    </tr>
                </thead>
                <tbody>
                    <g:each in="${CCategoryInstanceList}" status="i" var="CCategoryInstance">
                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                            <td><g:link action="show" id="${CCategoryInstance.id}">${fieldValue(bean: CCategoryInstance, field: "title")}</g:link></td>
                            <td>${fieldValue(bean: CCategoryInstance, field: "numForPass")}</td>
                            <td>${fieldValue(bean: CCategoryInstance, field: "summarize")}</td>
                            </tr>
                    </g:each>
                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${CCategoryInstanceCount ?: 0}" />
            </div>
        </div>
    </body>
</html>
