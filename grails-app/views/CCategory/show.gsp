
<%@ page import="fitnessapp.CCategory" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'CCategory.label', default: 'CCategory')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-CCategory" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}">На главную</a></li>
                <li><g:link class="list" action="index">К списку категорий соревнования</g:link></li>
                <li><g:link class="create" action="create">Добавить категорию</g:link></li>
                <li><g:link class="create" action="createProtocol">Сгенерировать протоколы судей</g:link></li>
                </ul>
            </div>
            <div id="show-CCategory" class="content scaffold-show" role="main">
                <h1>Категория</h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <ol class="property-list CCategory">
                <g:if test="${CCategoryInstance?.title}">
                    <li class="fieldcontain">
                        <span id="title-label" class="property-label">Название</span>

                        <span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${CCategoryInstance}" field="title"/></span>

                    </li>
                </g:if>
                <g:if test="${CCategoryInstance?.numForPass}">
                    <li class="fieldcontain">
                        <span id="title-label" class="property-label">Сколько первых проходит</span>

                        <span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${CCategoryInstance}" field="numForPass"/></span>

                    </li>
                </g:if>
                
                    <li class="fieldcontain">
                        <span id="title-label" class="property-label">Суммировать туры</span>

                        <span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${CCategoryInstance}" field="summarize"/></span>

                    </li>
                
            </ol>
            <g:form url="[resource:CCategoryInstance, action:'delete']" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${CCategoryInstance}">Редактировать</g:link>
                    <g:actionSubmit class="delete" action="delete" value="Удалить" onclick="return confirm('Вы уверены?');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
