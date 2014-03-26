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
            <h1>${ccategory.title}</h1>

            <g:form url="[controller:'protocol', action:'saveAll']" method="POST" >
                <g:hiddenField name="version" value="${athleteInstance?.version}" />
                <fieldset class="form">
                    <table>
                        <tr>
                            <td>Ф.И.О. спортсмена</td>
                            <g:each var="judge" in="${judges.sort({it.num})}">
                                <td>Судья № ${judge.num}</td>
                            </g:each>
                            <g:each var="judge" in="${judges.sort({it.num})}">
                                <td>Судья № ${judge.num}</td>
                            </g:each>
                            <g:each var="atl" in="${ccategory.athleteccategory.athlete.sort({it.num})}">
                            <tr>
                                <td>${atl.num} ${atl.secondName} ${atl.firstName[0]}.${atl.middleName[0]}</td>
                                <g:each var="judge" in="${judges.sort({it.num})}">
                                    <g:set var="protocol" value="${ Protocol.findAllWhere(judge: judge, ccategory: ccategory, competition:competition) }" />
                                    <g:set var="apt" value="${AthletePoint.findAllWhere(athlete:atl,protocol:protocol[0])}" />
                                    <td style="background:rgba(0,0,255,0.1)">
                                        ${apt[0].id}
                                        <g:textField size="1" name="pp1_${apt[0].id}" required="" value="${apt[0].point1}"/>
                                    </td>
                                </g:each>
                                <g:each var="judge" in="${judges.sort({it.num})}">
                                    <g:set var="protocol" value="${ Protocol.findAllWhere(judge: judge, ccategory: ccategory, competition:competition) }" />
                                    <g:set var="apt" value="${AthletePoint.findAllWhere(athlete:atl,protocol:protocol[0])}" />
                                    <td style="background:rgba(255,0,0,0.1)">
                                        ${apt[0].id}
                                        <g:textField size="1" name="pp2_${apt[0].id}" required="" value="${apt[0].point2}"/>
                                    </td>
                                </g:each>
                            </tr>
                        </g:each>
                        </tr>
                    </table>
                </fieldset>
                <fieldset class="buttons">
                    <g:actionSubmit class="save" action="saveAll" value="Принять" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
