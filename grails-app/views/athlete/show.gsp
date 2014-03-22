
<%@ page import="fitnessapp.Athlete" %>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'athlete.label', default: 'Athlete')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-athlete" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                                
			</ul>
		</div>
		<div id="show-athlete" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list athlete">
			
				<g:if test="${athleteInstance?.firstName}">
				<li class="fieldcontain">
					<span id="firstName-label" class="property-label"><g:message code="athlete.firstName.label" default="First Name" /></span>
					
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${athleteInstance}" field="firstName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${athleteInstance?.middleName}">
				<li class="fieldcontain">
					<span id="middleName-label" class="property-label"><g:message code="athlete.middleName.label" default="Middle Name" /></span>
					
						<span class="property-value" aria-labelledby="middleName-label"><g:fieldValue bean="${athleteInstance}" field="middleName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${athleteInstance?.secondName}">
				<li class="fieldcontain">
					<span id="secondName-label" class="property-label"><g:message code="athlete.secondName.label" default="Second Name" /></span>
					
						<span class="property-value" aria-labelledby="secondName-label"><g:fieldValue bean="${athleteInstance}" field="secondName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${athleteInstance?.birthday}">
				<li class="fieldcontain">
					<span id="birthday-label" class="property-label"><g:message code="athlete.birthday.label" default="Birthday" /></span>
					
						<span class="property-value" aria-labelledby="birthday-label"><g:formatDate date="${athleteInstance?.birthday}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${athleteInstance?.sex}">
				<li class="fieldcontain">
					<span id="sex-label" class="property-label"><g:message code="athlete.sex.label" default="Sex" /></span>
					
						<span class="property-value" aria-labelledby="sex-label"><g:formatBoolean boolean="${athleteInstance?.sex}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${athleteInstance?.height}">
				<li class="fieldcontain">
					<span id="height-label" class="property-label"><g:message code="athlete.height.label" default="Height" /></span>
					
						<span class="property-value" aria-labelledby="height-label"><g:fieldValue bean="${athleteInstance}" field="height"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${athleteInstance?.weight}">
				<li class="fieldcontain">
					<span id="weight-label" class="property-label"><g:message code="athlete.weight.label" default="Weight" /></span>
					
						<span class="property-value" aria-labelledby="weight-label"><g:fieldValue bean="${athleteInstance}" field="weight"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:athleteInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${athleteInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
