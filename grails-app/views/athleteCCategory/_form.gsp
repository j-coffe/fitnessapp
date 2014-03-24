<%@ page import="fitnessapp.AthleteCCategory" %>
<%@ page import="fitnessapp.Athlete" %>



<!--div class="fieldcontain ${hasErrors(bean: athleteCCategoryInstance, field: 'athlete', 'error')} required">
	<label for="athlete">
		<g:message code="athleteCCategory.athlete.label" default="Athlete" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="athlete" name="athlete.id" from="${fitnessapp.Athlete.list()}" optionKey="id" required="" value="${athleteCCategoryInstance?.athlete?.id}" class="many-to-one"/>

</div-->

<div class="fieldcontain ${hasErrors(bean: athleteCCategoryInstance, field: 'ccategory', 'error')} required">
	<label for="ccategory">
		Категории
		<span class="required-indicator">*</span>
	</label>
        
	<g:select id="ccategory" name="ccategory.id" 
        from="${ fitnessapp.CCategory.list().findAll({  it.competition.id==session["competition"].id  }).minus( fitnessapp.Athlete.findById(session['athlete'].id).athleteccategory.ccategory) }" 
        optionKey="id"
        optionValue="title" 
        required=""
        value="${athleteCCategoryInstance?.ccategory?.id}" class="many-to-one"
            multiple="true"/>

</div>

