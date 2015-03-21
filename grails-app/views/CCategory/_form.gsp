<%@ page import="fitnessapp.CCategory" %>

<div class="fieldcontain ${hasErrors(bean: CCategoryInstance, field: 'title', 'error')} ">
    <div class="fieldcontain required">
        <label for="title">
            Название
            <span class="required-indicator">*</span>
        </label>

        <g:textField name="title" value="${CCategoryInstance?.title}"/>
    </div>

    <div class="fieldcontain required">
        <label for="numForPass">
            Сколько первых проходит
            <span class="required-indicator">*</span>
        </label>

        <g:field name="numForPass" type="number" value="${CCategoryInstance?.numForPass}"/>
    </div>

    <div class="fieldcontain required">
        <label for="summarize">
            Суммировать туры
            <span class="required-indicator">*</span>
        </label>

        <g:checkBox name="summarize" type="boolean" value="${CCategoryInstance?.summarize}" />
    </div>



</div>

