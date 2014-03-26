
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">

        <g:set var="comp" value="${session["competition"]}" />
        <g:set var="categs" value="${comp.ccategories.sort({it.title})}" />
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
            tr += '<tr><td>' + json[i].athleteFIO + '</td><td>' + json[i].point1 + '</td><td>' + json[i].point2 + '</td><tr>';
            }
            $('#list tbody').append(tr);
            var pr_link_url = $('.pr_link').attr('href');
            $('.pr_link').attr('href', pr_link_url.split('?')[0]+'?category_id='+ $('.catSelect option:selected').val() );
        });
        })
        })
    </g:javascript>
    
</head>
<body>
    <div class="nav" role="navigation">

        <g:select class="catSelect" name="catSelect" from="${categs}" optionValue ="title" optionKey ="id" />
        <g:link class="pr_link" controller="protocol" action="edit" params="[category_id:'']">Редактировать протокол</g:link>

    </div>

    <div id="list-protocols" class="content scaffold-list" role="main">
        <table id="list"><thead></thead><tbody></table>   
        <div id="pager"></div> 
    </div>

</body>
</html>
