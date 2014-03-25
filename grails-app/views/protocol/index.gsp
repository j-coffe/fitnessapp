
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">

    <g:set var="comp" value="${session["competition"]}" />
    <g:set var="categs" value="${comp.ccategories}" />
    <title>${comp.title}</title>

  
    <jq:resources />
    <jqui:resources /> 
    <jqgrid:resources />
    <g:javascript>
        $(document).ready(function(){
        $(".catSelect").change(function(){
       <!-- alert($( ".catSelect option:selected" ).val());-->
        
        $.ajax({ url:"${createLink(controller:'protocol', action: 'getAthletesByCatId', )}/"+$( ".catSelect option:selected" ).val() })
        .done(function(json){
        $('#list tbody').empty();
        var tr;
            for (i in json){
            tr += '<tr><td>' + json[i].firstName + '</td><td>' + json[i].secondName + '</td><tr>';
            }
            $('#list tbody').append(tr);
        });
        })
        })
    </g:javascript>
    
</head>

<body>
    <div class="nav" role="navigation">

        <g:select class="catSelect" name="catSelect" from="${categs}" optionValue ="title" optionKey ="id" />

    </div>

    <div id="list-protocols" class="content scaffold-list" role="main">
        <table id="list"><thead></thead><tbody></table>   
    <div id="pager"></div> 
    </div>

</body>
</html>
