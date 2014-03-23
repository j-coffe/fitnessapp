<%@ page import="fitnessapp.Judge" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'judge.label', default: 'Judge')}" />
		<title>Редактировать судью</title>
	</head>
	<body>
		<!--a href="#edit-judge" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a-->
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}">На главную</a></li>
				<li><g:link class="list" action="index">К списку судей</g:link></li>
				<li><g:link class="create" action="create">Добавить судью</g:link></li>
			</ul>
		</div>
		<div id="edit-judge" class="content scaffold-edit" role="main">
			<h1>Редактировать судью</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${judgeInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${judgeInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:judgeInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${judgeInstance?.version}" />
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
