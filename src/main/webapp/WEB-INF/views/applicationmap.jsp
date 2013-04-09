<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
{
"graphdata" : {
	"nodes" : [
	<c:forEach items="${nodes}" var="node" varStatus="status">
	    {
		    "name" : "${node.applicationName}",
		    "hosts" : [
		    <c:forEach items="${node.hosts}" var="host" varStatus="status2">
		        "${host}"
		        <c:if test="${!status2.last}">,</c:if>
		    </c:forEach>
		    ],
		    "serviceType" : "${node.serviceType.desc}",
		    "terminal" : "${node.serviceType.terminal}",
		    "agents" : [
		    <c:forEach items="${node.agents}" var="agent" varStatus="status3">
		        ${agent.json}
		        <c:if test="${!status3.last}">,</c:if>
		    </c:forEach>
		    ]
	    } <c:if test="${!status.last}">,</c:if>
	</c:forEach>
	],
	"links" : [
	<c:forEach items="${links}" var="link" varStatus="status">
	    {
			"source" : ${link.from.sequence},
			"target" : ${link.to.sequence},
			"sourceinfo" : ${link.from.json},
			"targetinfo" : ${link.to.json},
			"value" : ${link.histogram.totalCount},
			"error" : ${link.histogram.errorCount},
			"slow" : ${link.histogram.slowCount},
			"histogram" : ${link.histogram}
		} <c:if test="${!status.last}">,</c:if>
	</c:forEach>
	]
	}
}