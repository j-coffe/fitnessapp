<%@ page import="fitnessapp.Competition" %>



<div class="fieldcontain ${hasErrors(bean: competitionInstance, field: 'title', 'error')} ">
    <label for="title">
        Название
    </label>
    <span class="required-indicator">*</span>
    <g:textField name="title" value="${competitionInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: competitionInstance, field: 'date', 'error')} required">
    <label for="date">
        Дата проведения
        <span class="required-indicator">*</span>
    </label>
   <!-- <g:datePicker name="date" precision="day"  value="${competitionInstance?.date}"  />-->
    <g:textField name="date" id="datepicker" value="${competitionInstance?.date}"/>

</div>

<!--div class="fieldcontain ${hasErrors(bean: competitionInstance, field: 'athletes', 'error')} ">
    <label for="athletes">
        <g:message code="competition.athletes.label" default="Athletes" />

    </label>
    <g:select name="athletes" from="${fitnessapp.Athlete.list()}" multiple="multiple" optionKey="id" size="5" value="${competitionInstance?.athletes*.id}" class="many-to-many"/>

</div-->

