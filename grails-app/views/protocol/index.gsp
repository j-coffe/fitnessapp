
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
            $.ajax({ url:"${createLink(controller:'protocol', action: 'getAthletesByCatId', )}/"+ <% if (flash.categ == null)%>$( ".catSelect option:selected" ).val()  <% else %> ${flash.categ} })
        .done(function(json){
        $('#list tbody').empty();
        var tr;
            for (i in json){
            tr += '<tr><td>' + json[i].athleteNum + '</td><td>' + json[i].athleteFIO + '</td><td>' + json[i].point1 + '</td><td>' + json[i].point2 + '</td><td>' + json[i].summ + '</td><td>' + (parseInt(i)+1) + '</td><tr>';
            }
            $('#list tbody').append(tr);
            var pr_link_url = $('.pr_link').attr('href');
            var pr_link_url2 = $('.pr_link2').attr('href');
            $('.pr_link').attr('href', pr_link_url.split('?')[0]+'?category_id='+ $('.catSelect option:selected').val()+'&round=1' );
            $('.pr_link2').attr('href', pr_link_url2.split('?')[0]+'?category_id='+ $('.catSelect option:selected').val()+'&round=2' );
        });
       
        <g:if test="${flash.categ != null}">
  $( ".catSelect" ).val(${flash.categ})
</g:if>
        $(".catSelect").change(function(){
       <!-- alert($( ".catSelect option:selected" ).val());-->

        $.ajax({ url:"${createLink(controller:'protocol', action: 'getAthletesByCatId', )}/"+$( ".catSelect option:selected" ).val() })
        .done(function(json){
        $('#list tbody').empty();
        var tr;
            for (i in json){
            tr += '<tr><td>' + json[i].athleteNum + '</td><td>' + json[i].athleteFIO + '</td><td>' + json[i].point1 + '</td><td>' + json[i].point2 + '</td><td>' + json[i].summ + '</td><td>' + (parseInt(i)+1) + '</td><tr>';
            }
            $('#list tbody').append(tr);
            var pr_link_url = $('.pr_link').attr('href');
            var pr_link_url2 = $('.pr_link2').attr('href');
            $('.pr_link').attr('href', pr_link_url.split('?')[0]+'?category_id='+ $('.catSelect option:selected').val()+'&round=1' );
            $('.pr_link2').attr('href', pr_link_url2.split('?')[0]+'?category_id='+ $('.catSelect option:selected').val()+'&round=2' );
        });
        })
        })
    </g:javascript>
    
</head>
<body>
    <div class="nav" role="navigation">
        <ul>
                <li><a class="home" href="${createLink(uri: '/')}">На главную</a></li>
                
                </ul>
            </div>
        <g:select class="catSelect" name="catSelect" from="${categs}" optionValue ="title" optionKey ="id" />
        
        <g:link class="pr_link" controller="protocol" action="edit" params="[category_id:'', round:'']">Редактировать протокол 1</g:link>
        <g:link class="pr_link2" controller="protocol" action="edit" params="[category_id:'',round:'']">Редактировать протокол 2</g:link>
        

    </div>
    

    <div id="list-protocols" class="content scaffold-list" role="main">
        <table id="list"><thead>                    
                    <tr>
                        <g:sortableColumn property="athleteNum" title="№" />
                        <g:sortableColumn property="athleteFIO" title="ФИО Участника" />
                        <g:sortableColumn property="point1" title="Оценка 1й выход" />
                        <g:sortableColumn property="point2" title="Оценка 2й выход" />
                        <g:sortableColumn property="sum" title="Сумма" />
                        <g:sortableColumn property="win" title="Место" />
                    </tr></thead><tbody></table>   
        <div id="pager"></div> 
    </div>

</body>
</html>
