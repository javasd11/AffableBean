<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>--%>

<%-- <sql:query var="categories" dataSource="jdbc/beanSource">
    SELECT * FROM category
</sql:query> --%>

<c:set var='view' value='/index' scope='session' />
<div id="indexLeftColumn">
    <div id="welcomeText">
        <h2><fmt:message key='greeting'/></h2>
        <p><fmt:message key='introText'/></p>
    </div>

</div>

<div id="indexRightColumn">
    <%--<c:forEach var="category" items="${categories.rows}">--%>
    <c:forEach var="category" items="${applicationScope.categories}">
        <div class="categoryBox">
             <a href="<c:url value='category?${category.id}'/>">  
                 <span class="categoryLabel"></span>
                <span class="categoryLabelText"><fmt:message key='${category.name}'/></span>
                <img src="${initParam.categoryImagePath}${category.name}.jpg"alt="<fmt:message key='${category.name}'/>">
            </a>
        </div>
    </c:forEach>

</div>