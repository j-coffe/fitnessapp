<%@ page import="fitnessapp.Athlete" %>



<div class="fieldcontain ${hasErrors(bean: athleteInstance, field: 'birthday', 'error')} required">
	<label for="birthday">
		<g:message code="athlete.birthday.label" default="Birthday" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="birthday" precision="day"  value="${athleteInstance?.birthday}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: athleteInstance, field: 'city', 'error')} ">
	<label for="city">
		<g:message code="athlete.city.label" default="City" />
		
	</label>
	<g:textField name="city" value="${athleteInstance?.city}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: athleteInstance, field: 'firstName', 'error')} ">
	<label for="firstName">
		<g:message code="athlete.firstName.label" default="First Name" />
		
	</label>
	<g:textField name="firstName" value="${athleteInstance?.firstName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: athleteInstance, field: 'height', 'error')} required">
	<label for="height">
		<g:message code="athlete.height.label" default="Height" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="height" value="${fieldValue(bean: athleteInstance, field: 'height')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: athleteInstance, field: 'middleName', 'error')} ">
	<label for="middleName">
		<g:message code="athlete.middleName.label" default="Middle Name" />
		
	</label>
	<g:textField name="middleName" value="${athleteInstance?.middleName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: athleteInstance, field: 'secondName', 'error')} ">
	<label for="secondName">
		<g:message code="athlete.secondName.label" default="Second Name" />
		
	</label>
	<g:textField name="secondName" value="${athleteInstance?.secondName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: athleteInstance, field: 'sex', 'error')} ">
	<label for="sex">
		<g:message code="athlete.sex.label" default="Sex" />
		
	</label>
	<g:checkBox name="sex" value="${athleteInstance?.sex}" />

</div>

<div class="fieldcontain ${hasErrors(bean: athleteInstance, field: 'weight', 'error')} required">
	<label for="weight">
		<g:message code="athlete.weight.label" default="Weight" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="weight" value="${fieldValue(bean: athleteInstance, field: 'weight')}" required=""/>

</div>

