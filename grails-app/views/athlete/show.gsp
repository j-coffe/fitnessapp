
<%@ page import="fitnessapp.Athlete" %>

<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'athlete.label', default: 'Athlete')}" />
        <title>Участник</title>
    </head>
    <body>
        <!--a href="#show-athlete" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a-->
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}">На главную</a></li>
                <li><g:link class="list" action="index">К списку участников</g:link></li>
                <li><g:link class="create" action="create">Зарегестрировать участника</g:link></li>
                <li><g:link class="list" controller="athleteCCategory" action="index">Добавить участнику категорию</g:link></li>
                <li><g:link action="show" controller="competition" id="${session['competition'].id}">К соревнованию</g:link></li>

            </ul>
        </div>
        <div id="show-athlete" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <ol class="property-list athlete">


                <g:if test="${athleteInstance?.num}">
                    <li class="fieldcontain">
                        <span id="num-label" class="property-label">Номер</span>

                        <span class="property-value" aria-labelledby="num-label"><g:fieldValue bean="${athleteInstance}" field="num"/></span>

                    </li>
                </g:if>

                <g:if test="${athleteInstance?.firstName}">
                    <li class="fieldcontain">
                        <span id="firstName-label" class="property-label">Имя</span>

                        <span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${athleteInstance}" field="firstName"/></span>

                    </li>
                </g:if>

                <g:if test="${athleteInstance?.middleName}">
                    <li class="fieldcontain">
                        <span id="middleName-label" class="property-label">Отчество</span>

                        <span class="property-value" aria-labelledby="middleName-label"><g:fieldValue bean="${athleteInstance}" field="middleName"/></span>

                    </li>
                </g:if>

                <g:if test="${athleteInstance?.secondName}">
                    <li class="fieldcontain">
                        <span id="secondName-label" class="property-label">Фамилия</span>

                        <span class="property-value" aria-labelledby="secondName-label"><g:fieldValue bean="${athleteInstance}" field="secondName"/></span>

                    </li>
                </g:if>

                <g:if test="${athleteInstance?.birthday}">
                    <li class="fieldcontain">
                        <span id="birthday-label" class="property-label">День рождения</span>

                        <span class="property-value" aria-labelledby="birthday-label"><g:formatDate date="${athleteInstance?.birthday}" /></span>

                    </li>
                </g:if>

                <!--g:if test="${athleteInstance?.sex}"-->
                    <li class="fieldcontain">
                        <span id="sex-label" class="property-label">Пол</span>

                        <span class="property-value" aria-labelledby="sex-label"><g:formatBoolean true="муж." false="жен." boolean="${athleteInstance?.sex}" /></span>

                    </li>
                <!--/g:if-->

                <g:if test="${athleteInstance?.height}">
                    <li class="fieldcontain">
                        <span id="height-label" class="property-label">Рост</span>

                        <span class="property-value" aria-labelledby="height-label"><g:fieldValue bean="${athleteInstance}" field="height"/></span>

                    </li>
                </g:if>

                <g:if test="${athleteInstance?.weight}">
                    <li class="fieldcontain">
                        <span id="weight-label" class="property-label">Вес</span>

                        <span class="property-value" aria-labelledby="weight-label"><g:fieldValue bean="${athleteInstance}" field="weight"/></span>

                    </li>
                </g:if>
                
                 <g:if test="${athleteInstance?.city}">
                    <li class="fieldcontain">
                        <span id="city-label" class="property-label">Город</span>

                        <span class="property-value" aria-labelledby="city-label"><g:fieldValue bean="${athleteInstance}" field="city"/></span>

                    </li>
                </g:if>
                
                <g:if test="${athleteInstance?.athleteccategory?.ccategory?.title}">
                    <li class="fieldcontain">
                        <span id="city-label" class="property-label">Список категорий</span>

                        <span class="property-value" aria-labelledby="city-label"><g:fieldValue bean="${athleteInstance?.athleteccategory?.ccategory.sort({it.title})}" field="title"/></span>

                    </li>
                </g:if>

            </ol>
            <g:form url="[resource:athleteInstance, action:'delete']" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${athleteInstance}">Редактировать</g:link>
                    <g:actionSubmit class="delete" action="delete" value="Удалить" onclick="return confirm('Вы уверены?');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
