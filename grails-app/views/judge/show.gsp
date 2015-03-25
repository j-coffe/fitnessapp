
<%@ page import="fitnessapp.Judge" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'judge.label', default: 'Judge')}" />
        <title>Судья</title>
    </head>
    <body>
            <!--a href="#show-judge" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a-->
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}">На главную</a></li>
                <li><g:link class="list" action="index">К списку судей</g:link></li>
                <li><g:link class="create" action="create">Добавить судью</g:link></li>
                </ul>
            </div>
            <div id="show-judge" class="content scaffold-show" role="main">
                <h1>Судья</h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <ol class="property-list judge">


                <g:if test="${judgeInstance?.num}">
                    <li class="fieldcontain">
                        <span id="num-label" class="property-label">Номер</span>

                        <span class="property-value" aria-labelledby="num-label"><g:fieldValue bean="${judgeInstance}" field="num"/></span>

                    </li>
                </g:if>

                <g:if test="${judgeInstance?.firstName}">
                    <li class="fieldcontain">
                        <span id="firstName-label" class="property-label">Имя</span>

                        <span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${judgeInstance}" field="firstName"/></span>

                    </li>
                </g:if>

            </ol>
            <g:form url="[resource:judgeInstance, action:'delete']" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${judgeInstance}">Редактировать</g:link>
                    <g:actionSubmit class="delete" action="delete" value="Удалить" onclick="return confirm('Вы уверены');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
