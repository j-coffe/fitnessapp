<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'judge.label', default: 'Judge')}" />
		<title>Добавление судьи</title>
	</head>
	<body>
		<a href="#create-judge" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}">На главную</a></li>
				<li><g:link class="list" action="index">К списку судей</g:link></li>
			</ul>
		</div>
		<div id="create-judge" class="content scaffold-create" role="main">
			<h1>Добавить судью к соревнованию </h1>
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
			<g:form url="[resource:judgeInstance, action:'save']" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="Добавить" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
