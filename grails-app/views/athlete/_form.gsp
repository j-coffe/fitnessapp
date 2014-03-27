<%@ page import="fitnessapp.Athlete" %>

<div class="fieldcontain ${hasErrors(bean: athleteInstance, field: 'num', 'error')} required">
	<label for="num">
		Номер
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="num" required="" value="${athleteInstance?.num}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: athleteInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		Имя
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" required="" value="${athleteInstance?.firstName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: athleteInstance, field: 'middleName', 'error')} required">
	<label for="middleName">
		Отчество
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="middleName" required="" value="${athleteInstance?.middleName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: athleteInstance, field: 'secondName', 'error')} required">
	<label for="secondName">
		Фамилия
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="secondName" required="" value="${athleteInstance?.secondName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: athleteInstance, field: 'birthday', 'error')} required">
	<label for="birthday">
		День рождения
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="birthday" precision="day"  value="${athleteInstance?.birthday}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: athleteInstance, field: 'sex', 'error')} ">
	<label for="sex">
		Пол
		
	</label>
        <g:select  name="sex" from="${['муж.','жен.']}" keys="${[true,false]}" value="${athleteInstance?.sex}" required=""/>
	<!--g:checkBox name="sex" value="${athleteInstance?.sex}" /-->

</div>

<div class="fieldcontain ${hasErrors(bean: athleteInstance, field: 'height', 'error')} required">
	<label for="height">
		Рост
		<span class="required-indicator">*</span>
	</label>
	<g:field name="height" value="${fieldValue(bean: athleteInstance, field: 'height')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: athleteInstance, field: 'weight', 'error')} required">
	<label for="weight">
		Вес
		<span class="required-indicator">*</span>
	</label>
	<g:field name="weight" value="${fieldValue(bean: athleteInstance, field: 'weight')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: athleteInstance, field: 'city', 'error')} required">
	<label for="city">
		Город
		<span class="required-indicator">*</span>
	</label>
	<g:field name="city" value="${fieldValue(bean: athleteInstance, field: 'city')}" required=""/>

</div>

<div class="fieldcontain required">
	<label for="ccategory">
		Категории
		<span class="required-indicator">*</span>
	</label>
        <!-- .minus( athleteInstance?.athleteccategory?.ccategory).sort({it.title}) -->
	<g:select id="ccategory" name="ccategory.id" 
        from="${ fitnessapp.Competition.findById(session['competition' ].id).ccategories.sort({it.title}) }" 
        optionKey="id"
        optionValue="title" 
        required=""
        value="${ athleteInstance?.athleteccategory?.ccategory?.id }"
        class="many-to-one"
        multiple="true"/>

</div>


