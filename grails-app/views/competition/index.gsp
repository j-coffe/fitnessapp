
<%@ page import="fitnessapp.Competition" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'competition.label', default: 'Competition')}" />
        <title>Качки, качки!</title>
    </head>
    <body>
            <!--a href="#list-competition" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a-->
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}">На главную</a></li>
                <li><g:link class="create" action="create">Добавить соревнования</g:link></li>
                </ul>
            </div>
            <div id="list-competition" class="content scaffold-list" role="main">
                <h1>Соревнования</h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table>
                <thead>
                    <tr>
                        <g:sortableColumn property="title" title="Название" />
                        <g:sortableColumn property="date" title="Дата проведения" />
                    </tr>
                </thead>
                <tbody>
                    <g:each in="${competitionInstanceList}" status="i" var="competitionInstance">
                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                            <td><g:link action="show" id="${competitionInstance.id}">${fieldValue(bean: competitionInstance, field: "title")}</g:link></td>

                            <td><g:formatDate date="${competitionInstance.date}" format="yyyy-MM-dd"/></td>

                        </tr>
                    </g:each>
                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${competitionInstanceCount ?: 0}" />
            </div>
        </div>
    </body>
</html>
