<%@ page import="fitnessapp.Athlete" %>



<div class="fieldcontain ${hasErrors(bean: athleteInstance, field: 'num', 'error')} required">
	<label for="num">
		Номер
		<span class="required-indicator">*</span>
	</label>
	<g:field name="num" type="number" required="" value="${params.maxnum}"/>

</div>
<div class="fieldcontain ${hasErrors(bean: athleteInstance, field: 'secondName', 'error')} required">
	<label for="secondName">
		Фамилия
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="secondName" required="" value="${athleteInstance?.secondName}"/>

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


<div class="fieldcontain ${hasErrors(bean: athleteInstance, field: 'birthday', 'error')} ">
	<label for="birthday">
		День рождения
		
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

<div class="fieldcontain ${hasErrors(bean: athleteInstance, field: 'height', 'error')} ">
	<label for="height">
		Рост
		
	</label>
	<g:field name="height" value="${fieldValue(bean: athleteInstance, field: 'height')}" />

</div>

<div class="fieldcontain ${hasErrors(bean: athleteInstance, field: 'weight', 'error')} ">
	<label for="weight">
		Вес
		
	</label>
	<g:field name="weight" value="${fieldValue(bean: athleteInstance, field: 'weight')}" />

</div>

<div class="fieldcontain ${hasErrors(bean: athleteInstance, field: 'city', 'error')} required">
	<label for="city">
		Город
		<span class="required-indicator">*</span>
	</label>
	<g:field name="city" value="${fieldValue(bean: athleteInstance, field: 'city')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: athleteInstance, field: 'coachName', 'error')} required">
	<label for="coachName">
		Город
		<span class="required-indicator">*</span>
	</label>
	<g:field name="coachName" value="${fieldValue(bean: athleteInstance, field: 'coachName')}" required=""/>

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
        style="width:180px"
        multiple="true"/>

</div>


