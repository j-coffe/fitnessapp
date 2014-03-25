
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
        $(".catSelect").change(function(){
        alert($( ".catSelect option:selected" ).text());
        ${session["categ"]}=$( ".catSelect option:selected" );
        });
    </r:script>

</head>

<body>
    <div class="nav" role="navigation">

        <g:select class="catSelect" name="catSelect" from="${categs}" optionValue ="title" optionKey ="id" />

    </div>

    <div id="list-protocols" class="content scaffold-list" role="main">
        <g:link action="showIndex" id="1">Еще раз</g:link>
        </div>

</body>
</html>
