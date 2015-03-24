<%@ page import="fitnessapp.Judge" %>



<!--div class="fieldcontain ${hasErrors(bean: judgeInstance, field: 'competition', 'error')} required">
	<label for="competition">
		<g:message code="judge.competition.label" default="Competition" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="competition" name="competition.id" from="${fitnessapp.Competition.list()}" optionKey="id" required="" value="${judgeInstance?.competition?.id}" class="many-to-one"/>

</div-->

<div class="fieldcontain ${hasErrors(bean: judgeInstance, field: 'num', 'error')} required">
	<label for="num">
		Номер
		<span class="required-indicator">*</span>
	</label>
	<g:field name="num" type="number" required="" value="${params.maxnum}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: judgeInstance, field: 'firstName', 'error')} ">
	<label for="firstName">
		Имя
		
	</label>
	<g:textField name="firstName" value="${judgeInstance?.firstName}"/>

</div>
<!--
<div class="fieldcontain ${hasErrors(bean: judgeInstance, field: 'middleName', 'error')} ">
	<label for="middleName">
		Отчество
		
	</label>
	<g:textField name="middleName" value="${judgeInstance?.middleName}"/>

</div>



<div class="fieldcontain ${hasErrors(bean: judgeInstance, field: 'secondName', 'error')} ">
	<label for="secondName">
		Фамилия
		
	</label>
	<g:textField name="secondName" value="${judgeInstance?.secondName}"/>

</div>
-->
