
<%@ page import="fitnessapp.AthleteCCategory" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'athleteCCategory.label', default: 'AthleteCCategory')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-athleteCCategory" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}">На главную</a></li>
                <li><g:link class="create" controller="athlete" action="show" id="${session['athlete'].id}">Вернуться к участнику</g:link></li>
                <li><g:link class="create" action="create">Добавить участнику список категорий</g:link></li>
                </ul>
            </div>
            <div id="list-athleteCCategory" class="content scaffold-list" role="main">
                <h1>Участник: ${session["athlete"].num} ${session["athlete"].firstName} ${session["athlete"].secondName}</h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table>
                <thead>
                    <tr>

                        <th>Категория</th>

                    </tr>
                </thead>
                <tbody>
                    <g:each in="${athleteCCategoryInstanceList}" status="i" var="athleteCCategoryInstance">
                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                            <td><g:link action="show" id="${athleteCCategoryInstance.id}">${fieldValue(bean: athleteCCategoryInstance, field: "ccategory.title")}</g:link></td>



                        </tr>
                    </g:each>
                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${athleteCCategoryInstanceCount ?: 0}" />
            </div>
        </div>
    </body>
</html>
