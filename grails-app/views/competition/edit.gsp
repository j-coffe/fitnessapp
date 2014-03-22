<%@ page import="fitnessapp.Competition" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'competition.label', default: 'Competition')}" />
        <title>Редактирование соревнования</title>
    </head>
    <body>
        <!--a href="#edit-competition" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a-->
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}">На главную</a></li>
                <li><g:link class="list" action="index">К списку соревнований</g:link></li>
                <li><g:link class="create" action="create">Создать соревнование</g:link></li>
                </ul>
            </div>
            <div id="edit-competition" class="content scaffold-edit" role="main">
                <h1>Соревнование</h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${competitionInstance}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${competitionInstance}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                        </g:eachError>
                </ul>
            </g:hasErrors>
            <g:form url="[resource:competitionInstance, action:'update']" method="PUT" >
                <g:hiddenField name="version" value="${competitionInstance?.version}" />
                <fieldset class="form">
                    <g:render template="form"/>
                </fieldset>
                <fieldset class="buttons">
                    <g:actionSubmit class="save" action="update" value="Изменить" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
