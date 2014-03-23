<%@ page import="fitnessapp.CCategory" %>

<div class="fieldcontain ${hasErrors(bean: CCategoryInstance, field: 'title', 'error')} ">
    <label for="title">
        Название
    </label>
    <span class="required-indicator">*</span>
    <g:textField name="title" value="${CCategoryInstance?.title}"/>

</div>

