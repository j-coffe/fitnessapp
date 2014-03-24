<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'athleteCCategory.label', default: 'AthleteCCategory')}" />
		<title>Добавить участнику категории</title>
	</head>
	<body>
		<!--a href="#create-athleteCCategory" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a-->
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}">На главную</a></li>
				<li><g:link class="list" action="index">К списку категорий участника</g:link></li>
			</ul>
		</div>
		<div id="create-athleteCCategory" class="content scaffold-create" role="main">
			<h1>Участник ${session["athlete"].firstName} ${session["athlete"].secondName}</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${athleteCCategoryInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${athleteCCategoryInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:athleteCCategoryInstance, action:'save']" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="Добавить выделенные" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
