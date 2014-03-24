
<%@ page import="fitnessapp.Athlete" %>
<%@ page import="fitnessapp.Competition" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'athlete.label', default: 'Athlete')}" />
        <title>Участники соревнований</title>
    </head>
    <body>
        <a href="#list-athlete" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <!--li><a class="home" href="${createLink(uri: '/')}">На главную</a></li-->
                <li><g:link controller="competition" action="show" id="${session['competition'].id}">К соревнованию</g:link></li>
                <li><g:link class="create" action="create">Добавить участника</g:link></li>

            </ul>
        </div>
        <div id="list-athlete" class="content scaffold-list" role="main">
            <h1>Участники соревнований: ${session["competition"]?.title} 
                <g:formatDate format="yyyy-MM-dd" date="${session["competition"]?.date}" /></h1>
                <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table>
                <thead>
                    <tr>
                        <g:sortableColumn property="num" title="Номер" />

                        <g:sortableColumn property="firstName" title="Имя" />

                        <g:sortableColumn property="middleName" title="Отчество" />

                        <g:sortableColumn property="secondName" title="Фамилия" />

                        <g:sortableColumn property="birthday" title="Дата рождения" />

                        <g:sortableColumn property="sex" title="Пол" />

                        <g:sortableColumn property="height" title="Рост, см" />

                        <g:sortableColumn property="weight" title="Вес, кг" />
                        
                        <g:sortableColumn property="city" title="Город" />

                    </tr>
                </thead>
                <tbody>
                    <g:each in="${athleteInstanceList}" status="i" var="athleteInstance">
                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                            <td>${fieldValue(bean: athleteInstance, field: "num")}</td>

                            <td><g:link action="show" id="${athleteInstance.id}">${fieldValue(bean: athleteInstance, field: "firstName")}</g:link></td>

                            <td>${fieldValue(bean: athleteInstance, field: "middleName")}</td>

                            <td>${fieldValue(bean: athleteInstance, field: "secondName")}</td>

                            <td><g:formatDate format="yyyy-MM-dd" date="${athleteInstance.birthday}" /></td>

                            <td><g:formatBoolean true="муж." false="жен." boolean="${athleteInstance.sex}" /></td>

                            <td>${fieldValue(bean: athleteInstance, field: "height")}</td>
                            
                            <td>${fieldValue(bean: athleteInstance, field: "weight")}</td>
                            
                            <td>${fieldValue(bean: athleteInstance, field: "city")}</td>

                        </tr>
                    </g:each>
                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${athleteInstanceCount ?: 0}" />
            </div>
        </div>
    </body>
</html>
