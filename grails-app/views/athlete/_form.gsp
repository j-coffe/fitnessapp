<%@ page import="fitnessapp.Athlete" %>


<div class="fieldcontain ${hasErrors(bean: athleteInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="athlete.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" required="" value="${athleteInstance?.firstName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: athleteInstance, field: 'middleName', 'error')} required">
	<label for="middleName">
		<g:message code="athlete.middleName.label" default="Middle Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="middleName" required="" value="${athleteInstance?.middleName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: athleteInstance, field: 'secondName', 'error')} required">
	<label for="secondName">
		<g:message code="athlete.secondName.label" default="Second Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="secondName" required="" value="${athleteInstance?.secondName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: athleteInstance, field: 'birthday', 'error')} required">
	<label for="birthday">
		<g:message code="athlete.birthday.label" default="Birthday" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="birthday" precision="day"  value="${athleteInstance?.birthday}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: athleteInstance, field: 'sex', 'error')} ">
	<label for="sex">
		<g:message code="athlete.sex.label" default="Sex" />
		
	</label>
	<g:checkBox name="sex" value="${athleteInstance?.sex}" />

</div>

<div class="fieldcontain ${hasErrors(bean: athleteInstance, field: 'height', 'error')} required">
	<label for="height">
		<g:message code="athlete.height.label" default="Height" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="height" value="${fieldValue(bean: athleteInstance, field: 'height')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: athleteInstance, field: 'weight', 'error')} required">
	<label for="weight">
		<g:message code="athlete.weight.label" default="Weight" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="weight" value="${fieldValue(bean: athleteInstance, field: 'weight')}" required=""/>

</div>

