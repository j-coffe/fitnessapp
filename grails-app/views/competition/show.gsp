
<%@ page import="fitnessapp.Competition" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'competition.label', default: 'Competition')}" />
        <title>Просмотр соревнования</title>
    </head>
    <body>
        <!--a href="#show-competition" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a-->
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}">На главную</a></li>
                
                <li><g:link class="create" action="create">Добавить соревнование</g:link></li>
                 <li><g:link class="list" controller="athlete" action="index">К списку участников</g:link></li>
                 <li><g:link class="list" controller="judge" action="index">К списку судей</g:link></li>
                 <li><g:link class="list" controller="CCategory" action="index">К списку категорий</g:link></li>
                </ul>
            </div>
            <div id="show-competition" class="content scaffold-show" role="main">
                <h1>Соревнование</h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <ol class="property-list competition">

                <g:if test="${competitionInstance?.title}">
                    <li class="fieldcontain">
                        <span id="title-label" class="property-label">Название</span>

                        <span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${competitionInstance}" field="title"/></span>

                    </li>
                </g:if>

                <g:if test="${competitionInstance?.date}">
                    <li class="fieldcontain">
                        <span id="date-label" class="property-label">Дата проведения</span>

                        <span class="property-value" aria-labelledby="date-label"><g:formatDate format="yyyy-MM-dd" date="${competitionInstance?.date}" /></span>

                    </li>
                </g:if>

                

            </ol>
            <g:form url="[resource:competitionInstance, action:'delete']" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${competitionInstance}">Редактировать</g:link>
                    <g:actionSubmit class="delete" action="delete" value="Удалить" onclick="return confirm('Вы уверены?');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
