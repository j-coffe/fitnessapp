<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
    <r:require modules="jquery-ui"/>
    <jqgrid:resources />
    <g:set var="comp" value="${session["competition"]}" />
    <g:set var="categs" value="${comp.ccategories}" />
    <title>${comp.title}</title>

    <g:javascript library="jquery" />
    <r:script>
        $(document).ready(function()
        {
        <jqgrid:grid
        id="protocols"
        url="'${createLink(action: 'listJSON')}'"
        editurl="'${createLink(action: 'editJSON')}'"
        colNames="'First Name', 'Last Name', 'E-mail', 'Phone', 'id'"
        colModel="{name:'firstName', editable: true},
        {name:'lastName', editable: true},
        {name:'email', editable: true},
        {name:'phone', editable: true},
        {name:'id', hidden: true}"
        sortname="'lastName'"
        caption="'Contact List'"
        height="300"
        autowidth="true"
        scrollOffset="0"
        viewrecords="true"
        showPager="true"
        datatype="'json'">
        <jqgrid:filterToolbar id="protocols" searchOnEnter="false" />
        <jqgrid:navigation id="contact" add="true" edit="true" 
        del="true" search="true" refresh="true" />
        <jqgrid:resize id="protocols" resizeOffset="-2" />
    </jqgrid:grid>
    });
</r:script>
</head>

<body>
    <div class="nav" role="navigation">

        <g:select name="currCategory" from="${categs}" optionValue ="title" optionKey ="id" />

    </div>

    <div id="list-protocols" class="content scaffold-list" role="main">
        <jqgrid:wrapper id="protocols"/>
    </div>

</body>
</html>
