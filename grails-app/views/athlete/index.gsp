
<%@ page import="fitnessapp.Athlete" %>
<%@ page import="fitnessapp.Competition" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'athlete.label', default: 'Athlete')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-athlete" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                                ${session["competition"]}
			</ul>
		</div>
		<div id="list-athlete" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="firstName" title="${message(code: 'athlete.firstName.label', default: 'First Name')}" />
					
						<g:sortableColumn property="middleName" title="${message(code: 'athlete.middleName.label', default: 'Middle Name')}" />
					
						<g:sortableColumn property="secondName" title="${message(code: 'athlete.secondName.label', default: 'Second Name')}" />
					
						<g:sortableColumn property="birthday" title="${message(code: 'athlete.birthday.label', default: 'Birthday')}" />
					
						<g:sortableColumn property="sex" title="${message(code: 'athlete.sex.label', default: 'Sex')}" />
					
						<g:sortableColumn property="height" title="${message(code: 'athlete.height.label', default: 'Height')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${athleteInstanceList}" status="i" var="athleteInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${athleteInstance.id}">${fieldValue(bean: athleteInstance, field: "firstName")}</g:link></td>
					
						<td>${fieldValue(bean: athleteInstance, field: "middleName")}</td>
					
						<td>${fieldValue(bean: athleteInstance, field: "secondName")}</td>
					
						<td><g:formatDate date="${athleteInstance.birthday}" /></td>
					
						<td><g:formatBoolean boolean="${athleteInstance.sex}" /></td>
					
						<td>${fieldValue(bean: athleteInstance, field: "height")}</td>
					
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
