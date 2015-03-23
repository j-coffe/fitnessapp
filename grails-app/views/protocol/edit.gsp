<%@ page import="fitnessapp.Protocol" %>
<%@ page import="fitnessapp.AthletePoint" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">

        <title>Редактировать протокол</title>

    </head>
    <body>

        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}">На главную</a></li>

            </ul>
        </div>
        <div id="edit-athlete" class="content scaffold-edit" role="main">
            <h1>${ccategory?.title}</h1>

            <g:form url="[controller:'protocol', action:'saveAll']" method="POST" >
                <g:hiddenField name="version" value="${athleteInstance?.version}" />
                <fieldset class="form">
                    <table>
                        <tr>
                            <th>Ф.И.О. спортсмена</th>
                            <g:each var="judge" in="${judges.sort({it.num})}">
                                <th>Судья № ${judge.num}</th>
                            </g:each>
                        </tr>
                       
                        <g:each var="atl" in="${round==1?ccategory.athleteccategory.athlete.sort({it.num}):myshortlistofathletes.sort({it.num})}">
                            <tr>
                                <td>${atl.num} ${atl.secondName} ${atl.firstName[0]}.${atl.middleName[0]}</td>
                                <g:each var="judge" in="${judges.sort({it.num})}">
                                    <g:set var="protocol" value="${ Protocol.findAllWhere(judge: judge, ccategory: ccategory, competition:competition) }" />
                                    <g:set var="apt" value="${AthletePoint.findAllWhere(athlete:atl,protocol:protocol[0])}" />
                                    <td style="background:rgba(0,0,255,0.1)">                                     
                                        <g:if test="${round==1}">
                                            <g:textField size="2" name="pp1_${apt[0].id}" required="" value="${apt[0].point1}"/>
                                        </g:if>
                                        <g:else>
                                            <g:textField size="2" name="pp2_${apt[0].id}" required="" value="${apt[0].point2}"/>
                                        </g:else>
                                    </td>
                                </g:each>
                            </tr>
                        </g:each>                        
                    </table>
                </fieldset>
                <fieldset class="buttons">
                    <g:actionSubmit class="save" action="saveAll" value="Принять" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
