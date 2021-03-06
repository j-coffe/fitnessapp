<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
    <r:require modules="jquery-ui"/>
    <g:set var="entityName" value="${message(code: 'competition.label', default: 'Competition')}" />
    <title>Создать соревнование</title>
    <g:javascript library="jquery" />
    <r:script>
        $(document).ready(function()
        {
        $("#datepicker").datepicker({dateFormat: 'yy-mm-dd'});
        })
    </r:script>
</head>
<body>
        <!--a href="#create-competition" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a-->
    <div class="nav" role="navigation">
        <ul>
            <li><a class="home" href="${createLink(uri: '/')}">На главную</a></li>
            <li><g:link class="list" action="index">К списку соревнований</g:link></li>
            </ul>
        </div>
        <div id="create-competition" class="content scaffold-create" role="main">
            <h1>Создать соревнования</h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${competitionInstance}">
            <ul class="errors" role="alert">
                <g:eachError bean="${competitionInstance}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                    </g:eachError>
            </ul>
        </g:hasErrors>
        <g:form url="[resource:competitionInstance, action:'save']" >
            <fieldset class="form">
                <g:render template="form"/>             
            </fieldset>
            <fieldset class="buttons">
                <g:submitButton name="create" class="save" value="Добавить" />
            </fieldset>
        </g:form>
    </div>

</body>

</html>
