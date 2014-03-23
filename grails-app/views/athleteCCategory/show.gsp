
<%@ page import="fitnessapp.AthleteCCategory" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'athleteCCategory.label', default: 'AthleteCCategory')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-athleteCCategory" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-athleteCCategory" class="content scaffold-show" role="main">
			<h1>Участник: ${session["athlete"].num} ${session["athlete"].firstName} ${session["athlete"].secondName}</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list athleteCCategory">
			
				
			
				<g:if test="${athleteCCategoryInstance?.ccategory}">
				<li class="fieldcontain">
					<span id="ccategory-label" class="property-label">Категория</span>
					
						<span class="property-value" aria-labelledby="ccategory-label"><g:link controller="CCategory" action="show" id="${athleteCCategoryInstance?.ccategory?.id}">${athleteCCategoryInstance?.ccategory?.title}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:athleteCCategoryInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${athleteCCategoryInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
